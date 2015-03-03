From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 3/6] regulator: arizona-micsupp: Add support for
 WM8280/WM8281
Date: Tue, 3 Mar 2015 16:46:53 +0000
Message-ID: <20150303164653.GF32624@x1>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1425399576-26428-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425399576-26428-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/regulator/arizona-micsupp.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Will send out pull-request once this has had time to soak in -next.=20

> diff --git a/drivers/regulator/arizona-micsupp.c b/drivers/regulator/=
arizona-micsupp.c
> index 2007900..bfe5dac 100644
> --- a/drivers/regulator/arizona-micsupp.c
> +++ b/drivers/regulator/arizona-micsupp.c
> @@ -246,6 +246,7 @@ static int arizona_micsupp_probe(struct platform_=
device *pdev)
>  	 */
>  	switch (arizona->type) {
>  	case WM5110:
> +	case WM8280:
>  		desc =3D &arizona_micsupp_ext;
>  		micsupp->init_data =3D arizona_micsupp_ext_default;
>  		break;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
