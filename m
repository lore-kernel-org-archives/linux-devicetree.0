From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/5] mfd: arizona: Add DT binding for setting 32kHz clock
 source
Date: Mon, 2 Mar 2015 08:00:43 +0000
Message-ID: <20150302080043.GB31325@x1>
References: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee@kernel.org, sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Charles,

Why have you started using my kernel.org email address?

Where did you even get it from?

Please use my linaro.org one for MFD.

Kind regards,
Lee

On Sat, 28 Feb 2015, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/arizona-core.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 09ba8f1..dddaaef 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -552,6 +552,9 @@ static int arizona_of_get_core_pdata(struct arizo=
na *arizona)
>  			ret);
>  	}
> =20
> +	of_property_read_u32(arizona->dev->of_node, "wlf,clk32k-src",
> +			     &pdata->clk32k_src);
> +
>  	of_property_for_each_u32(arizona->dev->of_node, "wlf,inmode", prop,
>  				 cur, val) {
>  		if (count =3D=3D ARRAY_SIZE(arizona->pdata.inmode))

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
