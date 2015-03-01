From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: add rk3288 PopMetal board
Date: Sun, 01 Mar 2015 15:27:12 +0800
Message-ID: <54F2BF50.80307@rock-chips.com>
References: <1425034505-25163-1-git-send-email-andy.yan@rock-chips.com> <1425034983-25291-1-git-send-email-andy.yan@rock-chips.com> <3994534.hxJhVQddEv@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3994534.hxJhVQddEv@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko:

On 2015=E5=B9=B403=E6=9C=8801=E6=97=A5 01:57, Heiko St=C3=BCbner wrote:
> Hi Andy,
>
> Am Freitag, 27. Februar 2015, 19:03:03 schrieb Andy Yan:
>> PopMetal is a rockchip rk3288 based board made by ChipSpark,
>> which has many interface such as VGA,HDMI,usb,ir,sdcad and
>> lots of sensors such as gyroscope(L3G4200D),accelerometer(mma8452),
>> compass(AK8963C).
>>
>> This patch add a basic support for this board, which make the board
>> boot into a initramfs shell with sdcard and all sensors enabled
>>
>> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>   arch/arm/boot/dts/rk3288-popmetal.dts | 396
>> ++++++++++++++++++++++++++++++++++ 1 file changed, 396 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/rk3288-popmetal.dts
>>
>> diff --git a/arch/arm/boot/dts/rk3288-popmetal.dts
>> b/arch/arm/boot/dts/rk3288-popmetal.dts new file mode 100644
>> index 0000000..f0c0cd9
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/rk3288-popmetal.dts
>> @@ -0,0 +1,396 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> could you please put the new file under a gpl2+x11 dual license?
> See the firefly dts files for an example.
>
> Relicensing the of the already existing files is somewhere on my todo=
 list, but
> but at least we shouldn't introduce new restricted files at this poin=
t :-) .
>
>
> Licensing with a more permissible license is necessary so that other =
projects
> can use our dts files too (like the BSDs) and the gpl2 + x11 dual lic=
ense is
> the current agreed upon combination.
     ok, I will use gpl2+x11 dual license
>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "rk3288.dtsi"
>> +
>> +/ {
>> +	model =3D "PopMetal-RK3288";
>> +	compatible =3D "chipspark,popmetal-rk3288", "rockchip,rk3288";
> a blank line here please
    ok
>
>> +	memory{
>> +		reg =3D <0 0x80000000>;
>> +	};
>> +
>> +	ext_gmac: external-gmac-clock {
>> +		compatible =3D "fixed-clock";
>> +		clock-frequency =3D <125000000>;
>> +		clock-output-names =3D "ext_gmac";
>> +		#clock-cells =3D <0>;
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +		autorepeat;
>> +
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pwrbtn>;
>> +
>> +		button@0 {
>> +			gpios =3D <&gpio0 5 GPIO_ACTIVE_LOW>;
>> +			linux,code =3D <116>;
>> +			label =3D "GPIO Key Power";
>> +			linux,input-type =3D <1>;
>> +			gpio-key,wakeup =3D <1>;
>> +			debounce-interval =3D <100>;
>> +		};
>> +	};
>> +
>> +	ir: ir-receiver {
>> +		compatible =3D "gpio-ir-receiver";
>> +		gpios =3D <&gpio0 6 GPIO_ACTIVE_LOW>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&ir_int>;
>> +	};
>> +
>> +};
>> +
>> +&emmc {
>> +	broken-cd;
>> +	bus-width =3D <8>;
>> +	cap-mmc-highspeed;
>> +	disable-wp;
>> +	non-removable;
>> +	num-slots =3D <1>;
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&emmc_clk &emmc_cmd &emmc_pwr &emmc_bus8>;
>> +	status =3D "okay";
>> +};
>> +
>> +&sdmmc {
>> +	bus-width =3D <4>;
>> +	cap-mmc-highspeed;
>> +	cap-sd-highspeed;
>> +	card-detect-delay =3D <200>;
>> +	disable-wp;                     /* wp not hooked up */
>> +	num-slots =3D <1>;
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>> +	status =3D "okay";
>> +};
>> +
>> +&gmac {
>> +	phy-supply =3D <&vcc_lan>;
>> +	phy-mode =3D "rgmii";
>> +	clock_in_out =3D "input";
>> +	snps,reset-gpio =3D <&gpio4 7 0>;
>> +	snps,reset-active-low;
>> +	snps,reset-delays-us =3D <0 10000 1000000>;
>> +	assigned-clocks =3D <&cru SCLK_MAC>;
>> +	assigned-clock-parents =3D <&ext_gmac>;
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&rgmii_pins>;
>> +	tx_delay =3D <0x30>;
>> +	rx_delay =3D <0x10>;
>> +	status =3D "ok";
>> +};
>> +
>> +&hdmi {
>> +	ddc-i2c-bus =3D <&i2c5>;
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c0 {
>> +	status =3D "okay";
>> +	clock-frequency =3D <400000>;
>> +
>> +	rk808: pmic@1b {
>> +		compatible =3D "rockchip,rk808";
>> +		reg =3D <0x1b>;
>> +		interrupt-parent =3D <&gpio0>;
>> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pmic_int &global_pwroff>;
>> +		rockchip,system-power-controller;
>> +		wakeup-source;
>> +		#clock-cells =3D <1>;
>> +		clock-output-names =3D "xin32k", "rk808-clkout2";
>> +
>> +		vcc8-supply =3D <&vcc_18>;
>> +		vcc9-supply =3D <&vcc_io>;
>> +		vcc10-supply =3D <&vcc_io>;
>> +		vcc12-supply =3D <&vcc_io>;
>> +
>> +		regulators {
>> +			vdd_cpu: DCDC_REG1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <750000>;
>> +				regulator-max-microvolt =3D <1350000>;
>> +				regulator-name =3D "vdd_arm";
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdd_gpu: DCDC_REG2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <850000>;
>> +				regulator-max-microvolt =3D <1250000>;
>> +				regulator-name =3D "vdd_gpu";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <1000000>;
>> +				};
>> +			};
>> +
>> +			vcc_ddr: DCDC_REG3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-name =3D "vcc_ddr";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcc_io: DCDC_REG4 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <3300000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "vcc_io";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <3300000>;
>> +				};
>> +			};
>> +
>> +			vcc_lan: LDO_REG1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <3300000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "vcc_lan";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <3300000>;
>> +				};
>> +			};
>> +
>> +			vccio_sd: LDO_REG2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <3300000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "vccio_sd";
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdd_10: LDO_REG3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <1000000>;
>> +				regulator-max-microvolt =3D <1000000>;
>> +				regulator-name =3D "vdd_10";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <1000000>;
>> +				};
>> +			};
>> +
>> +			vcc18_lcd: LDO_REG4 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <1800000>;
>> +				regulator-max-microvolt =3D <1800000>;
>> +				regulator-name =3D "vcc18_lcd";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <1800000>;
>> +				};
>> +			};
>> +
>> +			ldo5: LDO_REG5 {
>> +				regulator-always-on;
>> +				regulator-min-microvolt =3D <1800000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "ldo5";
>> +			};
>> +
>> +			vdd10_lcd: LDO_REG6 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <1000000>;
>> +				regulator-max-microvolt =3D <1000000>;
>> +				regulator-name =3D "vdd10_lcd";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <1000000>;
>> +				};
>> +			};
>> +
>> +			vcc_18: LDO_REG7 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <1800000>;
>> +				regulator-max-microvolt =3D <1800000>;
>> +				regulator-name =3D "vcc_18";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <1800000>;
>> +				};
>> +			};
>> +
>> +			vcca_codec: LDO_REG8 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <3300000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "vcca_codec";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt =3D <3300000>;
>> +				};
>> +			};
>> +
>> +			vcc_wl: SWITCH_REG1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-name =3D "vcc_wl";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcc_lcd: SWITCH_REG2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-name =3D "vcc_lcd";
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +				};
>> +			};
> only for my peace of mind, does the board wake again from suspend wit=
h these
> rk808 settings? I.e. while I my rk3288-evb-rk808 wakes sucessfully, I=
 haven't
> been able to wake an act8846 based board (firefly) yet.
    I have not check suspend and wake up yet, I will test it and check=20
with Chris Zhong later
>
>> +		};
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	status =3D "okay";
>> +	clock-frequency =3D <400000>;
>> +
>> +	ak8963: ak8963@0d {
>> +		compatible =3D "asahi-kasei,ak8975";
>> +		reg =3D <0x0d>;
>> +		interrupt-parent =3D <&gpio8>;
>> +		interrupts =3D <1 IRQ_TYPE_EDGE_RISING>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&comp_int>;
>> +	};
>> +
>> +	l3g4200d: l3g4200d@68 {
>> +		compatible =3D "st,l3g4200d-gyro";
>> +		st,drdy-int-pin =3D <2>;
>> +		reg =3D <0x6b>;
>> +	};
>> +
>> +	mma8452: mma8452@1d {
>> +		compatible =3D "fsl,mma8452";
>> +		reg =3D <0x1d>;
>> +		interrupt-parent =3D <&gpio8>;
>> +		interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&gsensor_int>;
>> +	};
>> +};
>> +
>> +&i2c2 {
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c3 {
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c4 {
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c5 {
>> +	status =3D "okay";
>> +};
>> +
>> +&pinctrl {
>> +	buttons {
>> +	pwrbtn: pwrbtn {
>> +		rockchip,pins =3D <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
> pwrbtn needs one indentation more.
>
> Also please sort alphabetically ... "ak8963" before "buttons"
>
   OK, this will be fix in V2
>> +	};
>> +
>> +	ak8963 {
>> +		comp_int: comp-int {
>> +			rockchip,pins =3D <8 1 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	ir {
>> +		ir_int: ir-int {
>> +			rockchip,pins =3D <0 6 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	mma8452 {
>> +		gsensor_int: gsensor-int {
>> +			rockchip,pins =3D <8 0 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	pmic {
>> +		pmic_int: pmic-int {
>> +			rockchip,pins =3D <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +};
>> +
>> +&vopb {
>> +	status =3D "okay";
>> +};
>> +
>> +&vopb_mmu {
>> +	status =3D "okay";
>> +};
>> +
>> +&vopl {
>> +	status =3D "okay";
>> +};
>> +
>> +&vopl_mmu {
>> +	status =3D "okay";
>> +};
>> +
>> +&uart0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&uart1 {
>> +	status =3D "okay";
>> +};
>> +
>> +&uart2 {
>> +	status =3D "okay";
>> +};
>> +
>> +&uart3 {
>> +	status =3D "okay";
>> +};
>> +
>> +&uart4 {
>> +	status =3D "okay";
>> +};
>> +
>> +&usbphy {
>> +	status =3D "okay";
>> +};
> in general looks good. Because of the license issue I need you to sub=
mit a v2,
> otherwise I could have fixed the small nitpicks myself.
>
   Thanks very much for your review, I will fix all of them in V2
> Heiko
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
