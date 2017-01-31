From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] arm: mvebu: Fix whitespace in armada-xp-98dx3236.dtsi
Date: Tue, 31 Jan 2017 16:42:09 +1300
Message-ID: <20170131034209.3848-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Change sequences of 8 spaces to hard-tabs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
I think this crept in during review and I didn't notice. The file is new enough
that we shouldn't lose any useful history.

 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
index 9461128fae24..f6a03dcee5ef 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -201,13 +201,13 @@
 			#size-cells = <1>;
 			ranges = <0 MBUS_ID(0x08, 0x00) 0 0x100000>;
 
-                        dfx_coredivclk: corediv-clock@f8268 {
-                                compatible = "marvell,mv98dx3236-corediv-clock";
-                                reg = <0xf8268 0xc>;
-                                #clock-cells = <1>;
-                                clocks = <&mainpll>;
-                                clock-output-names = "nand";
-                        };
+			dfx_coredivclk: corediv-clock@f8268 {
+				compatible = "marvell,mv98dx3236-corediv-clock";
+				reg = <0xf8268 0xc>;
+				#clock-cells = <1>;
+				clocks = <&mainpll>;
+				clock-output-names = "nand";
+			};
 
 			dfx: dfx@0 {
 				compatible = "marvell,dfx-server";
-- 
2.11.0.24.ge6920cf
