From: Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [RFC 11/12] ARM: dts: pxa: use reworked NAND controller driver
Date: Wed, 18 Oct 2017 16:36:28 +0200
Message-ID: <20171018143629.29302-12-miquel.raynal@free-electrons.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andrew Lunn <andrew@lunn.ch>, bcm-kernel-feedback-list@broadcom.com, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Daniel Mack <daniel@zonque.org>, David Woodhouse <dwmw2@infradead.org>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@free-electrons.com>, Han Xu <han.xu@nxp.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org
Cc: Hanna Hawa <hannah@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Igor Grinberg <grinberg@compulab.co.il>, Miquel Raynal <miquel.raynal@free-electrons.com>, Ofer Heifetz <oferh@marvell.com>
List-Id: devicetree@vger.kernel.org

Change the bindings to use the reworked Marvell NAND controller driver.
Also adapt the nand controller node organization to distinguish which
property is relevant for the controller, and which one is NAND chip
specific. Expose the partitions as a subnode of the NAND chip.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 7a0cc4ea819a..e7cde732bf88 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -116,15 +116,15 @@
 			status = "disabled";
 		};
 
-		nand0: nand@43100000 {
-			compatible = "marvell,pxa3xx-nand";
+		nand_controller: nand-controller@43100000 {
+			compatible = "marvell,pxa3xx-nand-controller";
 			reg = <0x43100000 90>;
 			interrupts = <45>;
 			clocks = <&clks CLK_NAND>;
 			dmas = <&pdma 97 3>;
 			dma-names = "data";
 			#address-cells = <1>;
-			#size-cells = <1>;	
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.11.0
