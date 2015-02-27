From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] regulator: qcom-rpm: Rework for single device
Date: Thu, 26 Feb 2015 16:16:14 -0800
Message-ID: <54EFB74E.6050503@codeaurora.org>
References: <1424995217-23381-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1424995217-23381-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/26/15 16:00, Stephen Boyd wrote:
> The RPM regulators are not individual devices. Creating platform
> devices for each regulator bloats the kernel's runtime memory
> footprint by ~12k. Let's rework this driver to be a single
> platform device for all the RPM regulators. This makes the
> DT match the schematic/datasheet closer too because now the
> regulators node contains a list of supplies at the package level
> for a particular PMIC model.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>


This is the RPM node I used for testing so you can see the resulting DT.

		rpm@108000 {
			compatible	= "qcom,rpm-apq8064";
			reg		= <0x108000 0x1000>;
			qcom,ipc	= <&l2cc 0x8 2>;

			interrupts	= <0 19 0>, <0 21 0>, <0 22 0>;
			interrupt-names	= "ack", "err", "wakeup";

			regulators {
				compatible = "qcom,rpm-pm8921-regulators";
				vin_l1_l2_l12_l18-supply = <&pm8921_s4>;
				vin_lvs_1_3_6-supply = <&pm8921_s4>;
				vin_lvs_4_5_7-supply = <&pm8921_s4>;
				vin_ncp-supply = <&pm8921_l6>;
				vin_lvs2-supply = <&pm8921_s4>;
				vin_l24-supply = <&pm8921_s1>;
				vin_l25-supply = <&pm8921_s1>;
				vin_l27-supply = <&pm8921_s7>;
				vin_l28-supply = <&pm8921_s7>;

				/* Buck SMPS */
				pm8921_s1: s1 {
					regulator-always-on;
					regulator-min-microvolt = <1225000>;
					regulator-max-microvolt = <1225000>;
					qcom,switch-mode-frequency = <3200000>;
					bias-pull-down;
				};

				pm8921_s2: s2 {
					regulator-min-microvolt = <1300000>;
					regulator-max-microvolt = <1300000>;
					qcom,switch-mode-frequency = <1600000>;
					bias-pull-down;
				};

				pm8921_s3: s3 {
					regulator-min-microvolt = <500000>;
					regulator-max-microvolt = <1150000>;
					qcom,switch-mode-frequency = <4800000>;
					bias-pull-down;
				};

				pm8921_s4: s4 {
					regulator-always-on;
					regulator-min-microvolt = <1800000>;
					regulator-max-microvolt = <1800000>;
					qcom,switch-mode-frequency = <1600000>;
					bias-pull-down;
					qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
				};

				pm8921_s7: s7 {
					regulator-min-microvolt = <1300000>;
					regulator-max-microvolt = <1300000>;
					qcom,switch-mode-frequency = <3200000>;
				};

				pm8921_s8: s8 {
					regulator-min-microvolt = <2200000>;
					regulator-max-microvolt = <2200000>;
					qcom,switch-mode-frequency = <1600000>;
				};

				/* PMOS LDO */
				pm8921_l1: l1 {
					regulator-always-on;
					regulator-min-microvolt = <1100000>;
					regulator-max-microvolt = <1100000>;
					bias-pull-down;
				};

				pm8921_l2: l2 {
					regulator-min-microvolt = <1200000>;
					regulator-max-microvolt = <1200000>;
					bias-pull-down;
				};

				pm8921_l3: l3 {
					regulator-min-microvolt = <3075000>;
					regulator-max-microvolt = <3075000>;
					bias-pull-down;
				};

				pm8921_l4: l4 {
					regulator-always-on;
					regulator-min-microvolt = <1800000>;
					regulator-max-microvolt = <1800000>;
					bias-pull-down;
				};

				pm8921_l5: l5 {
					regulator-min-microvolt = <2950000>;
					regulator-max-microvolt = <2950000>;
					bias-pull-down;
				};

				pm8921_l6: l6 {
					regulator-min-microvolt = <2950000>;
					regulator-max-microvolt = <2950000>;
					bias-pull-down;
				};

				pm8921_l7: l7 {
					regulator-min-microvolt = <1850000>;
					regulator-max-microvolt = <2950000>;
					bias-pull-down;
				};

				pm8921_l8: l8 {
					regulator-min-microvolt = <2800000>;
					regulator-max-microvolt = <2800000>;
					bias-pull-down;
				};

				pm8921_l9: l9 {
					regulator-min-microvolt = <3000000>;
					regulator-max-microvolt = <3000000>;
					bias-pull-down;
				};

				pm8921_l10: l10 {
					regulator-min-microvolt = <2900000>;
					regulator-max-microvolt = <2900000>;
					bias-pull-down;
				};

				pm8921_l11: l11 {
					regulator-min-microvolt = <3000000>;
					regulator-max-microvolt = <3000000>;
					bias-pull-down;
				};

				pm8921_l12: l12 {
					regulator-min-microvolt = <1200000>;
					regulator-max-microvolt = <1200000>;
					bias-pull-down;
				};

					    /*
				pm8921_l13: l13 {
					regulator-min-microvolt = <2220000>;
					regulator-max-microvolt = <2220000>;
				};
				*/

				pm8921_l14: l14 {
					regulator-min-microvolt = <1800000>;
					regulator-max-microvolt = <1800000>;
					bias-pull-down;
				};

				pm8921_l15: l15 {
					regulator-min-microvolt = <1800000>;
					regulator-max-microvolt = <2950000>;
					bias-pull-down;
				};

				pm8921_l16: l16 {
					regulator-min-microvolt = <2800000>;
					regulator-max-microvolt = <2800000>;
					bias-pull-down;
				};

				pm8921_l17: l17 {
					regulator-min-microvolt = <2000000>;
					regulator-max-microvolt = <2000000>;
					bias-pull-down;
				};

				pm8921_l18: l18 {
					regulator-min-microvolt = <1300000>;
					regulator-max-microvolt = <1800000>;
					bias-pull-down;
				};

				pm8921_l21: l21 {
					regulator-min-microvolt = <1050000>;
					regulator-max-microvolt = <1050000>;
					bias-pull-down;
				};

				pm8921_l22: l22 {
					regulator-min-microvolt = <2600000>;
					regulator-max-microvolt = <2600000>;
					bias-pull-down;
				};

				pm8921_l23: l23 {
					regulator-min-microvolt = <1800000>;
					regulator-max-microvolt = <1800000>;
					bias-pull-down;
				};

				pm8921_l24: l24 {
					regulator-min-microvolt = <750000>;
					regulator-max-microvolt = <1150000>;
					bias-pull-down;
				};

				pm8921_l25: l25 {
					regulator-always-on;
					regulator-min-microvolt = <1250000>;
					regulator-max-microvolt = <1250000>;
					bias-pull-down;
				};

				pm8921_l27: l27 {
					regulator-min-microvolt = <1100000>;
					regulator-max-microvolt = <1100000>;
				};

				pm8921_l28: l28 {
					regulator-min-microvolt = <1050000>;
					regulator-max-microvolt = <1050000>;
					bias-pull-down;
				};

				pm8921_l29: l29 {
					regulator-min-microvolt = <2000000>;
					regulator-max-microvolt = <2000000>;
					bias-pull-down;
				};

				/* Low Voltage Switch */
				pm8921_lvs1: lvs1 {
					bias-pull-down;
				};

				pm8921_lvs2: lvs2 {
					bias-pull-down;
				};

				pm8921_lvs3: lvs3 {
					bias-pull-down;
				};

				pm8921_lvs4: lvs4 {
					bias-pull-down;
				};

				pm8921_lvs5: lvs5 {
					bias-pull-down;
				};

				pm8921_lvs6: lvs6 {
					bias-pull-down;
				};

				pm8921_lvs7: lvs7 {
					bias-pull-down;
				};

				pm8921_ncp: ncp {
					regulator-min-microvolt = <2000000>;
					regulator-max-microvolt = <2000000>;
					qcom,switch-mode-frequency = <1600000>;
				};
			};
		};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
