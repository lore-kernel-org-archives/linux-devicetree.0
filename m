From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/8] gpio-mm-lantiq: Use of_propery_read_u16
Date: Mon, 19 Jan 2015 10:57:53 +0000
Message-ID: <20150119105753.GC21553@leverpostej>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
 <1421581173-28416-5-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421581173-28416-5-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 18, 2015 at 11:39:29AM +0000, Ricardo Ribalda Delgado wrote:
> Instead of parsing manually the shadow content, use the much simpler
> helper of_property_read_u16.
> 
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpio/gpio-mm-lantiq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
> index 7d55161..b511a6b 100644
> --- a/drivers/gpio/gpio-mm-lantiq.c
> +++ b/drivers/gpio/gpio-mm-lantiq.c
> @@ -105,7 +105,6 @@ static void ltq_mm_save_regs(struct of_mm_gpio_chip *mm_gc)
>  static int ltq_mm_probe(struct platform_device *pdev)
>  {
>  	struct ltq_mm *chip;
> -	const __be32 *shadow;
>  
>  	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
> @@ -117,9 +116,8 @@ static int ltq_mm_probe(struct platform_device *pdev)
>  	chip->mmchip.save_regs = ltq_mm_save_regs;
>  
>  	/* store the shadow value if one was passed by the devicetree */
> -	shadow = of_get_property(pdev->dev.of_node, "lantiq,shadow", NULL);
> -	if (shadow)
> -		chip->shadow = be32_to_cpu(*shadow);
> +	of_property_read_u16(pdev->dev.of_node, "lantiq,shadow",
> +			     &chip->shadow);

The old code and new code aren't equivalent:

The binding doesn't specify the use of /bits/ 16 <...>, nor does the
only in-tree dts use it:

arch/mips/boot/dts/easy50712.dts:               lantiq,shadow = <0xfff>;

So in the DTB, lantiq-shadow will be stored as a be32 value. The byte
stream will look like: [00 00 0f ff].

The existing code reads all 4 bytes, and converts them as required,
reading the expected value of 0xfff. If you use of_property_read_u16,
this will only take the first 2 bytes, and will incorrectly read 0.

You can instead use of_property_read_u32, which will function
equivalently to the existing code.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
