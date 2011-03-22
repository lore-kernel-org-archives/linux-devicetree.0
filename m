From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v6 6/6] powerpc,
	tqm5200: update tqm5200_defconfig to fit for charon board.
Date: Tue, 22 Mar 2011 09:27:32 +0100
Message-ID: <1300782452-528-7-git-send-email-hs@denx.de>
References: <1291451028-22532-1-git-send-email-hs@denx.de>
	<1300782452-528-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1300782452-528-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vincent Sanders <vince-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

added:

CONFIG_MTD_OF_PARTS
CONFIG_MTD_PLATRAM
CONFIG_FIXED_PHY
CONFIG_SENSORS_LM80
CONFIG_MFD_SM501
CONFIG_FB
CONFIG_FB_FOREIGN_ENDIAN
CONFIG_FB_SM501
CONFIG_FRAMEBUFFER_CONSOLE
CONFIG_RTC_DRV_DS1374

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
cc: Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>
cc: Vincent Sanders <vince-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>
cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
cc: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
cc: Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>
---
- changes since v1:
  added Grant Likely to cc
- changes for v6:
  - new in this version, therefore patch
    "powerpc, mpc5200: update mpc5200_defconfig to fit for charon board."
    removed.
    As this board is tqm5200 based, added necessary changes
    to the tqm5200_defconfig. In previous patchserie I added
    the changes to mpc5200_defconfig, as Wolfram Sang mentioned,
    but as tqm5200_defconfig is in mainline, and the board is
    tqm5200 based, I think, thats the appropriate place, as
    new defconfigs are not accepted. Paul, before applying
    this patch series, this patch should get an Acked by
    from a powerpc maintainer...
  - repost the complete patchserie as Paul Mundt suggested

 arch/powerpc/configs/52xx/tqm5200_defconfig |   20 ++++++++++++--------
 1 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/configs/52xx/tqm5200_defconfig b/arch/powerpc/configs/52xx/tqm5200_defconfig
index 959cd2c..716a37b 100644
--- a/arch/powerpc/configs/52xx/tqm5200_defconfig
+++ b/arch/powerpc/configs/52xx/tqm5200_defconfig
@@ -1,9 +1,10 @@
 CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
+CONFIG_SPARSE_IRQ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_EXPERT=y
+CONFIG_EMBEDDED=y
 # CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_EPOLL is not set
@@ -17,7 +18,6 @@ CONFIG_PPC_MPC5200_SIMPLE=y
 CONFIG_PPC_MPC5200_BUGFIX=y
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_BESTCOMM=y
-CONFIG_SPARSE_IRQ=y
 CONFIG_PM=y
 # CONFIG_PCI is not set
 CONFIG_NET=y
@@ -38,17 +38,18 @@ CONFIG_MTD=y
 CONFIG_MTD_CONCAT=y
 CONFIG_MTD_PARTITIONS=y
 CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_OF_PARTS=y
 CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_ROM=y
 CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_PLATRAM=y
 CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
-# CONFIG_MISC_DEVICES is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
@@ -56,13 +57,11 @@ CONFIG_PATA_MPC52xx=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_NETDEVICES=y
 CONFIG_LXT_PHY=y
+CONFIG_FIXED_PHY=y
 CONFIG_NET_ETHERNET=y
 CONFIG_FEC_MPC52xx=y
 # CONFIG_NETDEV_1000 is not set
 # CONFIG_NETDEV_10000 is not set
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
 CONFIG_SERIAL_MPC52xx=y
 CONFIG_SERIAL_MPC52xx_CONSOLE=y
 CONFIG_SERIAL_MPC52xx_CONSOLE_BAUD=115200
@@ -70,7 +69,13 @@ CONFIG_SERIAL_MPC52xx_CONSOLE_BAUD=115200
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MPC=y
+CONFIG_SENSORS_LM80=y
 CONFIG_WATCHDOG=y
+CONFIG_MFD_SM501=y
+CONFIG_FB=y
+CONFIG_FB_FOREIGN_ENDIAN=y
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_DEVICEFS=y
 # CONFIG_USB_DEVICE_CLASS is not set
@@ -80,10 +85,10 @@ CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
 CONFIG_USB_STORAGE=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
+CONFIG_RTC_DRV_DS1374=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-CONFIG_INOTIFY=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_PROC_KCORE=y
@@ -102,7 +107,6 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_INFO=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_CRYPTO_ECB=y
 CONFIG_CRYPTO_PCBC=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
-- 
1.7.4
