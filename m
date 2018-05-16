From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 2/6] dt-bindings: media: rcar-vin: Document data-active
Date: Wed, 16 May 2018 18:32:28 +0200
Message-ID: <1526488352-898-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1526488352-898-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526488352-898-1-git-send-email-jacopo+renesas@jmondi.org>
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
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document 'data-active' property in R-Car VIN device tree bindings.
The property is optional when running with explicit synchronization
(eg. BT.601) but mandatory when embedded synchronization is in use (eg.
BT.656) as specified by the hardware manual.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/rcar_vin.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index c53ce4e..17eac8a 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -63,6 +63,11 @@ from local SoC CSI-2 receivers (port1) depending on SoC.
 	If both HSYNC and VSYNC polarities are not specified, embedded
 	synchronization is selected.

+        - data-active: active state of data enable signal (CLOCKENB pin).
+          0/1 for LOW/HIGH respectively. If not specified, use HSYNC as
+          data enable signal. When using embedded synchronization this
+          property is mandatory.
+
     - port 1 - sub-nodes describing one or more endpoints connected to
       the VIN from local SoC CSI-2 receivers. The endpoint numbers must
       use the following schema.
--
2.7.4
