From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH v2 1/2] dt-bindings: Add new boards to bcm4708 DT bindings
Date: Wed, 14 Oct 2015 18:14:49 -0400
Message-ID: <1444860890-28649-2-git-send-email-jonmason@broadcom.com>
References: <1444860890-28649-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444860890-28649-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add the 4708, 4709, and 953012k SVKs to the the documentation for the
Broadcom Northstar device tree bindings.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
index 6b0f49f..b9cc308 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.txt
@@ -5,4 +5,11 @@ Boards with the BCM4708 SoC shall have the following properties:
 
 Required root node property:
 
+bcm94708
 compatible = "brcm,bcm4708";
+
+bcm94709
+compatible = "brcm,bcm4709";
+
+bcm953012
+compatible = "brcm,bcm53012";
-- 
1.9.1
