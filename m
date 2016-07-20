From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 09/12] palmetto: Request relevant mux functions in devicetree
Date: Wed, 20 Jul 2016 15:28:30 +0930
Message-ID: <1468994313-13538-10-git-send-email-andrew@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

The requested functions are parented by the pinctrl node to provide the
Palmetto's static pin configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index cc5fcf2940bf..d8d05ee4956b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -20,6 +20,34 @@
 	};
 };
 
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
+			&pinctrl_vgahs_default &pinctrl_vgavs_default
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default
+			&pinctrl_pwm0_default &pinctrl_pwm1_default
+			&pinctrl_pwm2_default &pinctrl_pwm3_default
+			&pinctrl_pwm4_default &pinctrl_pwm5_default
+			&pinctrl_pwm6_default &pinctrl_pwm7_default
+			&pinctrl_bmcint_default &pinctrl_flack_default
+			&pinctrl_rom8_default>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncts1_default &pinctrl_ndcd1_default
+			&pinctrl_nri1_default &pinctrl_ndtr1_default
+			&pinctrl_nrts1_default &pinctrl_txd1_default
+			&pinctrl_rxd1_default>;
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncts4_default &pinctrl_ndcd4_default
+			&pinctrl_nri4_default &pinctrl_txd4_default
+			&pinctrl_rxd4_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.7.4
