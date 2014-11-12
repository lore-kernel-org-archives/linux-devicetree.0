From: Howard Chen <ibanezchen@gmail.com>
Subject: [PATCH v6 3/4] dt-bindings: add documentation for Mediatek SoC
Date: Thu, 13 Nov 2014 00:07:36 +0800
Message-ID: <1415808457-4030-3-git-send-email-ibanezchen@gmail.com>
References: <1415808457-4030-1-git-send-email-ibanezchen@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415808457-4030-1-git-send-email-ibanezchen@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Howard Chen <ibanezchen@gmail.com>, Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds a DT binding documentation for the MT6592 SoC from Mediatek.

Signed-off-by: Howard Chen <ibanezchen@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index fa25226..1d2d151 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -1,10 +1,10 @@
 Mediatek MT6589 Platforms Device Tree Bindings
 
-Boards with a SoC of the Mediatek MT6589 shall have the following property:
+Boards with a SoC from Mediatek shall have the following property:
 
 Required root node property:
 
-compatible: must contain "mediatek,mt6589"
+compatible: must contain one of "mediatek,mt6589", "mediatek,mt6592"
 
 
 Supported boards:
@@ -12,3 +12,6 @@ Supported boards:
 - bq Aquaris5 smart phone:
     Required root node properties:
       - compatible = "mundoreader,bq-aquaris5", "mediatek,mt6589";
+
+- Evaluation board for MT6592:
+      - compatible = "mediatek,mt6592-evb", "mediatek,mt6592";
-- 
1.9.1
