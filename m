From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH v4 1/2] dt-bindings: Add new SoCs to bcm4708 DT bindings
Date: Wed, 21 Oct 2015 18:46:03 -0400
Message-ID: <1445467564-30024-2-git-send-email-jonmason@broadcom.com>
References: <1445467564-30024-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445467564-30024-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add the 4708, 4709, and 53012 SoCs to the the documentation for the
Broadcom Northstar device tree bindings.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
Acked-by: Scott Branden <sbranden@broadcom.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
index 6b0f49f..8608a77 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
@@ -5,4 +5,11 @@ Boards with the BCM4708 SoC shall have the following properties:
 
 Required root node property:
 
+bcm4708
 compatible = "brcm,bcm4708";
+
+bcm4709
+compatible = "brcm,bcm4709";
+
+bcm53012
+compatible = "brcm,bcm53012";
-- 
1.9.1
