From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 10/12] mtd: nand: davinci: don't set timings if AEMIF
 is used
Date: Tue, 12 Nov 2013 11:13:43 -0500
Message-ID: <528253B7.2060408@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,<1384187188-5776-11-git-send-email-ivan.khoronzhuk@ti.com> <4F5844B3A985794BA902E12C070812375F8D53@DNCE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8D53-bXo5r3zvlxeIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 11 November 2013 12:10 PM, Khoronzhuk, Ivan wrote:
> If Davinci AEMIF is used we don't need to set timings and bus width.
> It is done by AEMIF driver (drivers/memory/davinci-aemfi.c).
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/mtd/nand/davinci_nand.c |   22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 4705214..879e915 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -742,27 +742,35 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>                 goto err_clk_enable;
>         }
> 
> +#if !IS_ENABLED(CONFIG_TI_DAVINCI_AEMIF)
>
Instead above #if, just use a variable.
	bool aemif = IS_ENABLED(CONFIG_TI_DAVINCI_AEMIF) and then skip
the below code. #if block in the middle of the code looks ugly.

Other than that patch looks fine to me.

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
