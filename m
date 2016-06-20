From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/8] arm64: dts: db820c: add support to LS-I2C0
Date: Mon, 20 Jun 2016 21:01:42 +0100
Message-ID: <1466452907-23290-4-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466452907-23290-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466452907-23290-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds support to LS-I2C0 on LS expansion connector.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 2851442..0d78c4e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -17,6 +17,7 @@
 	aliases {
 		serial0 = &blsp2_uart1;
 		serial1 = &blsp2_uart2;
+		i2c0	= &blsp1_i2c2;
 	};
 
 	chosen {
@@ -39,5 +40,12 @@
 			pinctrl-0 = <&blsp2_uart2_4pins_default>;
 			pinctrl-1 = <&blsp2_uart2_4pins_sleep>;
 		};
+
+		i2c@07577000 {
+		/* On Low speed expansion */
+			label = "LS-I2C0";
+			status = "okay";
+		};
+
 	};
 };
-- 
2.7.4
