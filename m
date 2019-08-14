From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 07/22] arm64: dts: qcom: pm8150: Add pon and rtc nodes
Date: Wed, 14 Aug 2019 10:03:48 -0700
Message-ID: <20190814170349.7E4462173E@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-8-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-8-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:57)
> PM8150 PMIC contains pon and rtc devices so add nodes for these.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Squash this with the other patch?

> @@ -12,6 +13,25 @@
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> =20
> +               pon: pon@800 {
> +                       compatible =3D "qcom,pm8916-pon";
> +                       reg =3D <0x0800>;
> +                       pwrkey {
> +                               compatible =3D "qcom,pm8941-pwrkey";
> +                               interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_B=
OTH>;
> +                               debounce =3D <15625>;
> +                               bias-pull-up;
> +                               linux,code =3D <KEY_POWER>;

status =3D "disabled"?

> +                       };
> +               };
> +
> +               rtc@6000 {
> +                       compatible =3D "qcom,pm8941-rtc";
> +                       reg =3D <0x6000>;
> +                       reg-names =3D "rtc", "alarm";
> +                       interrupts =3D <0x0 0x61 0x1 IRQ_TYPE_NONE>;

status =3D "disabled"?

> +               };
> +
>                 pm8150_gpios: gpio@c000 {
>                         compatible =3D "qcom,pm8150-gpio";
>                         reg =3D <0xc000>;
> --=20
> 2.20.1
>=20
