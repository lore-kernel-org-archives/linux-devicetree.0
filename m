From: srinivas.kandagatla@linaro.org
Subject: [RESEND PATCH 2/3] arm64: dts: apq8096-db820c: Enable on board 3 pcie
 root complex
Date: Mon, 14 Aug 2017 13:37:56 +0200
Message-ID: <20170814113757.31010-2-srinivas.kandagatla@linaro.org>
References: <20170814113757.31010-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170814113757.31010-1-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch adds enables 3 instances of root complexes which are
exposed on DB820c board. 3 Instances are terminted as below
PCIE0 => QCA6174
PCIE1 => MINI PCIE CARD
PCIE2 => GBE ETHERNET

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 789f3e87321e..18c61693529e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -138,6 +138,22 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&usb2_vbus_det_gpio>;
 		};
+
+		agnoc@0 {
+			qcom,pcie@00600000 {
+				perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+			};
+
+			qcom,pcie@00608000 {
+				status = "okay";
+				perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
+			};
+
+			qcom,pcie@00610000 {
+				status = "okay";
+				perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+			};
+		};
 	};
 
 
-- 
2.11.0
