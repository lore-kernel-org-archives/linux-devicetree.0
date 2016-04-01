From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: add resets support to dw_mmc
Date: Fri, 01 Apr 2016 20:42:40 +0200
Message-ID: <5552254.5pm4SI4ary@phil>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org> <1459322696-29919-3-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459322696-29919-3-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: shawn.lin@rock-chips.com, jh80.chung@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 30. M=E4rz 2016, 15:24:56 schrieb Guodong Xu:

[...]

> @@ -2949,7 +2956,9 @@ int dw_mci_probe(struct dw_mci *host)
>=20
>  	if (!host->pdata) {
>  		host->pdata =3D dw_mci_parse_dt(host);
> -		if (IS_ERR(host->pdata)) {
> +		if (PTR_ERR(host->pdata) =3D=3D -EPROBE_DEFER) {
> +			return -EPROBE_DEFER;
> +		} else if (IS_ERR(host->pdata)) {

how is this related to adding the reset handling?

Making the driver handle probe deferral better should be a separate pat=
ch.

>  			dev_err(host->dev, "platform data not available\n");
>  			return -EINVAL;
>  		}
> @@ -3012,6 +3021,9 @@ int dw_mci_probe(struct dw_mci *host)
>  		}
>  	}
>=20
> +	if (!IS_ERR(host->pdata->rstc))
> +		reset_control_deassert(host->pdata->rstc);
> +

Wouldn't reset_control_reset be better? The way it is now it would expe=
ct=20
the reset to be asserted somewhere else before dw_mmc probes?


>  	setup_timer(&host->cmd11_timer,
>  		    dw_mci_cmd11_timer, (unsigned long)host);
>=20

[...]

> diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h
> index 7b41c6d..b95cd84 100644
> --- a/include/linux/mmc/dw_mmc.h
> +++ b/include/linux/mmc/dw_mmc.h
> @@ -14,9 +14,10 @@
>  #ifndef LINUX_MMC_DW_MMC_H
>  #define LINUX_MMC_DW_MMC_H
>=20
> -#include <linux/scatterlist.h>
> -#include <linux/mmc/core.h>
>  #include <linux/dmaengine.h>
> +#include <linux/mmc/core.h>
> +#include <linux/reset.h>
> +#include <linux/scatterlist.h>

unrelated changed regarding the reordering of includes.


Heiko
