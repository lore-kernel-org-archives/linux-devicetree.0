Return-Path: <SRS0=08e4=WA=gmail.com=andyshrk@kernel.org>
MIME-Version: 1.0
References: <20190803114612.4830-1-andyshrk@gmail.com> <22687582.BTWJvYJJdG@phil>
In-Reply-To: <22687582.BTWJvYJJdG@phil>
From: Andy Yan <andyshrk@gmail.com>
Date: Sun, 4 Aug 2019 16:38:26 +0800
Message-ID: <CANbgqATNLO=wJfKNDY74qmQUqAP_9Xv29nGhLj+Y0Cc7CAMQyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add dts for Leez RK3399 P710 SBC
Content-Type: multipart/alternative; boundary="000000000000e4bd29058f468409"
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000e4bd29058f468409
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko=EF=BC=9A

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2019=E5=B9=B48=E6=9C=884=E6=97=A5=
=E5=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=888:34=E5=86=99=E9=81=93=EF=BC=9A

> Hi Andy,
>
> Am Samstag, 3. August 2019, 13:46:12 CEST schrieb Andy Yan:
> > Leez P710 is a RK3399 based SBC, designed by Leez team
> > from lenovo [0].
> >
> > Specification
> > - Rockchip RK3399
> > - 4/2GB LPDDR4
> > - TF sd scard slot
> > - eMMC
> > - M.2 B-Key for 4G LTE
> > - AP6256 for WiFi + BT
> > - Gigabit ethernet
> > - HDMI out
> > - 40 pin header
> > - TYPE-C Power supply
> >
> > [0] https://leez.lenovo.com
> >
> > Signed-off-by: Andy Yan <andyshrk@gmail.com>
> > ---
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../boot/dts/rockchip/rk3399-leez-p710.dts    | 635 ++++++++++++++++++
> >  3 files changed, 641 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
> >
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml
> b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > index 34865042f4e4..da9cd947abfa 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -329,6 +329,11 @@ properties:
> >                - khadas,edge-v
> >            - const: rockchip,rk3399
> >
> > +      - description: Leez RK3399 P710
> > +        items:
> > +          - const: leez,p710
>
> Is "leez" really the vendor?
> Part of me would assume something like
>         lenovo,leez-p710
>
>
According to Leez team=EF=BC=8C they want to treat Leez an independent vend=
or here=E3=80=82



> So please clarify :-)
> And also please make sure the decided vendor is part of the vendor-prefix=
es
> binding in Documentation/devicestree/bindings/vendor-prefixes.yaml
>
> > +          - const: rockchip,rk3399
> > +
> >        - description: mqmaker MiQi
> >          items:
> >            - const: mqmaker,miqi
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> > index daa2c78e22c3..1f18a9392d15 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-hugsun-x99.dt=
b
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-khadas-edge.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-khadas-edge-captain.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-khadas-edge-v.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-leez-p710.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-nanopc-t4.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-nanopi-m4.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-nanopi-neo4.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
> > new file mode 100644
> > index 000000000000..b342f5e8692b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
> > @@ -0,0 +1,635 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Andy Yan <andy.yan@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "rk3399.dtsi"
> > +#include "rk3399-opp.dtsi"
> > +
> > +/ {
> > +     model =3D "Leez RK3399 P710";
> > +     compatible =3D "leez,p710", "rockchip,rk3399";
>
> same comment as above, so maybe:
>         model =3D "Lenovo Leez RK3399 P710";
>         compatible =3D "lenovo,leez-p710", "rockchip,rk3399";
>
>
>
> > +
> > +     chosen {
> > +             stdout-path =3D "serial2:1500000n8";
> > +     };
> > +
> > +     clkin_gmac: external-gmac-clock {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clkin_gmac";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     sdio_pwrseq: sdio-pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&rk808 1>;
> > +             clock-names =3D "ext_clock";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wifi_enable_h>;
> > +             reset-gpios =3D <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> > +     };
> > +
> > +     dc5v_adp: dc-5v {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "dc5v_adapter";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +     };
> > +
> > +     vcc5v0_sys: vcc-sys {
>
> vcc5v0_sys: vcc5v0-sys ?
>
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc5v0_sys";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             vin-supply =3D <&dc5v_adp>;
> > +     };
> > +
> > +     vcc3v3_sys: vcc3v3-sys {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc3v3_sys";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +     };
> > +
> > +     vcc5v0_host: vcc5v0-host-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&gpio2 RK_PA2 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&vcc5v0_host_en>;
> > +             regulator-name =3D "vcc5v0_host";
> > +             regulator-always-on;
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +     };
> > +
> > +     vcc_lan: vcc3v3-phy-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc_lan";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +
> > +             regulator-state-mem {
> > +                     regulator-off-in-suspend;
> > +             };
> > +     };
>
> In general, please model an actual regulator-tree and do not copy the
> unspecific Rockchip vendor tree. These unconnected regulators are a very
> good indicator that the real power-tree got ignored (missing vin-supply
> here)
>
> I found schematics on https://github.com/leezsbc/resources/wiki/Leez-P710=
:
> =E9=93=BE=E6=8E=A5: https://pan.baidu.com/s/1NPWbuI5csT4zftKUCnRs7g
> =E6=8F=90=E5=8F=96=E7=A0=81: rvrh
>
> and there the power-tree is described in a complete way.
>
> regulator/regulator_summaray in the kernels debugfs should
> show a nice tree structure starting from the dc-adapter input.
>
> Also please use names matching the supply names from the schematics.
>
> Same for pinctrl names, please use names as used in the board schematics.
>
>
> > +     vdd_log: vdd-log {
> > +             compatible =3D "pwm-regulator";
> > +             pwms =3D <&pwm2 0 25000 1>;
> > +             regulator-name =3D "vdd_log";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <800000>;
> > +             regulator-max-microvolt =3D <1400000>;
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +     };
> > +};
> > +
> > +&cpu_l0 {
> > +     cpu-supply =3D <&vdd_cpu_l>;
> > +};
> > +
> > +&cpu_l1 {
> > +     cpu-supply =3D <&vdd_cpu_l>;
> > +};
> > +
> > +&cpu_l2 {
> > +     cpu-supply =3D <&vdd_cpu_l>;
> > +};
> > +
> > +&cpu_l3 {
> > +     cpu-supply =3D <&vdd_cpu_l>;
> > +};
> > +
> > +&cpu_b0 {
> > +     cpu-supply =3D <&vdd_cpu_b>;
> > +};
> > +
> > +&cpu_b1 {
> > +     cpu-supply =3D <&vdd_cpu_b>;
> > +};
> > +
> > +&emmc_phy {
> > +     status =3D "okay";
> > +};
> > +
> > +&gmac {
> > +     assigned-clocks =3D <&cru SCLK_RMII_SRC>;
> > +     assigned-clock-parents =3D <&clkin_gmac>;
> > +     clock_in_out =3D "input";
> > +     phy-supply =3D <&vcc_lan>;
> > +     phy-mode =3D "rgmii";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&rgmii_pins>;
> > +     snps,reset-gpio =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> > +     snps,reset-active-low;
> > +     snps,reset-delays-us =3D <0 10000 50000>;
> > +     tx_delay =3D <0x28>;
> > +     rx_delay =3D <0x11>;
> > +     status =3D "okay";
> > +};
> > +
> > +&gpu {
> > +     mali-supply =3D <&vdd_gpu>;
> > +     status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +     ddc-i2c-bus =3D <&i2c3>;
>
> can this also use the internal i2c inside the dw-hdmi?
>
>
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&hdmi_cec>;
> > +     status =3D "okay";
> > +};
> > +
> > +&hdmi_sound {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +     clock-frequency =3D <400000>;
> > +     i2c-scl-rising-time-ns =3D <168>;
> > +     i2c-scl-falling-time-ns =3D <4>;
> > +     status =3D "okay";
> > +
> > +     rk808: pmic@1b {
> > +             compatible =3D "rockchip,rk808";
> > +             reg =3D <0x1b>;
> > +             interrupt-parent =3D <&gpio1>;
> > +             interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
> > +             #clock-cells =3D <1>;
> > +             clock-output-names =3D "xin32k", "rk808-clkout2";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pmic_int_l>;
> > +             rockchip,system-power-controller;
> > +             wakeup-source;
> > +
> > +             vcc1-supply =3D <&vcc5v0_sys>;
> > +             vcc2-supply =3D <&vcc5v0_sys>;
> > +             vcc3-supply =3D <&vcc5v0_sys>;
> > +             vcc4-supply =3D <&vcc5v0_sys>;
> > +             vcc6-supply =3D <&vcc5v0_sys>;
> > +             vcc7-supply =3D <&vcc5v0_sys>;
> > +             vcc8-supply =3D <&vcc3v3_sys>;
> > +             vcc9-supply =3D <&vcc5v0_sys>;
> > +             vcc10-supply =3D <&vcc5v0_sys>;
> > +             vcc11-supply =3D <&vcc5v0_sys>;
> > +             vcc12-supply =3D <&vcc3v3_sys>;
> > +             vddio-supply =3D <&vcc_1v8>;
> > +
> > +             regulators {
> > +                     vdd_center: DCDC_REG1 {
> > +                             regulator-name =3D "vdd_center";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <750000>;
> > +                             regulator-max-microvolt =3D <1350000>;
> > +                             regulator-ramp-delay =3D <6001>;
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vdd_cpu_l: DCDC_REG2 {
> > +                             regulator-name =3D "vdd_cpu_l";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <750000>;
> > +                             regulator-max-microvolt =3D <1350000>;
> > +                             regulator-ramp-delay =3D <6001>;
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vcc_ddr: DCDC_REG3 {
> > +                             regulator-name =3D "vcc_ddr";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-state-mem {
> > +                                     regulator-on-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vcc_1v8: DCDC_REG4 {
> > +                             regulator-name =3D "vcc_1v8";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-state-mem {
> > +                                     regulator-on-in-suspend;
> > +                                     regulator-suspend-microvolt =3D
> <1800000>;
> > +                             };
> > +                     };
> > +
> > +                     vcc1v8_dvp: LDO_REG1 {
> > +                             regulator-name =3D "vcc1v8_dvp";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vcc1v8_hdmi: LDO_REG2 {
> > +                             regulator-name =3D "vcc1v8_hdmi";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vcca_1v8: LDO_REG3 {
> > +                             regulator-name =3D "vcca_1v8";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-state-mem {
> > +                                     regulator-on-in-suspend;
> > +                                     regulator-suspend-microvolt =3D
> <1800000>;
> > +                             };
> > +                     };
> > +
> > +                     vccio_sd: LDO_REG4 {
> > +                             regulator-name =3D "vccio_sd";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <3000000>;
> > +                             regulator-max-microvolt =3D <3000000>;
> > +                             regulator-state-mem {
> > +                                     regulator-on-in-suspend;
> > +                                     regulator-suspend-microvolt =3D
> <3000000>;
> > +                             };
> > +                     };
> > +
> > +                     vcca3v0_codec: LDO_REG5 {
> > +                             regulator-name =3D "vcca3v0_codec";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <3000000>;
> > +                             regulator-max-microvolt =3D <3000000>;
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vcc_1v5: LDO_REG6 {
> > +                             regulator-name =3D "vcc_1v5";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <1500000>;
> > +                             regulator-max-microvolt =3D <1500000>;
> > +                             regulator-state-mem {
> > +                                     regulator-on-in-suspend;
> > +                                     regulator-suspend-microvolt =3D
> <1500000>;
> > +                             };
> > +                     };
> > +
> > +                     vcc0v9_hdmi: LDO_REG7 {
> > +                             regulator-name =3D "vcc0v9_hdmi";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <900000>;
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                             };
> > +                     };
> > +
> > +                     vcc_3v0: LDO_REG8 {
> > +                             regulator-name =3D "vcc_3v0";
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <3000000>;
> > +                             regulator-max-microvolt =3D <3000000>;
> > +                             regulator-state-mem {
> > +                                     regulator-on-in-suspend;
> > +                                     regulator-suspend-microvolt =3D
> <3000000>;
> > +                             };
> > +                     };
> > +
>
> unneeded blank line
>
> > +             };
> > +     };
> > +
>
>
> Heiko
>
>
>

--000000000000e4bd29058f468409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgSGVpa2/vvJo8L2Rpdj48YnI+PGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5IZWlr
byBTdHVlYm5lciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmhlaWtvQHNudGVjaC5kZSI+aGVpa29Ac250
ZWNoLmRlPC9hPiZndDsg5LqOMjAxOeW5tDjmnIg05pel5ZGo5pelIOS4iuWNiDg6MzTlhpnpgZPv
vJo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQp
O3BhZGRpbmctbGVmdDoxZXgiPkhpIEFuZHksPGJyPg0KPGJyPg0KQW0gU2Ftc3RhZywgMy4gQXVn
dXN0IDIwMTksIDEzOjQ2OjEyIENFU1Qgc2NocmllYiBBbmR5IFlhbjo8YnI+DQomZ3Q7IExlZXog
UDcxMCBpcyBhIFJLMzM5OSBiYXNlZCBTQkMsIGRlc2lnbmVkIGJ5IExlZXogdGVhbTxicj4NCiZn
dDsgZnJvbSBsZW5vdm8gWzBdLjxicj4NCiZndDsgPGJyPg0KJmd0OyBTcGVjaWZpY2F0aW9uPGJy
Pg0KJmd0OyAtIFJvY2tjaGlwIFJLMzM5OTxicj4NCiZndDsgLSA0LzJHQiBMUEREUjQ8YnI+DQom
Z3Q7IC0gVEYgc2Qgc2NhcmQgc2xvdDxicj4NCiZndDsgLSBlTU1DPGJyPg0KJmd0OyAtIE0uMiBC
LUtleSBmb3IgNEcgTFRFPGJyPg0KJmd0OyAtIEFQNjI1NiBmb3IgV2lGaSArIEJUPGJyPg0KJmd0
OyAtIEdpZ2FiaXQgZXRoZXJuZXQ8YnI+DQomZ3Q7IC0gSERNSSBvdXQ8YnI+DQomZ3Q7IC0gNDAg
cGluIGhlYWRlcjxicj4NCiZndDsgLSBUWVBFLUMgUG93ZXIgc3VwcGx5PGJyPg0KJmd0OyA8YnI+
DQomZ3Q7IFswXSA8YSBocmVmPSJodHRwczovL2xlZXoubGVub3ZvLmNvbSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9sZWV6Lmxlbm92by5jb208L2E+PGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuICZsdDs8YSBocmVmPSJtYWlsdG86
YW5keXNocmtAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YW5keXNocmtAZ21haWwuY29tPC9h
PiZndDs8YnI+DQomZ3Q7IC0tLTxicj4NCiZndDvCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vcm9ja2NoaXAueWFtbMKgIMKgIMKgfMKgIMKgNSArPGJyPg0KJmd0O8KgIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcm9ja2NoaXAvTWFrZWZpbGXCoCDCoCDCoCDCoCDCoHzCoCDCoDEgKzxicj4NCiZn
dDvCoCAuLi4vYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LWxlZXotcDcxMC5kdHPCoCDCoCB8IDYz
NSArKysrKysrKysrKysrKysrKys8YnI+DQomZ3Q7wqAgMyBmaWxlcyBjaGFuZ2VkLCA2NDEgaW5z
ZXJ0aW9ucygrKTxicj4NCiZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9yazMzOTktbGVlei1wNzEwLmR0czxicj4NCiZndDsgPGJyPg0KJmd0OyBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yb2NrY2hp
cC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yb2NrY2hpcC55
YW1sPGJyPg0KJmd0OyBpbmRleCAzNDg2NTA0MmY0ZTQuLmRhOWNkOTQ3YWJmYSAxMDA2NDQ8YnI+
DQomZ3Q7IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcm9ja2No
aXAueWFtbDxicj4NCiZndDsgKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9yb2NrY2hpcC55YW1sPGJyPg0KJmd0OyBAQCAtMzI5LDYgKzMyOSwxMSBAQCBwcm9wZXJ0
aWVzOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAtIGtoYWRhcyxlZGdlLXY8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgLSBjb25zdDogcm9ja2NoaXAscmszMzk5PGJyPg0KJmd0
O8KgIDxicj4NCiZndDsgK8KgIMKgIMKgIC0gZGVzY3JpcHRpb246IExlZXogUkszMzk5IFA3MTA8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCBpdGVtczo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCAt
IGNvbnN0OiBsZWV6LHA3MTA8YnI+DQo8YnI+DQpJcyAmcXVvdDtsZWV6JnF1b3Q7IHJlYWxseSB0
aGUgdmVuZG9yPzxicj4NClBhcnQgb2YgbWUgd291bGQgYXNzdW1lIHNvbWV0aGluZyBsaWtlPGJy
Pg0KwqAgwqAgwqAgwqAgbGVub3ZvLGxlZXotcDcxMDxicj48YnI+PC9ibG9ja3F1b3RlPjxkaXY+
PGJyPjwvZGl2PjxkaXY+QWNjb3JkaW5nIHRvIExlZXogdGVhbe+8jCB0aGV5IHdhbnQgdG8gdHJl
YXQgTGVleiBhbiBpbmRlcGVuZGVudCB2ZW5kb3IgaGVyZeOAgjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+wqDCoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NClNvIHBsZWFzZSBjbGFyaWZ5IDotKTxicj4NCkFuZCBh
bHNvIHBsZWFzZSBtYWtlIHN1cmUgdGhlIGRlY2lkZWQgdmVuZG9yIGlzIHBhcnQgb2YgdGhlIHZl
bmRvci1wcmVmaXhlczxicj4NCmJpbmRpbmcgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2VzdHJlZS9i
aW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbDxicj4NCjxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIC0gY29uc3Q6IHJvY2tjaGlwLHJrMzM5OTxicj4NCiZndDsgKzxicj4NCiZndDvCoCDCoCDC
oCDCoCAtIGRlc2NyaXB0aW9uOiBtcW1ha2VyIE1pUWk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
aXRlbXM6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIC0gY29uc3Q6IG1xbWFrZXIsbWlxaTxi
cj4NCiZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvTWFrZWZp
bGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL01ha2VmaWxlPGJyPg0KJmd0OyBpbmRl
eCBkYWEyYzc4ZTIyYzMuLjFmMThhOTM5MmQxNSAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvTWFrZWZpbGU8YnI+DQomZ3Q7ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcm9ja2NoaXAvTWFrZWZpbGU8YnI+DQomZ3Q7IEBAIC0yMCw2ICsyMCw3IEBA
IGR0Yi0kKENPTkZJR19BUkNIX1JPQ0tDSElQKSArPSByazMzOTktaHVnc3VuLXg5OS5kdGI8YnI+
DQomZ3Q7wqAgZHRiLSQoQ09ORklHX0FSQ0hfUk9DS0NISVApICs9IHJrMzM5OS1raGFkYXMtZWRn
ZS5kdGI8YnI+DQomZ3Q7wqAgZHRiLSQoQ09ORklHX0FSQ0hfUk9DS0NISVApICs9IHJrMzM5OS1r
aGFkYXMtZWRnZS1jYXB0YWluLmR0Yjxicj4NCiZndDvCoCBkdGItJChDT05GSUdfQVJDSF9ST0NL
Q0hJUCkgKz0gcmszMzk5LWtoYWRhcy1lZGdlLXYuZHRiPGJyPg0KJmd0OyArZHRiLSQoQ09ORklH
X0FSQ0hfUk9DS0NISVApICs9IHJrMzM5OS1sZWV6LXA3MTAuZHRiPGJyPg0KJmd0O8KgIGR0Yi0k
KENPTkZJR19BUkNIX1JPQ0tDSElQKSArPSByazMzOTktbmFub3BjLXQ0LmR0Yjxicj4NCiZndDvC
oCBkdGItJChDT05GSUdfQVJDSF9ST0NLQ0hJUCkgKz0gcmszMzk5LW5hbm9waS1tNC5kdGI8YnI+
DQomZ3Q7wqAgZHRiLSQoQ09ORklHX0FSQ0hfUk9DS0NISVApICs9IHJrMzM5OS1uYW5vcGktbmVv
NC5kdGI8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlw
L3JrMzM5OS1sZWV6LXA3MTAuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMz
OTktbGVlei1wNzEwLmR0czxicj4NCiZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7
IGluZGV4IDAwMDAwMDAwMDAwMC4uYjM0MmY1ZTg2OTJiPGJyPg0KJmd0OyAtLS0gL2Rldi9udWxs
PGJyPg0KJmd0OyArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS1sZWV6
LXA3MTAuZHRzPGJyPg0KJmd0OyBAQCAtMCwwICsxLDYzNSBAQDxicj4NCiZndDsgKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKTxicj4NCiZndDsgKy8qPGJyPg0K
Jmd0OyArICogQ29weXJpZ2h0IChjKSAyMDE5IEFuZHkgWWFuICZsdDs8YSBocmVmPSJtYWlsdG86
YW5keS55YW5AZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+YW5keS55YW5AZ21haWwuY29tPC9h
PiZndDs8YnI+DQomZ3Q7ICsgKi88YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsvZHRzLXYxLzs8YnI+
DQomZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvaW5wdXQvbGludXgtZXZlbnQtY29kZXMu
aCZndDs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvcHdtL3B3bS5oJmd0Ozxi
cj4NCiZndDsgKyNpbmNsdWRlICZxdW90O3JrMzM5OS5kdHNpJnF1b3Q7PGJyPg0KJmd0OyArI2lu
Y2x1ZGUgJnF1b3Q7cmszMzk5LW9wcC5kdHNpJnF1b3Q7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
LyB7PGJyPg0KJmd0OyArwqAgwqAgwqBtb2RlbCA9ICZxdW90O0xlZXogUkszMzk5IFA3MTAmcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bGVleixwNzEwJnF1b3Q7
LCAmcXVvdDtyb2NrY2hpcCxyazMzOTkmcXVvdDs7PGJyPg0KPGJyPg0Kc2FtZSBjb21tZW50IGFz
IGFib3ZlLCBzbyBtYXliZTo8YnI+DQrCoCDCoCDCoCDCoCBtb2RlbCA9ICZxdW90O0xlbm92byBM
ZWV6IFJLMzM5OSBQNzEwJnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAmcXVv
dDtsZW5vdm8sbGVlei1wNzEwJnF1b3Q7LCAmcXVvdDtyb2NrY2hpcCxyazMzOTkmcXVvdDs7PGJy
Pg0KPGJyPg0KPGJyPg0KPGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqBjaG9zZW4gezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3Rkb3V0LXBhdGggPSAmcXVvdDtzZXJpYWwy
OjE1MDAwMDBuOCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArwqAgwqAgwqBjbGtpbl9nbWFjOiBleHRlcm5hbC1nbWFjLWNsb2NrIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtmaXhlZC1jbG9jayZxdW90
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsx
MjUwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stb3V0cHV0
LW5hbWVzID0gJnF1b3Q7Y2xraW5fZ21hYyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJy
Pg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqBzZGlvX3B3cnNlcTogc2Rpby1wd3JzZXEgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O21tYy1wd3Jz
ZXEtc2ltcGxlJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0g
Jmx0OyZhbXA7cms4MDggMSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
ay1uYW1lcyA9ICZxdW90O2V4dF9jbG9jayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7d2lmaV9lbmFibGVfaCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXNldC1ncGlvcyA9ICZsdDsmYW1wO2dw
aW8wIFJLX1BCMiBHUElPX0FDVElWRV9MT1cmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoGRjNXZfYWRwOiBkYy01diB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cmVndWxhdG9yLWZpeGVkJnF1
b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVv
dDtkYzV2X2FkYXB0ZXImcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1
bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9y
LWJvb3Qtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA9ICZsdDs1MDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoHZjYzV2MF9zeXM6IHZjYy1z
eXMgezxicj4NCjxicj4NCnZjYzV2MF9zeXM6IHZjYzV2MC1zeXMgPzxicj4NCjxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3JlZ3VsYXRvci1maXhlZCZx
dW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1
b3Q7dmNjNXYwX3N5cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3Vs
YXRvci1hbHdheXMtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3It
Ym9vdC1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWlj
cm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7NTAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqB2aW4tc3VwcGx5ID0gJmx0OyZhbXA7ZGM1dl9hZHAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoHZjYzN2M19z
eXM6IHZjYzN2My1zeXMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O3JlZ3VsYXRvci1maXhlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmNjM3YzX3N5cyZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYm9vdC1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzMzMDAwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7
MzMwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2aW4tc3VwcGx5ID0g
Jmx0OyZhbXA7dmNjNXYwX3N5cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgdmNjNXYwX2hvc3Q6IHZjYzV2MC1ob3N0LXJlZ3VsYXRvciB7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cmVndWxh
dG9yLWZpeGVkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZW5hYmxlLWFj
dGl2ZS1oaWdoOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3BpbyA9ICZsdDsmYW1w
O2dwaW8yIFJLX1BBMiBHUElPX0FDVElWRV9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7dmNjNXYwX2hvc3RfZW4m
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVv
dDt2Y2M1djBfaG9zdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3Vs
YXRvci1hbHdheXMtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2aW4tc3VwcGx5
ID0gJmx0OyZhbXA7dmNjNXYwX3N5cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgdmNjX2xhbjogdmNjM3YzLXBoeS1yZWd1bGF0b3Igezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3JlZ3VsYXRv
ci1maXhlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1u
YW1lID0gJnF1b3Q7dmNjX2xhbiZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1
bGF0b3ItYm9vdC1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gJmx0OzMzMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itc3RhdGUtbWVtIHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1vZmYt
aW4tc3VzcGVuZDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAr
wqAgwqAgwqB9Ozxicj4NCjxicj4NCkluIGdlbmVyYWwsIHBsZWFzZSBtb2RlbCBhbiBhY3R1YWwg
cmVndWxhdG9yLXRyZWUgYW5kIGRvIG5vdCBjb3B5IHRoZTxicj4NCnVuc3BlY2lmaWMgUm9ja2No
aXAgdmVuZG9yIHRyZWUuIFRoZXNlIHVuY29ubmVjdGVkIHJlZ3VsYXRvcnMgYXJlIGEgdmVyeTxi
cj4NCmdvb2QgaW5kaWNhdG9yIHRoYXQgdGhlIHJlYWwgcG93ZXItdHJlZSBnb3QgaWdub3JlZCAo
bWlzc2luZyB2aW4tc3VwcGx5IGhlcmUpPGJyPg0KPGJyPg0KSSBmb3VuZCBzY2hlbWF0aWNzIG9u
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9sZWV6c2JjL3Jlc291cmNlcy93aWtpL0xlZXot
UDcxMCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29t
L2xlZXpzYmMvcmVzb3VyY2VzL3dpa2kvTGVlei1QNzEwPC9hPjo8YnI+DQrpk77mjqU6IDxhIGhy
ZWY9Imh0dHBzOi8vcGFuLmJhaWR1LmNvbS9zLzFOUFdidUk1Y3NUNHpmdEtVQ25SczdnIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3Bhbi5iYWlkdS5jb20vcy8xTlBX
YnVJNWNzVDR6ZnRLVUNuUnM3ZzwvYT48YnI+DQrmj5Dlj5bnoIE6IHJ2cmg8YnI+DQo8YnI+DQph
bmQgdGhlcmUgdGhlIHBvd2VyLXRyZWUgaXMgZGVzY3JpYmVkIGluIGEgY29tcGxldGUgd2F5Ljxi
cj4NCjxicj4NCnJlZ3VsYXRvci9yZWd1bGF0b3Jfc3VtbWFyYXkgaW4gdGhlIGtlcm5lbHMgZGVi
dWdmcyBzaG91bGQ8YnI+DQpzaG93IGEgbmljZSB0cmVlIHN0cnVjdHVyZSBzdGFydGluZyBmcm9t
IHRoZSBkYy1hZGFwdGVyIGlucHV0Ljxicj4NCjxicj4NCkFsc28gcGxlYXNlIHVzZSBuYW1lcyBt
YXRjaGluZyB0aGUgc3VwcGx5IG5hbWVzIGZyb20gdGhlIHNjaGVtYXRpY3MuPGJyPg0KPGJyPg0K
U2FtZSBmb3IgcGluY3RybCBuYW1lcywgcGxlYXNlIHVzZSBuYW1lcyBhcyB1c2VkIGluIHRoZSBi
b2FyZCBzY2hlbWF0aWNzLjxicj4NCjxicj4NCjxicj4NCiZndDsgK8KgIMKgIMKgdmRkX2xvZzog
dmRkLWxvZyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7cHdtLXJlZ3VsYXRvciZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHB3
bXMgPSAmbHQ7JmFtcDtwd20yIDAgMjUwMDAgMSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3ZkZF9sb2cmcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLWJvb3Qtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDs4MDAwMDAmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTQw
MDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2aW4tc3VwcGx5ID0gJmx0
OyZhbXA7dmNjNXYwX3N5cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDsgK307
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtjcHVfbDAgezxicj4NCiZndDsgK8KgIMKgIMKg
Y3B1LXN1cHBseSA9ICZsdDsmYW1wO3ZkZF9jcHVfbCZndDs7PGJyPg0KJmd0OyArfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2NwdV9sMSB7PGJyPg0KJmd0OyArwqAgwqAgwqBjcHUtc3Vw
cGx5ID0gJmx0OyZhbXA7dmRkX2NwdV9sJmd0Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgKyZhbXA7Y3B1X2wyIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoGNwdS1zdXBwbHkgPSAm
bHQ7JmFtcDt2ZGRfY3B1X2wmZ3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArJmFtcDtjcHVfbDMgezxicj4NCiZndDsgK8KgIMKgIMKgY3B1LXN1cHBseSA9ICZsdDsmYW1w
O3ZkZF9jcHVfbCZndDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1w
O2NwdV9iMCB7PGJyPg0KJmd0OyArwqAgwqAgwqBjcHUtc3VwcGx5ID0gJmx0OyZhbXA7dmRkX2Nw
dV9iJmd0Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7Y3B1X2Ix
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoGNwdS1zdXBwbHkgPSAmbHQ7JmFtcDt2ZGRfY3B1X2ImZ3Q7
Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtlbW1jX3BoeSB7PGJy
Pg0KJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtnbWFjIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoGFz
c2lnbmVkLWNsb2NrcyA9ICZsdDsmYW1wO2NydSBTQ0xLX1JNSUlfU1JDJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSAmbHQ7JmFtcDtjbGtpbl9nbWFjJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoGNsb2NrX2luX291dCA9ICZxdW90O2lucHV0JnF1b3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgcGh5LXN1cHBseSA9ICZsdDsmYW1wO3ZjY19sYW4mZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgcGh5LW1vZGUgPSAmcXVvdDtyZ21paSZxdW90Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cmdtaWlfcGlucyZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqBzbnBzLHJlc2V0LWdwaW8gPSAmbHQ7JmFtcDtncGlvMyBSS19QQjcgR1BJT19BQ1RJVkVf
TE9XJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHNucHMscmVzZXQtYWN0aXZlLWxvdzs8YnI+DQom
Z3Q7ICvCoCDCoCDCoHNucHMscmVzZXQtZGVsYXlzLXVzID0gJmx0OzAgMTAwMDAgNTAwMDAmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgdHhfZGVsYXkgPSAmbHQ7MHgyOCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqByeF9kZWxheSA9ICZsdDsweDExJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHN0YXR1
cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
ICsmYW1wO2dwdSB7PGJyPg0KJmd0OyArwqAgwqAgwqBtYWxpLXN1cHBseSA9ICZsdDsmYW1wO3Zk
ZF9ncHUmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8
YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aGRtaSB7PGJyPg0KJmd0
OyArwqAgwqAgwqBkZGMtaTJjLWJ1cyA9ICZsdDsmYW1wO2kyYzMmZ3Q7Ozxicj4NCjxicj4NCmNh
biB0aGlzIGFsc28gdXNlIHRoZSBpbnRlcm5hbCBpMmMgaW5zaWRlIHRoZSBkdy1oZG1pPzxicj4N
Cjxicj4NCjxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQm
cXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtoZG1pX2NlYyZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZn
dDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtoZG1pX3NvdW5kIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2kyYzAgezxicj4NCiZndDsgK8KgIMKgIMKgY2xvY2stZnJl
cXVlbmN5ID0gJmx0OzQwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBpMmMtc2NsLXJpc2lu
Zy10aW1lLW5zID0gJmx0OzE2OCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBpMmMtc2NsLWZhbGxp
bmctdGltZS1ucyA9ICZsdDs0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqByazgwODogcG1pY0Ax
YiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cm9j
a2NoaXAscms4MDgmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAm
bHQ7MHgxYiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtcGFy
ZW50ID0gJmx0OyZhbXA7Z3BpbzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDsyMSBJUlFfVFlQRV9MRVZFTF9MT1cmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stb3V0cHV0LW5hbWVzID0gJnF1b3Q7eGluMzJrJnF1b3Q7
LCAmcXVvdDtyazgwOC1jbGtvdXQyJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwbWljX2ludF9sJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJvY2tjaGlwLHN5c3RlbS1wb3dlci1jb250cm9sbGVy
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgd2FrZXVwLXNvdXJjZTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHZjYzEtc3VwcGx5ID0gJmx0OyZhbXA7
dmNjNXYwX3N5cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2Y2MyLXN1cHBs
eSA9ICZsdDsmYW1wO3ZjYzV2MF9zeXMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgdmNjMy1zdXBwbHkgPSAmbHQ7JmFtcDt2Y2M1djBfc3lzJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoHZjYzQtc3VwcGx5ID0gJmx0OyZhbXA7dmNjNXYwX3N5cyZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2Y2M2LXN1cHBseSA9ICZsdDsmYW1wO3ZjYzV2
MF9zeXMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgdmNjNy1zdXBwbHkgPSAm
bHQ7JmFtcDt2Y2M1djBfc3lzJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHZj
Yzgtc3VwcGx5ID0gJmx0OyZhbXA7dmNjM3YzX3N5cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqB2Y2M5LXN1cHBseSA9ICZsdDsmYW1wO3ZjYzV2MF9zeXMmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgdmNjMTAtc3VwcGx5ID0gJmx0OyZhbXA7dmNjNXYwX3N5
cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2Y2MxMS1zdXBwbHkgPSAmbHQ7
JmFtcDt2Y2M1djBfc3lzJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHZjYzEy
LXN1cHBseSA9ICZsdDsmYW1wO3ZjYzN2M19zeXMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgdmRkaW8tc3VwcGx5ID0gJmx0OyZhbXA7dmNjXzF2OCZndDs7PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3JzIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZkZF9jZW50ZXI6IERDRENfUkVHMSB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1
bGF0b3ItbmFtZSA9ICZxdW90O3ZkZF9jZW50ZXImcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
dWxhdG9yLWJvb3Qtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDs3NTAwMDAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTM1MDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItcmFtcC1kZWxh
eSA9ICZsdDs2MDAxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1zdGF0ZS1tZW0gezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9y
LW9mZi1pbi1zdXNwZW5kOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB2ZGRfY3B1X2w6IERDRENfUkVHMiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3ZkZF9jcHVf
bCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYm9vdC1vbjs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4t
bWljcm92b2x0ID0gJmx0Ozc1MDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsx
MzUwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1yYW1wLWRlbGF5ID0gJmx0OzYwMDEmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLXN0
YXRlLW1lbSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itb2ZmLWluLXN1c3BlbmQ7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZjY19kZHI6IERDRENfUkVHMyB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1
bGF0b3ItbmFtZSA9ICZxdW90O3ZjY19kZHImcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxh
dG9yLWJvb3Qtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWd1bGF0b3Itc3RhdGUtbWVtIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1vbi1p
bi1zdXNwZW5kOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2
Y2NfMXY4OiBEQ0RDX1JFRzQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2Y2NfMXY4JnF1b3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
dWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1ib290LW9uOzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsxODAwMDAwJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZ3VsYXRvci1zdGF0ZS1tZW0gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWd1bGF0b3Itc3VzcGVuZC1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZjYzF2OF9kdnA6
IExET19SRUcxIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmNjMXY4X2R2cCZxdW90Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRv
ci1hbHdheXMtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWd1bGF0b3ItYm9vdC1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0
OzE4MDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1
bGF0b3Itc3RhdGUtbWVtIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1vZmYtaW4tc3VzcGVuZDs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmNjMXY4X2hkbWk6IExE
T19SRUcyIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmNjMXY4X2hkbWkmcXVvdDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3It
YWx3YXlzLW9uOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVndWxhdG9yLWJvb3Qtb247PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDsx
ODAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzE4MDAwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxh
dG9yLXN0YXRlLW1lbSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itb2ZmLWluLXN1c3BlbmQ7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZjY2FfMXY4OiBMRE9fUkVH
MyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3ZjY2FfMXY4JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1v
bjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZ3VsYXRvci1ib290LW9uOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsxODAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1zdGF0
ZS1tZW0gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1
bGF0b3Itc3VzcGVuZC1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZjY2lvX3NkOiBMRE9fUkVHNCB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0
b3ItbmFtZSA9ICZxdW90O3ZjY2lvX3NkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRv
ci1ib290LW9uOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0
b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDszMDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1zdGF0ZS1tZW0gezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itc3Vz
cGVuZC1taWNyb3ZvbHQgPSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZjY2EzdjBfY29kZWM6IExET19SRUc1IHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1u
YW1lID0gJnF1b3Q7dmNjYTN2MF9jb2RlYyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0
b3ItYm9vdC1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzMwMDAwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itc3RhdGUtbWVtIHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1vZmYtaW4tc3VzcGVuZDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmNjXzF2NTogTERPX1JFRzYgezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUg
PSAmcXVvdDt2Y2NfMXY1JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1ib290LW9u
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTUwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9ICZsdDsxNTAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1zdGF0ZS1tZW0gezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVndWxhdG9yLW9uLWluLXN1c3BlbmQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itc3VzcGVuZC1taWNy
b3ZvbHQgPSAmbHQ7MTUwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHZjYzB2OV9oZG1pOiBMRE9fUkVHNyB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90
O3ZjYzB2OV9oZG1pJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1ib290LW9uOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7OTAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1tYXgtbWljcm92
b2x0ID0gJmx0OzkwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itc3RhdGUtbWVtIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3Vs
YXRvci1vZmYtaW4tc3VzcGVuZDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdmNjXzN2MDogTERPX1JFRzggezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2Y2NfM3Yw
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1ib290LW9uOzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsz
MDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZ3VsYXRvci1zdGF0ZS1tZW0gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW9uLWlu
LXN1c3BlbmQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3Itc3VzcGVuZC1taWNyb3ZvbHQgPSAmbHQ7MzAw
MDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7ICs8YnI+DQo8YnI+DQp1bm5lZWRlZCBibGFuayBsaW5lPGJyPg0KPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQo8YnI+DQo8YnI+DQpIZWlrbzxicj4NCjxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48
L2Rpdj48L2Rpdj4NCg==
--000000000000e4bd29058f468409--
