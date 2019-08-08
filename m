Return-Path: <SRS0=uCLo=WE=nvidia.com=nkristam@kernel.org>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V6 8/8] arm64: defconfig: Enable tegra XUDC driver
Date: Thu, 8 Aug 2019 15:07:26 +0530
Message-ID: <1565257046-9890-9-git-send-email-nkristam@nvidia.com>
In-Reply-To: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Enable support for Nvidia XUSB device mode controller driver.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 97c5078..89afd5c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -598,6 +598,7 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
+CONFIG_USB_TEGRA_XUDC=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
-- 
2.7.4
