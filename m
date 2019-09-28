From: Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 1/8] ARM: dts: bcm283x: Remove simple-bus from fixed clocks
Date: Sat, 28 Sep 2019 14:07:07 +0200
Message-ID: <1569672435-19823-2-git-send-email-wahrenst@gmx.net>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <wahrenst@gmx.net>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The fixed clocks doesn't form some kind of bus. So let's remove it.
This fixes the follow DT schema warnings:

clocks: clock@3:reg:0: [3] is too short
clocks: clock@4:reg:0: [4] is too short
clocks: $nodename:0: 'clocks' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
clocks: #size-cells:0:0: 0 is not one of [1, 2]
clocks: 'ranges' is a required property
clock@3: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
clock@4: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
---
 arch/arm/boot/dts/bcm283x.dtsi | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 2d191fc..f16899d 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -650,22 +650,16 @@
 	};

 	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		/* The oscillator is the root of the clock tree. */
-		clk_osc: clock@3 {
+		clk_osc: clk-osc {
 			compatible = "fixed-clock";
-			reg = <3>;
 			#clock-cells = <0>;
 			clock-output-names = "osc";
 			clock-frequency = <19200000>;
 		};

-		clk_usb: clock@4 {
+		clk_usb: clk-usb {
 			compatible = "fixed-clock";
-			reg = <4>;
 			#clock-cells = <0>;
 			clock-output-names = "otg";
 			clock-frequency = <480000000>;
--
2.7.4
