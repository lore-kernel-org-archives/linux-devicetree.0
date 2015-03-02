From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/5] mfd: arizona: Add DT binding for the DMIC references
Date: Mon, 2 Mar 2015 07:53:41 +0000
Message-ID: <20150302075341.GA31325@x1>
References: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1425135268-32340-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425135268-32340-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee@kernel.org, sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Sat, 28 Feb 2015, Charles Keepax wrote:

> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/arizona-core.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

Same here.  Requires DT/Clk Ack.

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index dddaaef..6002ce9 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -564,6 +564,16 @@ static int arizona_of_get_core_pdata(struct ariz=
ona *arizona)
>  		count++;
>  	}
> =20
> +	count =3D 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,dmic-ref", pro=
p,
> +				 cur, val) {
> +		if (count =3D=3D ARRAY_SIZE(arizona->pdata.dmic_ref))
> +			break;
> +
> +		arizona->pdata.dmic_ref[count] =3D val;
> +		count++;
> +	}
> +
>  	return 0;
>  }
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
