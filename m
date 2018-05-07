From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 11/14] ARM: dts: imx7s: add capture subsystem
Date: Mon,  7 May 2018 17:21:49 +0100
Message-ID: <20180507162152.2545-12-rui.silva@linaro.org>
References: <20180507162152.2545-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180507162152.2545-1-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add media capture subsystem device to i.MX7 definitions.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 0bae41f2944c..058e0cbf8ee7 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -1175,4 +1175,9 @@
 			assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_500M_CLK>;
 		};
 	};
+
+	capture-subsystem {
+		compatible = "fsl,imx7-capture-subsystem";
+		ports = <&csi>;
+	};
 };
-- 
2.17.0
