Return-Path: <SRS0=BPCO=WJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:39193 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728430AbfHMNqa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 13 Aug 2019 09:46:30 -0400
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/1] dt-bindings: smiapp: Align documentation with current practices
Date: Tue, 13 Aug 2019 16:45:18 +0300
Message-Id: <20190813134518.5640-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

- The clock-lanes property is not needed for the sensors do not support
  lane reordering. (The information possibly present in existing clock-lane
  properties is simply not used.)

- There's no need to refer to the sensor device in the DT example, thus
  remove the label.

- Rename the "camera" device node as "camera-sensor".

- Rename the endpoint label as "smiapp_ep" (was: "smiapp_1_1"). There is
  in practice only one anyway.

- Remove the remote-endpoint documentation (it is covered by
  graph.txt to which video-interfaces.txt refers to).

- Add a note on the port and endpoint nodes.

These changes make the smiapp bindings a better example.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/media/i2c/nokia,smia.txt       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
index 8ee7c7972ac79..c3c3479233c4a 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
@@ -7,6 +7,9 @@ of that. These definitions are valid for both types of sensors.
 More detailed documentation can be found in
 Documentation/devicetree/bindings/media/video-interfaces.txt .
 
+The device node should contain a "port" node which may contain one or more
+endpoint nodes, in accordance with video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt .
 
 Mandatory properties
 --------------------
@@ -37,9 +40,7 @@ Optional properties
 Endpoint node mandatory properties
 ----------------------------------
 
-- clock-lanes: <0>
 - data-lanes: <1..n>
-- remote-endpoint: A phandle to the bus receiver's endpoint node.
 
 
 Example
@@ -48,7 +49,7 @@ Example
 &i2c2 {
 	clock-frequency = <400000>;
 
-	smiapp_1: camera@10 {
+	camera-sensor@10 {
 		compatible = "nokia,smia";
 		reg = <0x10>;
 		reset-gpios = <&gpio3 20 0>;
@@ -58,8 +59,7 @@ Example
 		nokia,nvm-size = <512>; /* 8 * 64 */
 		link-frequencies = /bits/ 64 <199200000 210000000 499200000>;
 		port {
-			smiapp_1_1: endpoint {
-				clock-lanes = <0>;
+			smiapp_ep: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&csi2a_ep>;
 			};
-- 
2.20.1
