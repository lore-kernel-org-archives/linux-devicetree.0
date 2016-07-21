From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 5/5] arm64: defconfig: Add Renesas R-Car HSUSB driver support as module
Date: Thu, 21 Jul 2016 19:47:01 +0900
Message-ID: <1469098021-7692-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index aa47366..9d23ff9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -232,6 +232,7 @@ CONFIG_USB_EHCI_MSM=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_CHIPIDEA=y
@@ -242,6 +243,7 @@ CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_MSM_OTG=y
 CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
+CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
1.9.1
