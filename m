From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/dts: fix lbc lack of error interrupt
Date: Tue, 7 Jan 2014 10:34:47 +0000
Message-ID: <20140107103447.GC2930@e106331-lin.cambridge.arm.com>
References: <1389076002-18674-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389076002-18674-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 07, 2014 at 06:26:42AM +0000, Dongsheng Wang wrote:
> From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> P1020, P1021, P1022, P1023 when the lbc get error, the error
> interrupt will be triggered. The corresponding interrupt is
> internal IRQ0. So system have to process the lbc IRQ0 interrupt.
> 
> The corresponding lbc general interrupt is internal IRQ3.
> 
> Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> diff --git a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
> index 68cc5e7..13f209f 100644
> --- a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
> @@ -36,7 +36,8 @@
>  	#address-cells = <2>;
>  	#size-cells = <1>;
>  	compatible = "fsl,p1020-elbc", "fsl,elbc", "simple-bus";
> -	interrupts = <19 2 0 0>;
> +	interrupts = <19 2 0 0
> +		      16 2 0 0>;


Minor nit: please bracket individual list elements like so:

interrupts = <19 2 0 0>,
             <16 2 0 0>;

Otherwise this looks fine to me.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
