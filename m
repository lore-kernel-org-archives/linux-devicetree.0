From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH v2 03/17] ARM: dts: mvebu: a385-db-ap: enable USB (orion-ehci)
 port
Date: Thu,  4 Aug 2016 12:14:06 +0200
Message-ID: <1470305660-6601-4-git-send-email-jaz@semihalf.com>
References: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, jason@lakedaemon.net, jaz@semihalf.com, linux@armlinux.org.uk, nadavh@marvell.com, alior@marvell.com, robh+dt@kernel.org, gregory.clement@free-electrons.com, mw@semihalf.com, thomas.petazzoni@free-electrons.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

The Armada 385 Access Point Development board contains USB port, which can
be handled by existing orion-ehci driver.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-385-db-ap.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
index 2d3fd6e..a18f516 100644
--- a/arch/arm/boot/dts/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/armada-385-db-ap.dts
@@ -155,6 +155,10 @@
 				bm,pool-short = <3>;
 			};
 
+			usb@58000 {
+				status = "okay";
+			};
+
 			/* CON4 */
 			ethernet@70000 {
 				pinctrl-names = "default";
-- 
1.8.3.1
