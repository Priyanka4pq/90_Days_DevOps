# Day 13 – Linux Volume Management (LVM)

## Objective

Learn how Linux Logical Volume Manager (LVM) works by creating Physical Volumes (PV), Volume Groups (VG), Logical Volumes (LV), formatting them, mounting them, and extending storage without repartitioning.

---

## Commands Used

### 1. Switch to Root User

```bash
sudo -i
```

---

### 2. Create a Virtual Disk (if no extra disk is available)

```bash
dd if=/dev/zero of=/tmp/disk1.img bs=1M count=1024
losetup -fP /tmp/disk1.img
losetup -a
```

---

### 3. Check Current Storage

```bash
lsblk
pvs
vgs
lvs
df -h
```

---

### 4. Create Physical Volume (PV)

```bash
pvcreate /dev/loop0
```

*(Replace `/dev/loop0` with your actual loop device or `/dev/sdb` if using a real disk.)*

Verify:

```bash
pvs
```

---

### 5. Create Volume Group (VG)

```bash
vgcreate devops-vg /dev/loop0
```

Verify:

```bash
vgs
```

---

### 6. Create Logical Volume (LV)

```bash
lvcreate -L 500M -n app-data devops-vg
```

Verify:

```bash
lvs
```

---

### 7. Format the Logical Volume

```bash
mkfs.ext4 /dev/devops-vg/app-data
```

---

### 8. Mount the Logical Volume

```bash
mkdir -p /mnt/app-data

mount /dev/devops-vg/app-data /mnt/app-data
```

Verify:

```bash
df -h /mnt/app-data
```

---

### 9. Extend the Logical Volume

```bash
lvextend -L +200M /dev/devops-vg/app-data
```

Resize the filesystem:

```bash
resize2fs /dev/devops-vg/app-data
```

Verify:

```bash
df -h /mnt/app-data
```

---

## Screenshots

Add screenshots of the following command outputs:

- `lsblk`
- `pvs`
- `vgs`
- `lvs`
- `df -h`
- `pvcreate`
- `vgcreate`
- `lvcreate`
- `mkfs.ext4`
- `mount`
- `lvextend`
- `resize2fs`

---

## What I Learned

1. LVM allows storage to be managed dynamically without repartitioning disks.
2. The LVM workflow follows **Physical Volume (PV) → Volume Group (VG) → Logical Volume (LV)**.
3. Logical volumes can be extended easily, and the filesystem can be resized without losing data.

---

## LVM Architecture

```
Physical Disk (/dev/sdb or /dev/loop0)
            │
            ▼
    Physical Volume (PV)
            │
            ▼
     Volume Group (VG)
            │
            ▼
     Logical Volume (LV)
            │
            ▼
      Filesystem (ext4)
            │
            ▼
     Mounted Directory
```

---

## Result

Successfully created an LVM setup by:

- Creating a Physical Volume
- Creating a Volume Group
- Creating a Logical Volume
- Formatting the Logical Volume
- Mounting it to the filesystem
- Extending the Logical Volume and resizing the filesystem successfully
