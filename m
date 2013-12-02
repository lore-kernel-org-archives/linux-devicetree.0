From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dts: bindings: trivial clock bindings doc fixes
Date: Mon, 2 Dec 2013 16:18:43 +0000
Message-ID: <20131202161843.GM12952@e106331-lin.cambridge.arm.com>
References: <1385999579-3184-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385999579-3184-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 02, 2013 at 03:52:59PM +0000, Gerhard Sittig wrote:
> fix a typo in the "clock specifiers" discussion,
> clarify that clock specifiers (the integer cells
> part that goes with the phandle) may be empty
> 
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> ---
> 
> this may sound like nit picking, but from an earlier explanation by Mark
> Rutland I learned that a reference always consists of a phandle and a
> specifier, that the specifier is the sequence of integer cells that
> accompany the phandle, and that the phandle "by intuition might be
> expected to" be part of the specifier but specificly is not (and shall
> not, to keep the existing documentation consistent)
> 
> since I was fixing the typo, and had the above information, I could not
> resist but had to add the "may be zero cells" detail in bypassing

It would be nice to move a bit of this into the patch title and
description that'll survive as the commit (the title's a bit vague).

> 
> found no other issue in this file -- don't worry, won't emit an endless
> stream of tiny trivial changes, this one is all there is :)
> 
>  Documentation/devicetree/bindings/clock/clock-bindings.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index eb65d417f8c4..7c52c29d99fa 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -5,7 +5,7 @@ Sources of clock signal can be represented by any node in the device
>  tree.  Those nodes are designated as clock providers.  Clock consumer
>  nodes use a phandle and clock specifier pair to connect clock provider
>  outputs to clock inputs.  Similar to the gpio specifiers, a clock
> -specifier is an array of one more more cells identifying the clock
> +specifier is an array of zero, one or more cells identifying the clock

To nit pick slightly further, how about just "zero or more"?

Otherwise, this looks good to me!

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

>  output on a device.  The length of a clock specifier is defined by the
>  value of a #clock-cells property in the clock provider node.
>  
> -- 
> 1.7.10.4
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
