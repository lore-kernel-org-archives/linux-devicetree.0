From: Juergen Borleis <jbe@pengutronix.de>
Subject: [PATCH 5/9] ARM: dts: TQma53: define eMMC's power supply
Date: Thu,  7 Sep 2017 11:05:26 +0200
Message-ID: <20170907090530.1241-6-jbe@pengutronix.de>
References: <20170907090530.1241-1-jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170907090530.1241-1-jbe@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

The eMMC is part of the 'TQma53' CPU card and powered by its on-board power
supply.

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 arch/arm/boot/dts/imx53-tqma53.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
index ceba1004038b1..fa5d712bd47b8 100644
--- a/arch/arm/boot/dts/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -57,6 +57,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_esdhc3>;
 	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_3p3v>;
 	non-removable;
 	bus-width = <8>;
 	status = "okay";
-- 
2.11.0
