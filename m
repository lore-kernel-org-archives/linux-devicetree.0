From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 3/6] dt-bindings: media: Document data-enable-active
 property
Date: Mon,  9 Jul 2018 16:19:18 +0200
Message-ID: <1531145962-1540-4-git-send-email-jacopo+renesas@jmondi.org>
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

Add 'data-enable-active' property to endpoint node properties list.

The property allows to specify the polarity of the data-enable signal, which
when in active state determinates when data lines have to sampled for valid
pixel data.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 52b7c7b..baf9d97 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -113,6 +113,8 @@ Optional endpoint properties
   Note, that if HSYNC and VSYNC polarities are not specified, embedded
   synchronization may be required, where supported.
 - data-active: similar to HSYNC and VSYNC, specifies data line polarity.
+- data-enable-active: similar to HSYNC and VSYNC, specifies the data enable
+  signal polarity.
 - field-even-active: field signal level during the even field data transmission.
 - pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
   signal.
-- 
2.7.4
