From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 6/9] dt-bindings: Add root properties for Raspberry Pi 3
Date: Fri,  3 Jun 2016 08:18:25 +0200
Message-ID: <1464934708-24769-7-git-send-email-kraxel@redhat.com>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464934708-24769-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Eric Anholt <eric@anholt.net>

Signed-off-by: Eric Anholt <eric@anholt.net>
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
index 11d3056..6ffe087 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
@@ -30,6 +30,10 @@ Raspberry Pi 2 Model B
 Required root node properties:
 compatible = "raspberrypi,2-model-b", "brcm,bcm2836";
 
+Raspberry Pi 3 Model B
+Required root node properties:
+compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
+
 Raspberry Pi Compute Module
 Required root node properties:
 compatible = "raspberrypi,compute-module", "brcm,bcm2835";
-- 
1.8.3.1
