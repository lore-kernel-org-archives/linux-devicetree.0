From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610: use reset values for L2 cache latencies
Date: Fri, 11 Dec 2015 22:00:29 +0800
Message-ID: <20151211140029.GI11252@tiger>
References: <1448935166-2697-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448935166-2697-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 05:59:26PM -0800, Stefan Agner wrote:
> Linux on Vybrid used several different L2 latencies so far, none
> of them seem to be the right ones. According to the application note
> AN4947 ("Understanding Vybrid Architecture"), the tag portion runs
> on CPU clock and is inside the L2 cache controller, whereas the data
> portion is stored in the external SRAM running on platform clock.
> Hence it is likely that the correct value requires a higher data
> latency then tag latency.
> 
> These are the values which have been used so far:
> - The mainline values:
>   arm,data-latency = <1 1 1>;
>   arm,tag-latency = <2 2 2>;
>   Those values have lead to problems on higher clocks. They look
>   like a poor translation from the reset values (missing +1 offset
>   and a mix up between tag/latency values).
> - The Linux 3.0 (SoC vendor BSP) values (converted to DT notation):
>   arm,data-latency = <4 2 3>
>   arm,tag-latency = <4 2 3>
>   The cache initialization function along with the value matches the
>   i.MX6 code from the same kernel, so it seems that those values have
>   just been copied.
> - The Colibri values:
>   arm,data-latency = <2 1 2>;
>   arm,tag-latency = <3 2 3>;
>   Those were a mix between the values of the Linux 3.0 based BSP and
>   the mainline values above.
> - The SoC Reset values (converted to DT notation):
>   arm,data-latency = <3 3 3>;
>   arm,tag-latency = <2 2 2>;
> 
> So far there is no official statement on what the correct values are.
> See also the related Freescale community thread:
> https://community.freescale.com/message/579785#579785
> 
> For now, the reset values seem to be the best bet. Remove all other
> "bogus" values and use the reset value on vf610.dtsi level.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
