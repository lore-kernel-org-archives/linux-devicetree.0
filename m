From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: enable USB2.0
 Host (EHCI/OHCI)
Date: Thu, 21 Sep 2017 10:58:03 +0200
Message-ID: <20170921085803.GQ15749@verge.net.au>
References: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505385043-1554-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505385043-1554-5-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[CC Geert]

On Thu, Sep 14, 2017 at 07:30:43PM +0900, Yoshihiro Shimoda wrote:
> This patch enables USB2.0 Host (EHCI/OHCI) for r8a77995.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Hi Geert,

thanks for reviewing patches 1-3 of this series.
I think you missed this one.

> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 1c55d8a..7771af8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -73,6 +73,14 @@
>  	};
>  };
>  
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
>  &scif2 {
>  	pinctrl-0 = <&scif2_pins>;
>  	pinctrl-names = "default";
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
