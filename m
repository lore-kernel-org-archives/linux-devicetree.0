From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH 1/3] ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for use with
 LAN8710
Date: Tue, 22 Aug 2017 14:43:11 +0300
Message-ID: <20170822114313.9038-2-stefan@olimex.com>
References: <20170822114313.9038-1-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170822114313.9038-1-stefan@olimex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
List-Id: devicetree@vger.kernel.org

>From revision J the board uses new phy chip LAN8710. Compared
with RTL8201, RA17 pin is TXERR. It has pullup which causes phy
not to work. To fix this, PA17 must be configured output-low.

This patch is compatible with earlier board revisions, since this
pin wasn't connected to phy.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 0b7403e4d687..578c761b551a 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -102,7 +102,7 @@
 
 &gmac {
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac_pins_mii_a>;
+	pinctrl-0 = <&gmac_pins_mii_a>,<&gmac_txerr_pin>;
 	phy = <&phy1>;
 	phy-mode = "mii";
 	status = "okay";
@@ -229,6 +229,11 @@
 };
 
 &pio {
+	gmac_txerr_pin: gmac_txerr_pin@0 {
+		pins = "PA17";
+		function = "gpio_out"
+	};
+
 	mmc3_cd_pin_olinuxinom: mmc3_cd_pin@0 {
 		pins = "PH11";
 		function = "gpio_in";
-- 
2.11.0
