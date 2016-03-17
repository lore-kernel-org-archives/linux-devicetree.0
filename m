From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [PATCH v2 06/18] MIPS: dts: qca: ar9132_tl_wr1043nd_v1.dts: use "ref" for reference clock name
Date: Thu, 17 Mar 2016 06:34:13 +0300
Message-ID: <1458185665-4521-7-git-send-email-antonynpavlov@gmail.com>
References: <1458185665-4521-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1458185665-4521-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Alban Bedel <albeu@free.fr>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Current ath79 clock.c code does not read reference clock and
pll setup from devicetree. The ar724x_clocks_init() function
recreates the clocks from scratch so devicetree clock
information is dropped. After adding the code which picked up
reference clock from devicetree I have found
that kernel does not boot anymore. The SPI and UART drivers
can't get clk; here are the bootlog error messages:

    of_serial: probe of 18020000.uart failed with error -22
    ath79-spi: probe of 1f000000.spi failed with error -22

The problem is that clock code assumes that reference clock
name is "ref" but current dts-file uses another name: "oscillator".

This patch fixes the problem by changing external oscillator
dt node name to "ref".

Please note that there is an alternative solution for the problem:

    > --- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
    > +++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
    > @@ -16,6 +16,7 @@
    >
    >         extosc: oscillator {
    >                 compatible = "fixed-clock";
    > +               clock-output-names = "ref";
    >                 #clock-cells = <0>;
    >                 clock-frequency = <40000000>;
    >         };

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Alban Bedel <albeu@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index eb632a2..3c3b7ce 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -14,7 +14,7 @@
 		reg = <0x0 0x2000000>;
 	};
 
-	extosc: oscillator {
+	extosc: ref {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <40000000>;
-- 
2.7.0

