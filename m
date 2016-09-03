From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: Add MDM9615 dtsi
Date: Sat, 03 Sep 2016 14:48:47 +0200
Message-ID: <57CAC6AF.5090506@baylibre.com>
References: <1471951850-29842-1-git-send-email-narmstrong@baylibre.com>
 <1471951850-29842-2-git-send-email-narmstrong@baylibre.com>
 <20160826175502.GY19826@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160826175502.GY19826@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, david.brown@linaro.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



Le 26/08/2016 19:55, Stephen Boyd a =E9crit :
> On 08/23, Neil Armstrong wrote:
>> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qco=
m-mdm9615.dtsi
>> new file mode 100644
>> index 0000000..e30bfbd
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>> +/ {
>> +	model =3D "Qualcomm MDM9615";
>> +	compatible =3D "qcom,mdm9615";
>> +	interrupt-parent =3D <&intc>;
>> +
>> +	cpus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			compatible =3D "arm,cortex-a5";
>> +			device_type =3D "cpu";
>> +			next-level-cache =3D <&L2>;
>> +		};
>> +	};
>> +
>> +	cpu-pmu {
>> +		compatible =3D "arm,cortex-a5-pmu";
>> +		interrupts =3D <GIC_SPI 10 0x304>;
> =

> Should be 0x104? Or GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH?
Yes, and PPI also...

> =

>> +	};
>> +
>> +	clocks {
>> +		cxo_board {
>> +			compatible =3D "fixed-clock";
>> +			#clock-cells =3D <0>;
>> +			clock-frequency =3D <19200000>;
>> +		};
>> +	};
>> +
>> +	regulators {
> =

> This doesn't need to be a simple bus? so that the child devices
> probe? That's good if so.

It's correct, like the clocks node.

> =

>> +		vsdcc_fixed: vsdcc-regulator {
>> +			compatible =3D "regulator-fixed";
>> +			regulator-name =3D "SDCC Power";
>> +			regulator-min-microvolt =3D <2700000>;
>> +			regulator-max-microvolt =3D <2700000>;
>> +			regulator-always-on;
>> +		};
>> +	};
>> +
>> +	soc: soc {
> [...]
>> +		L2: l2-cache {
> =

> Missing unit address.
Done.

> =

>> +			compatible =3D "arm,pl310-cache";
>> +			reg =3D <0x02040000 0x1000>;
>> +			arm,data-latency =3D <2 2 0>;
>> +			cache-unified;
>> +			cache-level =3D <2>;
>> +		};
> [..]
>> +
>> +		qcom,ssbi@500000 {
>> +			compatible =3D "qcom,ssbi";
>> +			reg =3D <0x500000 0x1000>;
>> +			qcom,controller-type =3D "pmic-arbiter";
>> +
>> +			pmicintc: pmic@0 {
>> +				compatible =3D "qcom,pm8018", "qcom,pm8921";
>> +				interrupts =3D <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
>> +				#interrupt-cells =3D <2>;
>> +				interrupt-controller;
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +
>> +				pwrkey@1c {
>> +					compatible =3D "qcom,pm8018-pwrkey", "qcom,pm8921-pwrkey";
>> +					reg =3D <0x1c>;
>> +					interrupt-parent =3D <&pmicintc>;
>> +					interrupts =3D <50 IRQ_TYPE_NONE>,
>> +						     <51 IRQ_TYPE_NONE>;
> =

> IRQ_TYPE_EDGE_RISING?
Crap, I'll revert these.

> =

>> +					debounce =3D <15625>;
>> +					pull-up;
>> +				};
>> +
>> +				pmicmpp: mpp@50 {
>> +					compatible =3D "qcom,pm8018-mpp", "qcom,ssbi-mpp";
>> +					interrupt-parent =3D <&pmicintc>;
>> +					interrupts =3D <24 IRQ_TYPE_NONE>,
>> +						     <25 IRQ_TYPE_NONE>,
>> +						     <26 IRQ_TYPE_NONE>,
>> +						     <27 IRQ_TYPE_NONE>,
>> +						     <28 IRQ_TYPE_NONE>,
>> +						     <29 IRQ_TYPE_NONE>;
> =

> These are right though.
> =

>> +					reg =3D <0x50>;
>> +					gpio-controller;
>> +					#gpio-cells =3D <2>;
>> +				};
>> +
>> +				rtc@11d {
>> +					compatible =3D "qcom,pm8018-rtc", "qcom,pm8921-rtc";
>> +					interrupt-parent =3D <&pmicintc>;
>> +					interrupts =3D <39 IRQ_TYPE_NONE>;
> =

> IRQ_TYPE_EDGE_RISING?
Crap, Crap, reverting...

> =

>> +					reg =3D <0x11d>;
>> +					allow-set-time;
>> +				};
>> +
>> +				pmicgpio: gpio@150 {
>> +					compatible =3D "qcom,pm8018-gpio", "qcom,ssbi-gpio";
>> +					interrupt-parent =3D <&pmicintc>;
>> +					interrupts =3D <24 IRQ_TYPE_NONE>,
>> +						     <25 IRQ_TYPE_NONE>,
>> +						     <26 IRQ_TYPE_NONE>,
>> +						     <27 IRQ_TYPE_NONE>,
>> +						     <28 IRQ_TYPE_NONE>,
>> +						     <29 IRQ_TYPE_NONE>;
> =

> These are right though.
> =

>> +					gpio-controller;
>> +					#gpio-cells =3D <2>;
>> +				};
>> +			};
>> +		};
>> +
>> +		rpm: rpm@108000 {
>> +			compatible =3D "qcom,rpm-mdm9615";
>> +			reg =3D <0x108000 0x1000>;
>> +
>> +			qcom,ipc =3D <&l2cc 0x8 2>;
>> +
>> +			interrupts =3D <0 19 0>, <0 21 0>, <0 22 0>;
> =

> IRQ_TYPE_EDGE_RISING and GIC_SPI?

Exact, will beautify these.

Thanks,
Neil
