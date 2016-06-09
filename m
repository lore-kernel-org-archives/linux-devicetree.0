From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH 2/3] dt-bindings: Document Renesas R-Car FCP power-domains usage
Date: Thu,  9 Jun 2016 14:41:33 +0100
Message-ID: <1465479695-18644-3-git-send-email-kieran@bingham.xyz>
References: <1465479695-18644-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1465479695-18644-1-git-send-email-kieran@bingham.xyz>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-media@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS
	- FCP" <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Kieran Bingham <kieran@ksquared.org.uk>
List-Id: devicetree@vger.kernel.org

The power domain must be specified to bring the device out of module
standby. Document this in the example provided, so that new additions
are not missed.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index 271dcfdb5a76..6a55f5215221 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -31,4 +31,5 @@ Device node example
 		compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 		reg = <0 0xfea2f000 0 0x200>;
 		clocks = <&cpg CPG_MOD 602>;
+		power-domains = <&sysc R8A7795_PD_A3VP>;
 	};
-- 
2.7.4
