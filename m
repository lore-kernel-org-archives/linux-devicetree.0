From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2] pinctrl: msm: Add msm8960 definitions
Date: Wed, 25 Jun 2014 02:17:34 +0200
Message-ID: <53AA151E.9090701@suse.de>
References: <1403633766-25796-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1403633766-25796-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <agross@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 24.06.2014 20:16, schrieb Bjorn Andersson:
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pin=
ctrl.txt
> new file mode 100644
> index 0000000..6e79eea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.=
txt
[...]
> +Example:
> +
> +	msmgpio: pinctrl@800000 {
> +		compatible =3D "qcom,msm8960-pinctrl";
> +		reg =3D <0x800000 0x4000>;
> +
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +                interrupts =3D <0 32 0x4>;

This line seems space-indented while surrounding ones are tab-indented.

> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&debug_uart>;
> +
> +		debug_uart: debug_uart {

While at it, might debug-uart be a better node name? That seems the
predominant convention and distinguishes from the label.

Regards,
Andreas

> +			mux {
> +				pins =3D "gpio34", "gpio35";
> +				function =3D "gsbi8";
> +			};
> +
> +			tx {
> +				pins =3D "gpio34";
> +				drive-strength =3D <4>;
> +				bias-disable;
> +			};
> +
> +			rx {
> +				pins =3D "gpio35";
> +				drive-strength =3D <2>;
> +				bias-pull-up;
> +			};
> +		};
> +	};
[snip]

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
