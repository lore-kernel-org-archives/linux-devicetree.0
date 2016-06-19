From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/2] mtd: nand: sunxi: update DT bindings
Date: Sun, 19 Jun 2016 19:37:38 +0800
Message-ID: <20160619113739.30362-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: maxime.ripard@free-electrons.com, wens@csie.org, boris.brezillon@free-electrons.com
Cc: devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Document the reset lines

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index 086d6f4..a328fbb 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -15,6 +15,8 @@ Optional children nodes:
 Children nodes represent the available nand chips.
 
 Optional properties:
+- reset : phandle + reset specifier pair
+- reset-names : must contain "ahb"
 - allwinner,rb : shall contain the native Ready/Busy ids.
  or
 - rb-gpios : shall contain the gpios used as R/B pins.
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
