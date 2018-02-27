Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: host: xhci-rcar: add support for r8a77965
Date: Tue, 27 Feb 2018 17:15:20 +0900
Message-Id: <1519719320-27792-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds support for r8a77965 (R-Car M3-N).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 drivers/usb/host/xhci-rcar.c                       | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index e2ea59b..1651483a 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -13,6 +13,7 @@ Required properties:
     - "renesas,xhci-r8a7793" for r8a7793 SoC
     - "renesas,xhci-r8a7795" for r8a7795 SoC
     - "renesas,xhci-r8a7796" for r8a7796 SoC
+    - "renesas,xhci-r8a77965" for r8a77965 SoC
     - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
       device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible device
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index f0b5596..f33ffc2 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -83,6 +83,10 @@
 		.soc_id = "r8a7796",
 		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
 	},
+	{
+		.soc_id = "r8a77965",
+		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
+	},
 	{ /* sentinel */ },
 };
 
-- 
1.9.1
