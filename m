From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: [PATCH v4 8/8] ARM: dts: TS-4600: add watchdog support
Date: Fri, 14 Jul 2017 16:08:53 -0400
Message-ID: <20170714200853.10362-9-sebastien.bourdelin@savoirfairelinux.com>
References: <20170714200853.10362-1-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170714200853.10362-1-sebastien.bourdelin@savoirfairelinux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@savoirfairelinux.com, robh@kernel.org, linux@roeck-us.net, linus.walleij@linaro.org, shawnguo@kernel.org
Cc: fabio.estevam@nxp.com, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, kris@embeddedarm.com, mark@embeddedarm.com
List-Id: devicetree@vger.kernel.org

This enables support for the watchdog located in the FPGA.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 arch/arm/boot/dts/imx28-ts4600-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx28-ts4600-common.dtsi b/arch/arm/boot/dts/imx28-ts4600-common.dtsi
index a90bd934e4a3..9e177d33ba9c 100644
--- a/arch/arm/boot/dts/imx28-ts4600-common.dtsi
+++ b/arch/arm/boot/dts/imx28-ts4600-common.dtsi
@@ -116,6 +116,11 @@
 		ts,strobe-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
 		ts,ale-gpios    = <&gpio0 26 GPIO_ACTIVE_HIGH>;
 		ts,rdy-gpios    = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+
+		watchdog@2a {
+			compatible = "technologic,ts4600-wdt";
+			reg = <0x2a>;
+		};
 	};
 
 };
-- 
2.13.0
