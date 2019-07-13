From: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date: Sat, 13 Jul 2019 13:26:45 +0200
Message-ID: <3733253.hEy9q5iLy3@g550jk>
References: <20190620225824.2845-1-luca@z3ntu.xyz> <4607058.UzJteFJyig@g550jk> <20190622014302.GA20947@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190622014302.GA20947@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, ~martijnbraam/pmos-upstream@lists.sr.ht, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Brian,
how about something like that (formatting is surely broken because I'm not 
sending this with git-send-email^^)?

I'd says this should be work fine with all devices as all modes are defined in 
the device-specific dts but the reg and offset values are in the board dts. 
Should I also add a status = "disabled" to the reboot-mode node in the board 
dts?

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/
dts/qcom-msm8974-fairphone-fp2.dts
index 643c57f84818..ff4a3e0aa746 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -338,6 +338,16 @@
 			};
 		};
 	};
+
+	imem@fe805000 {
+		status = "okay";
+
+		reboot-mode {
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
 };
 
 &spmi_bus {
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-
msm8974.dtsi
index 45b5c8ef0374..1927430bded7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1085,6 +1085,17 @@
 				};
 			};
 		};
+
+		imem@fe805000 {
+			status = "disabled";
+			compatible = "syscon", "simple-mfd";
+			reg = <0xfe805000 0x1000>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x65c>;
+			};
+		};
 	};
 
 	smd {


Regards,
Luca
