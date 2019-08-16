From: Wen He <wen.he_1@nxp.com>
Subject: [v3 1/2] dt/bindings: display: Add optional property node for Mali DP500
Date: Fri, 16 Aug 2019 18:04:23 +0800
Message-ID: <20190816100424.5366-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-devel@linux.nxdi.nxp.com, Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com
Cc: Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

Add optional property node 'arm,malidp-arqos-value' for the Mali DP500.
This property describe the ARQoS levels of DP500's QoS signaling.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v3:
        - correction the describe of the node

 Documentation/devicetree/bindings/display/arm,malidp.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/arm,malidp.txt b/Documentation/devicetree/bindings/display/arm,malidp.txt
index 2f7870983ef1..1f711d32f235 100644
--- a/Documentation/devicetree/bindings/display/arm,malidp.txt
+++ b/Documentation/devicetree/bindings/display/arm,malidp.txt
@@ -37,6 +37,8 @@ Optional properties:
     Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
     to be used for the framebuffer; if not present, the framebuffer may
     be located anywhere in memory.
+  - arm,malidp-arqos-high-level: phandle to describing the ARQoS levels of DP500's
+    QoS signaling.
 
 
 Example:
@@ -54,6 +56,7 @@ Example:
 		clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
 		clock-names = "pxlclk", "mclk", "aclk", "pclk";
 		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
+		arm,malidp-arqos-high-level = <&rqosvalue>;
 		port {
 			dp0_output: endpoint {
 				remote-endpoint = <&tda998x_2_input>;
-- 
2.17.1
