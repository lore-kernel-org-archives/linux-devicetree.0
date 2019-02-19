From: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [RFC v9 0/5] pstore/block: new support logger for block devices
Date: Tue, 19 Feb 2019 19:52:45 +0800
Message-ID: <1550577170-18761-1-git-send-email-liaoweixiong@allwinnertech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, liaoweixiong <liaoweixiong@allwinnertech.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Why should we need pstore_block?
1. Most embedded intelligent equipment have no persistent ram, which
increases costs. We perfer to cheaper solutions, like block devices.
In fast, there is already a sample for block device logger in driver
MTD (drivers/mtd/mtdoops.c).
2. Do not any equipment have battery, which means that it lost all data
on general ram if power failure. Pstore has little to do for these
equipments.

[PATCH v9]
On patch 1:
1. rename part_path/part_size, members of blkz_info, to blkdev/total_size
2. if total_size is zero, get size from @blkdev
3. support multiple variants for @blkdev, such as partuuid, major with minor,
   and /dev/xxxx. See details on Documentation.
4. get size from block device
5. add depends on CONFIG_BLOCK
On patch 2:
1. update document
On patch 3:
1. update codes for new blkzone. Blkoops support insmod without total_size.
   for example: "insmod ./blkoops.ko blkdev=93:6" (major:minor).
2. use late_initcalls rather than module_init, to avoid block device not ready.
3. support for block driver to add panic apis to blkoops. By this, block
   driver can do the least work that just provides panic operations.
On patch 5:
1. update document

[PATCH v8]
On patch 2:
1. move DT to /bindings/pstore
2. Delete details for kernel.

[PATCH v7]
On patch 1:
1. Fix line over 80 characters.
On patch 2:
1. Insert a separate patch for DT bindings.

[PATCH v6]
On patch 1:
1. Fix according to email from Kees Cook, including spelling mistakes,
   explicit overflow test, none of the zeroing etc.
2. Do not recover data but metadata of dmesg when panic.
3. No need to take recovery when do erase.
4. Do not use "blkoops" for blkzone any more because "blkoops" is used for
   other module now. (rename blkbuf to blkoops)
On patch 2:
1. Rename blkbuf to blkoops.
2. Add Kconfig/device tree/module parameters settings for blkoops.
3. Add document for device tree.
On patch 3:
1. Blkoops support pmsg.
2. Fix description for new version patch.
On patch 4:
1. Fix description for new version patch.

[PATCH v5]
On patch 1:
1. rename pstore/rom to pstore/blk
2. Do not allocate any memory in the write path of panic. So, use local
array instead in function romz_recover_dmesg_meta.
3. Add C header file "linux/fs.h" to fix implicit declaration of function
   'filp_open','kernel_read'...
On patch 3:
1. If panic, do not recover pmsg but flush if it is dirty.
2. Fix erase pmsg failed.
On patch 4:
1. Create a document for pstore/blk

[PATCH v4]
On patch 1:
1. Fix always true condition '(--i >= 0) => (0-u32max >= 0)' in function
   romz_init_zones by defining variable i to 'int' rahter than
   'unsigned int'.
2. To make codes more easily to read, we use macro READ_NEXT_ZONE for
   return value of romz_dmesg_read if it need to read next zone.
   Moveover, we assign READ_NEXT_ZONE -1024 rather than 0.
3. Add 'FLUSH_META' to 'enum romz_flush_mode' and rename 'NOT_FLUSH' to
   'FLUSH_NONE'
4. Function romz_zone_write work badly with FLUSH_PART mode as badly
   address and offset to write.
On patch 3:
NEW SUPPORT psmg for pstore_rom.

[PATCH v3]
On patch 1:
Fix build as module error for undefined 'vfs_read' and 'vfs_write'
Both of 'vfs_read' and 'vfs_write' haven't be exproted yet, so we use
'kernel_read' and 'kernel_write' instead.

[PATCH v2]
On patch 1:
Fix build as module error for redefinition of 'romz_unregister' and
'romz_register'

[PATCH v1]
On patch 1:
Core codes of pstore_rom, which works well on allwinner(sunxi) platform.
On patch 2:
A sample for pstore_rom, using general ram rather than block device.

liaoweixiong (5):
  pstore/blk: new support logger for block devices
  dt-bindings: pstore-block: new support for blkoops
  pstore/blk: add blkoops for pstore_blk
  pstore/blk: support pmsg for pstore block
  Documentation: pstore/blk: create document for pstore_blk

 Documentation/admin-guide/pstore-block.rst         |  233 ++++
 .../devicetree/bindings/pstore/blkoops.txt         |   53 +
 MAINTAINERS                                        |    4 +-
 fs/pstore/Kconfig                                  |  147 +++
 fs/pstore/Makefile                                 |    5 +
 fs/pstore/blkoops.c                                |  265 +++++
 fs/pstore/blkzone.c                                | 1223 ++++++++++++++++++++
 include/linux/pstore_blk.h                         |   87 ++
 8 files changed, 2016 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/pstore-block.rst
 create mode 100644 Documentation/devicetree/bindings/pstore/blkoops.txt
 create mode 100644 fs/pstore/blkoops.c
 create mode 100644 fs/pstore/blkzone.c
 create mode 100644 include/linux/pstore_blk.h

-- 
1.9.1
