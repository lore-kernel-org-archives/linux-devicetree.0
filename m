From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/5] pinctrl: st: add pinctrl support for the STiH407
 SoC
Date: Mon, 10 Mar 2014 14:44:29 +0000
Message-ID: <20140310144429.GA13661@lee--X1>
References: <1394203251-25361-1-git-send-email-maxime.coquelin@st.com>
 <1394203251-25361-4-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394203251-25361-4-git-send-email-maxime.coquelin@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> From: Giuseppe Cavallaro <peppe.cavallaro@st.com>
>=20
> This patch adds the initial support for pinctrl based on H407 SoC.
>=20
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>

SOBs should be in order of submission flow and author's should only be
kept if the patch is unchanged. If it's been adapted you will require
a re-review and they Acked-by or Reviewed-by tag.

> ---
>  drivers/pinctrl/pinctrl-st.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-s=
t.c
> index 1721611..d1886b4 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -390,6 +390,19 @@ static const struct st_pctl_data  stih416_data =3D=
 {
>  	.alt =3D 0, .oe =3D 40, .pu =3D 50, .od =3D 60, .rt =3D 100,
>  };
> =20
> +static const struct st_pctl_data  stih407_flashdata =3D {

Nit: Double space.

> +	.rt_style	=3D st_retime_style_none,
> +	.input_delays	=3D stih416_delays,
> +	.ninput_delays	=3D 14,

ARRAY_SIZE(stih416_delays)

> +	.output_delays	=3D stih416_delays,
> +	.noutput_delays =3D 14,

ARRAY_SIZE(stih416_delays)

> +	.alt =3D 0,
> +	.oe =3D -1, /* Not Available */
> +	.pu =3D -1, /* Not Available */
> +	.od =3D 60,
> +	.rt =3D 100,
> +};
> +
>  /* Low level functions.. */
>  static inline int st_gpio_bank(int gpio)
>  {
> @@ -1596,6 +1609,10 @@ static struct of_device_id st_pctl_of_match[] =
=3D {
>  	{ .compatible =3D "st,stih416-rear-pinctrl", .data =3D &stih416_dat=
a},
>  	{ .compatible =3D "st,stih416-fvdp-fe-pinctrl", .data =3D &stih416_=
data},
>  	{ .compatible =3D "st,stih416-fvdp-lite-pinctrl", .data =3D &stih41=
6_data},
> +	{ .compatible =3D "st,stih407-sbc-pinctrl", .data =3D &stih416_data=
},
> +	{ .compatible =3D "st,stih407-front-pinctrl", .data =3D &stih416_da=
ta},
> +	{ .compatible =3D "st,stih407-rear-pinctrl", .data =3D &stih416_dat=
a},
> +	{ .compatible =3D "st,stih407-flash-pinctrl", .data =3D &stih407_fl=
ashdata},
>  	{ /* sentinel */ }
>  };

After the small changes above, feel free to add my:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
