From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: remove swarren from DT bindings
Date: Wed, 9 Oct 2013 11:50:08 +0100
Message-ID: <20131009105008.GG4981@e106331-lin.cambridge.arm.com>
References: <1381263943-13878-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381263943-13878-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 09:25:43PM +0100, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Stephen,

> 
> I'm afraid I'm rather burned out w.r.t. DT bindings. As has probably
> been evident, I don't have and haven't made the time to review many
> recently. As such, remove myself from that MAINTAINERS entry.

I'm sorry to see that it's come to this. With the rate bindings and dts
are being added and modified, we need more maintainers, not fewer.

I think we need to put out a call for maintainers or the situation's
only gonig to get worse.

Whatever happened to Kumar's addition to MAINTAINERS [1]? I don't see it
in mainline.

Thanks,
Mark.

[1] https://lkml.org/lkml/2013/8/8/357

> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a0cbf3..120c335 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6155,7 +6155,6 @@ OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
>  M:	Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>  M:	Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>  M:	Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> -M:	Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>  M:	Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>  L:	devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
> -- 
> 1.8.1.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
