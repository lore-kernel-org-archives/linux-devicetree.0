Return-Path: <SRS0=zp4P=NQ=jmondi.org=jacopo+renesas@kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 1/6] media: dt-bindings: rcar-vin: Add R8A77990 support
Date: Mon,  5 Nov 2018 12:19:06 +0100
Message-Id: <1541416751-19810-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541416751-19810-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1541416751-19810-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add compatible string for R-Car E3 R8A77990 to the list of SoCs supported by
rcar-vin driver.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/rcar_vin.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index d329a4e..7c878ca 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -24,6 +24,7 @@ on Gen3 platforms to a CSI-2 receiver.
    - "renesas,vin-r8a7796" for the R8A7796 device
    - "renesas,vin-r8a77965" for the R8A77965 device
    - "renesas,vin-r8a77970" for the R8A77970 device
+   - "renesas,vin-r8a77990" for the R8A77990 device
    - "renesas,vin-r8a77995" for the R8A77995 device
    - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
      device.
--
2.7.4
