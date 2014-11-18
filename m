From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/5] mfd: sec-core: Add support for S2MPS13 device
Date: Tue, 18 Nov 2014 08:22:07 +0000
Message-ID: <20141118082207.GU24004@x1>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416184980-532-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it, lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Nov 2014, Chanwoo Choi wrote:

> This patch adds the support for Samsung S2MPS13 PMIC device to the se=
c-core MFD
> driver. The S2MPS13 is very similar with existing S2MPS14 and include=
s PMIC/
> RTC/CLOCK devices.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/mfd/sec-core.c           | 18 ++++++++++++++++++
>  drivers/mfd/sec-irq.c            | 23 +++++++++++++++++------
>  include/linux/mfd/samsung/core.h |  1 +
>  3 files changed, 36 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 5993608..48c0d4a 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -73,6 +73,17 @@ static const struct mfd_cell s2mps11_devs[] =3D {
>  	}
>  };
> =20
> +static const struct mfd_cell s2mps13_devs[] =3D {
> +	{
> +		.name =3D "s2mps13-pmic",
> +	}, {
> +		.name =3D "s2mps13-rtc",
> +	}, {
> +		.name =3D "s2mps13-clk",
> +		.of_compatible =3D "samsung,s2mps13-clk",
> +	}
> +};

If you have to resubmit this for any reason, I'd like the one liners
on one single line (curly braces and all).

But for now, for my reference:

Acked-by: Lee Jones <lee.jones@linaro.org>

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
