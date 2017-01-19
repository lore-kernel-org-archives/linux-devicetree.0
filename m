From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 7/7] ARM: dts: stm32: Enable pwm1 and pwm3 for stm32f469-eval
Date: Thu, 19 Jan 2017 14:34:14 +0100
Message-ID: <1484832854-6314-8-git-send-email-fabrice.gasnier@st.com>
References: <1484832854-6314-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484832854-6314-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Define and enable pwm1 and pwm3, timers1 & 3 trigger outputs on
stm32f469-eval board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 2181220..892100f 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -171,3 +171,31 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&timers1 {
+	status = "okay";
+
+	pwm {
+		pinctrl-0 = <&pwm1_pins>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	timer@0 {
+		status = "okay";
+	};
+};
+
+&timers3 {
+	status = "okay";
+
+	pwm {
+		pinctrl-0 = <&pwm3_pins>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	timer@2 {
+		status = "okay";
+	};
+};
-- 
1.9.1
