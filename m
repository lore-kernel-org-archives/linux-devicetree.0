From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 3/3] riscv: defconfig: enable SOC_SIFIVE
Date: Mon, 17 Jun 2019 21:29:50 +0200
Message-ID: <1560799790-20287-4-git-send-email-lollivier@baylibre.com>
References: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Loys Ollivier <lollivier@baylibre.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

Enable SOC_SIFIVE so the default upstream config is bootable on the SiFive
Unleashed Board.
And have basic support for future boards based on the same SoC.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 arch/riscv/configs/defconfig | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4f02967e55de..6e3e37aa8fd1 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -12,6 +12,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_SOC_SIFIVE=y
 CONFIG_SMP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -49,8 +50,6 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
-CONFIG_SERIAL_SIFIVE=y
-CONFIG_SERIAL_SIFIVE_CONSOLE=y
 CONFIG_HVC_RISCV_SBI=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_DRM=y
@@ -66,9 +65,6 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
-CONFIG_CLK_SIFIVE=y
-CONFIG_CLK_SIFIVE_FU540_PRCI=y
-CONFIG_SIFIVE_PLIC=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
-- 
2.7.4
