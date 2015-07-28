From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v1 7/7] ARM: dts: ifc6410: add inforce LVDS panel support
Date: Tue, 28 Jul 2015 19:50:20 +0200
Message-ID: <55B7C0DC.2010501@suse.de>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: agross@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 28.07.2015 um 14:54 schrieb Srinivas Kandagatla:
> This patch adds LVDS panel for IFC6410.
>=20
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> [Rob Clark: WIP patch]
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 66 ++++++++++++++++++++=
++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/bo=
ot/dts/qcom-apq8064-ifc6410.dts
> index 1ab71f1..3bdac02 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -63,6 +63,12 @@
>  					qcom,switch-mode-frequency =3D <3200000>;
>  				};
> =20
> +				pm8921_l2: l2 {
> +					regulator-min-microvolt =3D <1200000>;
> +					regulator-max-microvolt =3D <1200000>;
> +					bias-pull-down;
> +				};
> +
>  				pm8921_l3: l3 {
>  					regulator-min-microvolt =3D <3050000>;
>  					regulator-max-microvolt =3D <3300000>;
> @@ -96,6 +102,10 @@
>  				pm8921_lvs1: lvs1 {
>  					bias-pull-down;
>  				};
> +
> +				pm8921_lvs7: lvs7 {
> +					bias-pull-down;
> +				};
>  			};
>  		};
> =20
> @@ -119,6 +129,41 @@
> =20
>  		mdp: qcom,mdp@5100000 {
>  			status =3D "okay";
> +			qcom,lvds-panel =3D <&panel>;

In my testing this broke/uglified HDMI output. Since not everyone has
that LVDS panel attached, or might have a different panel type, I don't
think the panel node belongs in the generic -ifc6410.dts file.
I suggest you add an -ifc6410+inforce-lvds.dts or so for that.

> +			lvds-vccs-3p3v-supply =3D <&ext_3p3v>;
> +			lvds-pll-vdda-supply =3D <&pm8921_l2>;
> +			lvds-vdda-supply =3D <&pm8921_lvs7>;
> +		};
> +
> +		panel_3p3v: panel_3p3v {

s/_/-/ ?

> +			compatible =3D "regulator-fixed";
> +			pinctrl-0 =3D <&disp_en_gpios>;
> +			pinctrl-names =3D "default";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-name =3D "panel_en_3p3v";
> +			regulator-type =3D "voltage";
> +			startup-delay-us =3D <0>;
> +			gpio =3D <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};
> +
> +		backlight: backlight{
> +			pinctrl-0 =3D <&pwm_bl_gpios>;
> +			pinctrl-names =3D "default";
> +			compatible =3D "gpio-backlight";
> +			gpios =3D <&pm8921_gpio 26 GPIO_ACTIVE_HIGH>;
> +			default-on;
> +		};
> +
> +		panel: auo,b101xtn01 {

panel: panel { ?

Regards,
Andreas

> +			status =3D "okay";
> +			compatible =3D "auo,b101xtn01";
> +
> +			ddc-i2c-bus =3D <&i2c3>;
> +			backlight =3D <&backlight>;
> +			power-supply =3D <&panel_3p3v>;
>  		};
> =20
>  		gsbi3: gsbi@16200000 {
> @@ -235,6 +280,27 @@
>  				pm8921_gpio: gpio@150 {
>  					pinctrl-names =3D "default";
>  					pinctrl-0 =3D <&wlan_default_gpios>;
> +
> +					pwm_bl_gpios: pwm-bl-gpios {
> +						pios {
> +							pins =3D "gpio26";
> +							bias-disable;
> +							function =3D "normal";
> +							qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_HIGH>;
> +							power-source =3D <PM8921_GPIO_S4>;
> +						};
> +					};
> +
> +					disp_en_gpios: disp-en-gpios {
> +						pios {
> +							pins =3D "gpio36";
> +							bias-disable;
> +							function =3D "normal";
> +							qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_HIGH>;
> +							power-source =3D <PM8921_GPIO_S4>;
> +						};
> +					};
> +
>  					wlan_default_gpios: wlan-gpios {
>  						pios {
>  							pins =3D "gpio43";
>=20


--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
