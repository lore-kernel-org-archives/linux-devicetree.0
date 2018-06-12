From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 6/6] dt-bindings: media: rcar-vin: Clarify optional props
Date: Tue, 12 Jun 2018 16:26:06 +0200
Message-ID: <1528813566-17927-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1528813566-17927-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1528813566-17927-1-git-send-email-jacopo+renesas@jmondi.org>
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

Add a note to the R-Car VIN interface bindings to clarify that all
properties listed as generic properties in video-interfaces.txt can
be included in port@0 endpoint, but if not explicitly listed in the
interface bindings documentation, they do not modify it behaviour.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/rcar_vin.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index 8130849..03544c7 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -55,6 +55,12 @@ from local SoC CSI-2 receivers (port1) depending on SoC.
       instances that are connected to external pins should have port 0.
 
       - Optional properties for endpoint nodes of port@0:
+
+        All properties described in [1] and which apply to the selected
+        media bus type could be optionally listed here to better describe
+        the current hardware configuration, but only the following ones do
+        actually modify the VIN interface behaviour:
+
         - hsync-active: see [1] for description. Default is active high.
         - vsync-active: see [1] for description. Default is active high.
         - data-enable-active: polarity of CLKENB signal, see [1] for
-- 
2.7.4
