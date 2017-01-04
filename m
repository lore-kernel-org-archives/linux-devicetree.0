From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] nvmem: imx-ocotp: Add support for i.MX6UL
Date: Wed, 4 Jan 2017 14:14:19 +0000
Message-ID: <83b9bad4-550d-c685-8202-7a317e2d4499@linaro.org>
References: <1480689949-17957-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480689949-17957-1-git-send-email-d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/12/16 14:45, Daniel Schultz wrote:
> This patch adds OCOTP support for the i.MX6UL SoC.
>
> Signed-off-by: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>

As Shawn said, there is already a similar patch in the mailing list
http://www.spinics.net/lists/arm-kernel/msg543203.html
http://www.spinics.net/lists/arm-kernel/msg543204.html

I will pick that patch +  I will queue up fix from you "[PATCH 3/3] 
nvmem: imx-ocotp: Fix wrong register size"

thanks,
srini
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 5 +++--
>  drivers/nvmem/imx-ocotp.c                             | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 383d588..fcb1a48 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -1,13 +1,14 @@
>  Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
>
>  This binding represents the on-chip eFuse OTP controller found on
> -i.MX6Q/D, i.MX6DL/S, i.MX6SL, and i.MX6SX SoCs.
> +i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX and i.MX6UL SoCs.
>
>  Required properties:
>  - compatible: should be one of
>  	"fsl,imx6q-ocotp" (i.MX6Q/D/DL/S),
>  	"fsl,imx6sl-ocotp" (i.MX6SL), or
> -	"fsl,imx6sx-ocotp" (i.MX6SX), followed by "syscon".
> +	"fsl,imx6sx-ocotp" (i.MX6SX), or
> +	"fsl,imx6ul-ocotp" (i.MX6UL), followed by "syscon".
>  - reg: Should contain the register base and length.
>  - clocks: Should contain a phandle pointing to the gated peripheral clock.
>
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index ac27b9b..d2f78d3 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -71,6 +71,7 @@ static int imx_ocotp_read(void *context, unsigned int offset,
>
>  static const struct of_device_id imx_ocotp_dt_ids[] = {
>  	{ .compatible = "fsl,imx6q-ocotp",  (void *)128 },
> +	{ .compatible = "fsl,imx6ul-ocotp", (void *)128 },
>  	{ .compatible = "fsl,imx6sl-ocotp", (void *)32 },
>  	{ .compatible = "fsl,imx6sx-ocotp", (void *)128 },
>  	{ },
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
