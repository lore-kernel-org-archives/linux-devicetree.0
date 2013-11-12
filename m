From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx: typo in dts: "interupt" (four devices)
Date: Tue, 12 Nov 2013 09:11:29 +0000
Message-ID: <20131112091128.GA2976@e106331-lin.cambridge.arm.com>
References: <1384206727-11880-1-git-send-email-kilobyte@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384206727-11880-1-git-send-email-kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 09:52:07PM +0000, Adam Borowski wrote:
> These lines were inoperative for four years, which puts some doubt into
> their importance, and it's possible the fixed version will regress, but
> at the very least they should be removed instead.
> 
> Signed-off-by: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/xcalibur1501.dts | 4 ++--
>  arch/powerpc/boot/dts/xpedite5301.dts  | 4 ++--
>  arch/powerpc/boot/dts/xpedite5330.dts  | 4 ++--
>  arch/powerpc/boot/dts/xpedite5370.dts  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/xcalibur1501.dts b/arch/powerpc/boot/dts/xcalibur1501.dts
> index cc00f4d..f151426 100644
> --- a/arch/powerpc/boot/dts/xcalibur1501.dts
> +++ b/arch/powerpc/boot/dts/xcalibur1501.dts
> @@ -637,14 +637,14 @@
>  		tlu@2f000 {
>  			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
>  			reg = <0x2f000 0x1000>;
> -			interupts = <61 2 >;
> +			interrupts = <61 2 >;

While you're fixing the typo, could you get rid of the extraneous space
before the closing bracket? It seems to be duplicated across the other 3
dts fragments you fix up also.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
