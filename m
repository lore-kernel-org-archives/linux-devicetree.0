From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v1 3/7] ARM: dts: apq8064-ifc6410: add heart-beat led
 support.
Date: Tue, 28 Jul 2015 19:36:56 +0200
Message-ID: <55B7BDB8.7090103@suse.de>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1438088040-17437-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438088040-17437-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: agross@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 28.07.2015 um 14:54 schrieb Srinivas Kandagatla:
> This patch adds heart-beat led support on IFC6410.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 22 ++++++++++++++++++++=
++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/bo=
ot/dts/qcom-apq8064-ifc6410.dts
> index df560cf..1fc2ea5 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -207,6 +207,19 @@
>  			status =3D "okay";
>  		};
> =20
> +		leds {
> +			compatible =3D "gpio-leds";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&notify_led>;
> +
> +			led@1 {
> +				label =3D "apq8064:green:user1";
> +				gpios =3D <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
> +				linux,default-trigger =3D "heartbeat";

Can we please drop the heartbeat default? While that's nice as proof of
concept, it's annoying to deliver it that way in Linux distros. Users
can enable that trigger with a simple boot script writing to /sys.

Thanks,
Andreas

> +				default-state =3D "on";
> +			};
> +		};
> +
>  		qcom,ssbi@500000 {
>  			pmicintc: pmic@0 {
>  				pm8921_gpio: gpio@150 {
[snip]

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
