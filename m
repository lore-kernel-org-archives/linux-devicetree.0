From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 08/22] arm64: dts: qcom: pm8150: Add vadc node
Date: Wed, 14 Aug 2019 10:05:17 -0700
Message-ID: <20190814170518.9D0EB2084D@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-9-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-9-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:58)
> @@ -25,6 +26,33 @@
>                         };
>                 };
> =20
> +               pm8150_adc: adc@3100 {
> +                       compatible =3D "qcom,spmi-adc5";
> +                       reg =3D <0x3100>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       #io-channel-cells =3D <1>;
> +                       interrupts =3D <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING=
>;

status =3D "disabled"? I imagine there are cases where some board doesn't
want to use the ADC for anything.

> +
> +                       ref-gnd@0 {
> +                               reg =3D <ADC5_REF_GND>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "ref_gnd";
> +                       };
> +
> +                       vref-1p25@1 {
> +                               reg =3D <ADC5_1P25VREF>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "vref_1p25";
> +                       };
> +
> +                       die-temp@6 {
> +                               reg =3D <ADC5_DIE_TEMP>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "die_temp";
> +                       };

Are these board level details?

> +               };
> +
>                 rtc@6000 {
>                         compatible =3D "qcom,pm8941-rtc";
>                         reg =3D <0x6000>;
> --=20
> 2.20.1
>=20
