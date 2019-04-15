From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v2 1/2] arm64: dts: fsl: librem5: Add a device tree for  the Librem5 devkit
Date: Mon, 15 Apr 2019 07:58:17 -0700
Message-ID: <8e0b801194e1a3e2961ccceeb9de5381@www.akkea.ca>
References: <20190412130427.13418-1-angus@akkea.ca>
 <20190412130427.13418-2-angus@akkea.ca>
 <baef6ba37a7a8d6e4dec0cfbc4ab8252b1d7a3fa.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <baef6ba37a7a8d6e4dec0cfbc4ab8252b1d7a3fa.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: matti.vaittinen@fi.rohmeurope.com, dl-linux-imx <linux-imx@nxp.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, mark.rutland@arm.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, Robin Gong <yibin.gong@nxp.com>, kernel@pengutronix.de, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org

On 2019-04-12 07:39, Leonard Crestez wrote:
> On Fri, 2019-04-12 at 07:04 -0600, Angus Ainslie (Purism) wrote:
>> +&i2c1 {
>> +       clock-frequency = <400000>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_i2c1>;
>> +       status = "okay";
>> +
>> +       pmic: pmic@4b {
>> +               reg = <0x4b>;
>> +               compatible = "rohm,bd71837";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pinctrl_pmic>;
>> +               clocks = <&pmic_osc>;
>> +               clock-names = "osc";
>> +               clock-output-names = "pmic_clk";
>> +               interrupt-parent = <&gpio1>;
>> +               interrupts = <3 GPIO_ACTIVE_LOW>;
>> +               interrupt-names = "irq";
>> +               rohm,reset-snvs-powered;
>> +
>> +               gpo {
>> +                       /* 0b0000_1100 all gpos with cmos output mode
>> */
>> +                       rohm,drv = <0x0C>;
>> +               };
> 
> After searching for this gpo/rohm,drv property it does not seem to be
> documented or handled anywhere?
> 
> Should probably just drop.

Right I can't find it in the driver either. I'll drop it.

Thanks
Angus

> 
>> +               regulators {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       buck1_reg: BUCK1@0 {
>> +                               reg = <0>;
>> +                               regulator-name = "buck1";
>> +                               regulator-min-microvolt = <700000>;
>> +                               regulator-max-microvolt = <1300000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                               regulator-ramp-delay = <1250>;
>> +                               rohm,dvs-run-voltage = <900000>;
>> +                               rohm,dvs-idle-voltage = <850000>;
>> +                               rohm,dvs-suspend-voltage = <800000>;
>> +                       };
>> +
>> +                       buck2_reg: BUCK2@1 {
>> +                               reg = <1>;
>> +                               regulator-name = "buck2";
>> +                               regulator-min-microvolt = <700000>;
>> +                               regulator-max-microvolt = <1300000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                               regulator-ramp-delay = <1250>;
>> +                               rohm,dvs-run-voltage = <1000000>;
>> +                               rohm,dvs-idle-voltage = <900000>;
>> +                       };
>> +
>> +                       buck3_reg: BUCK3@2 {
>> +                               reg = <2>;
>> +                               regulator-name = "buck3";
>> +                               regulator-min-microvolt = <700000>;
>> +                               regulator-max-microvolt = <1300000>;
>> +                               rohm,dvs-run-voltage = <1000000>;
>> +                       };
>> +
>> +                       buck4_reg: BUCK4@3 {
>> +                               reg = <3>;
>> +                               regulator-name = "buck4";
>> +                               regulator-min-microvolt = <700000>;
>> +                               regulator-max-microvolt = <1300000>;
>> +                               rohm,dvs-run-voltage = <1000000>;
>> +                       };
>> +
>> +                       buck5_reg: BUCK5@4 {
>> +                               reg = <4>;
>> +                               regulator-name = "buck5";
>> +                               regulator-min-microvolt = <700000>;
>> +                               regulator-max-microvolt = <1350000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       buck6_reg: BUCK6@5 {
>> +                               reg = <5>;
>> +                               regulator-name = "buck6";
>> +                               regulator-min-microvolt = <3000000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       buck7_reg: BUCK7@6 {
>> +                               reg = <6>;
>> +                               regulator-name = "buck7";
>> +                               regulator-min-microvolt = <1605000>;
>> +                               regulator-max-microvolt = <1995000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       buck8_reg: BUCK8@7 {
>> +                               reg = <7>;
>> +                               regulator-name = "buck8";
>> +                               regulator-min-microvolt = <800000>;
>> +                               regulator-max-microvolt = <1400000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       ldo1_reg: LDO1@8 {
>> +                               reg = <8>;
>> +                               regulator-name = "ldo1";
>> +                               regulator-min-microvolt = <3000000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       ldo2_reg: LDO2@9 {
>> +                               reg = <9>;
>> +                               regulator-name = "ldo2";
>> +                               regulator-min-microvolt = <900000>;
>> +                               regulator-max-microvolt = <900000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       ldo3_reg: LDO3@10 {
>> +                               reg = <10>;
>> +                               regulator-name = "ldo3";
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       ldo4_reg: LDO4@11 {
>> +                               reg = <11>;
>> +                               regulator-name = "ldo4";
>> +                               regulator-min-microvolt = <900000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                       };
>> +
>> +                       ldo5_reg: LDO5@12 {
>> +                               reg = <12>;
>> +                               regulator-name = "ldo5";
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                       };
>> +
>> +                       ldo6_reg: LDO6@13 {
>> +                               reg = <13>;
>> +                               regulator-name = "ldo6";
>> +                               regulator-min-microvolt = <900000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                       };
>> +
>> +                       ldo7_reg: LDO7@14 {
>> +                               reg = <14>;
>> +                               regulator-name = "ldo7";
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                       };
>> +               };
>> +       };
