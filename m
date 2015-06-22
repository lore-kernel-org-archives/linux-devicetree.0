From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/8] ARM: STi: STiH407: Provide CPU with clocking information
Date: Mon, 22 Jun 2015 16:43:51 +0100
Message-ID: <1434987837-24212-3-git-send-email-lee.jones@linaro.org>
References: <1434987837-24212-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1434987837-24212-1-git-send-email-lee.jones@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, ajitpal.singh@st.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 2680ac7..fcab003 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -27,6 +27,10 @@
 					    1200000 0
 					    800000  0
 					    500000  0>;
+
+			clocks = <&clk_m_a9>;
+			clock-names = "cpu";
+			clock-latency = <100000>;
 		};
 		cpu@1 {
 			device_type = "cpu";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-pm" in
