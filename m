From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 1/6] dt-bindings: media: rcar-vin: Align Gen2 and Gen3
Date: Mon,  9 Jul 2018 16:19:16 +0200
Message-ID: <1531145962-1540-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert@glider.be
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Align description of the Gen2 and Gen3 bindings for parallel input.
This commit prepares for description of optional endpoint properties in ports
subnodes accepting parallel video connections.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/rcar_vin.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index e25ab07..39c4e6a 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -39,9 +39,11 @@ Additionally, an alias named vinX will need to be created to specify
 which video input device this is.
 
 The per-board settings Gen2 platforms:
- - port sub-node describing a single endpoint connected to the vin
-   as described in video-interfaces.txt[1]. Only the first one will
-   be considered as each vin interface has one input port.
+
+- port - sub-node describing a single endpoint connected to the VIN
+  from external SoC pins as described in video-interfaces.txt[1].
+  Only the first one will be considered as each vin interface has one
+  input port.
 
 The per-board settings Gen3 platforms:
 
@@ -52,7 +54,7 @@ from local SoC CSI-2 receivers (port@1) depending on SoC.
 - renesas,id - ID number of the VIN, VINx in the documentation.
 - ports
     - port@0 - sub-node describing a single endpoint connected to the VIN
-      from external SoC pins described in video-interfaces.txt[1].
+      from external SoC pins as described in video-interfaces.txt[1].
       Describing more than one endpoint in port@0 is invalid. Only VIN
       instances that are connected to external pins should have port@0.
     - port@1 - sub-nodes describing one or more endpoints connected to
-- 
2.7.4
