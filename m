From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] arm64: dts: msm8916-samsung-a5u: Override iris compatible
Date: Thu, 22 Aug 2019 13:23:39 +0200
Message-ID: <20190822112339.121804-2-stephan@gerhold.net>
References: <20190822112339.121804-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822112339.121804-1-stephan@gerhold.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
List-Id: devicetree@vger.kernel.org

msm8916.dtsi sets the iris compatible to "qcom,wcn3620".
While WCN3620 seems to be used on most MSM8916 devices,
MSM8916 can also be paired with another chip (e.g. for WiFi dual-band).

A5U uses WCN3660B instead, so the compatible needs to be overridden
to apply the correct configuration.

However, simply using "qcom,wcn3660" would be incorrect,
since WCN3660B requires a slightly different regulator configuration
compared to WCN3660.

Instead, it requires the same configuration as "qcom,wcn3680".
Replace the compatible with "qcom,wcn3680" for A5U to make WCNSS
work correctly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I'm not quite sure if it would be better to define a new compatible
for WCN3660B (e.g. "qcom,wcn3660b") since this isn't really a WCN3680.
But in any case, it would use exactly the same configuration.

The compatible seems to be only used for regulator + clock configuration,
see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/qcom_wcnss_iris.c#n57

 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index 1aa59da98495..6629a621139c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -8,3 +8,9 @@
 	model = "Samsung Galaxy A5U (EUR)";
 	compatible = "samsung,a5u-eur", "qcom,msm8916";
 };
+
+&pronto {
+	iris {
+		compatible = "qcom,wcn3680";
+	};
+};
-- 
2.22.1
