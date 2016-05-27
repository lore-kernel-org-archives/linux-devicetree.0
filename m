From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH 3/4] dt-bindings: Document Renesas R-Car FCP power-domains usage
Date: Fri, 27 May 2016 18:19:24 +0100
Message-ID: <1464369565-12259-5-git-send-email-kieran@bingham.xyz>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, kieran@ksquared.org.uk
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The example misses the power-domains usage, and documentation that the
property is used by the node.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index 1c0718b501ef..464bb7ae4b92 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -21,6 +21,8 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
 
  - reg: the register base and size for the device registers
  - clocks: Reference to the functional clock
+ - power-domains : power-domain property defined with a phandle
+                           to respective power domain.
 
 
 Device node example
@@ -30,4 +32,5 @@ Device node example
 		compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
 		reg = <0 0xfea2f000 0 0x200>;
 		clocks = <&cpg CPG_MOD 602>;
+		power-domains = <&sysc R8A7795_PD_A3VP>;
 	};
-- 
2.5.0
