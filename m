From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: explicitly mark skeleton.dtsi as deprecated
Date: Thu, 1 Sep 2016 13:46:11 +0100
Message-ID: <20160901124611.GA5049@leverpostej>
References: <1472730037-4972-1-git-send-email-mark.rutland@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472730037-4972-1-git-send-email-mark.rutland-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 12:40:37PM +0100, Mark Rutland wrote:
> As noted in commit 3ebee5a2e141496b ("arm64: dts: kill skeleton.dtsi"),
> there are a number of problems with skeleton.dtsi, and it would be
> prefereable to remove it entirely. As there are a large number of
> existing users, fixing these up will take a while.
> 
> This patch adds a note to arm's skeleton.dtsi noting that this is the
> case, to make this more obvious and hopefully minimize new uptake of
> skeleton.dtsi in the mean time.
> 
> Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <rob.herring-5wv7dgnIgG8@public.gmane.org>

This should have been linaro.org. not sure how I managed that.

Mark.

> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>  arch/arm/boot/dts/skeleton.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/skeleton.dtsi b/arch/arm/boot/dts/skeleton.dtsi
> index b41d241..28b81d6 100644
> --- a/arch/arm/boot/dts/skeleton.dtsi
> +++ b/arch/arm/boot/dts/skeleton.dtsi
> @@ -1,4 +1,8 @@
>  /*
> + * This file is deprecated, and will be removed once existing users have been
> + * updated. New dts{,i} files should *not* include skeleton.dtsi, and should
> + * instead explicitly provide the below nodes only as required.
> + *
>   * Skeleton device tree; the bare minimum needed to boot; just include and
>   * add a compatible value.  The bootloader will typically populate the memory
>   * node.
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
