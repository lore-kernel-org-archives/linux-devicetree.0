From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation: dts: tcs6507: Fix wrong statement about #gpio-cells
Date: Tue, 22 Jul 2014 16:41:49 -0700
Message-ID: <CAK5ve-+7K0maC9J2zfOW1U8=UGwbNPTKUBaQe6GgXyvY6VJhrA@mail.gmail.com>
References: <1405977438-15517-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405977438-15517-1-git-send-email-marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 21, 2014 at 2:17 PM, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org> wrote:
> Update comment about gpio-cells which says not correctly to be set to 0.
> When we want to reference tca6507 gpio #gpio-cells must be set to 2 (it is
> already correct in example).
>

Good fix. I applied it
Thanks,
-Bryan

> Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/leds/tca6507.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt
> index d7221b8..bad9102 100644
> --- a/Documentation/devicetree/bindings/leds/tca6507.txt
> +++ b/Documentation/devicetree/bindings/leds/tca6507.txt
> @@ -8,7 +8,7 @@ Required properties:
>
>  Optional properties:
>  - gpio-controller: allows lines to be used as output-only GPIOs.
> -- #gpio-cells: if present, must be 0.
> +- #gpio-cells: if present, must not be 0.
>
>  Each led is represented as a sub-node of the ti,tca6507 device.
>
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
