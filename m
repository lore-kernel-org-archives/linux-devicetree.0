From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/4] powerpc/mpc85xx: Create dts components for the
 FSL QorIQ DPAA BMan
Date: Tue, 2 Dec 2014 18:28:47 -0600
Message-ID: <1417566527.15957.225.camel@freescale.com>
References: <1417428135-12895-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1417428135-12895-2-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417428135-12895-2-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Hai-Ying Wang <Haiying.Wang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-12-01 at 04:02 -0600, Emil Medve wrote:
> +bman: bman@31a000 {
> +	compatible = "fsl,bman";
> +	reg = <0x31a000 0x1000>;
> +	interrupts = <16 2 1 2>;
> +	fsl,bman-portals = &bportals;
> +	memory-region = <&bman_fbpr>;

Shouldn't it be <&bportals>?

And I don't see fsl,bman-portals in the binding...

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
