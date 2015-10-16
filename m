From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [2/3] powerpc: dts: p1022si: Add fsl,wake-on-filer for eTSEC
Date: Fri, 16 Oct 2015 18:33:34 -0500
Message-ID: <20151016233334.GA13511@home.buserror.net>
References: <1443694222-29519-1-git-send-email-claudiu.manoil@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443694222-29519-1-git-send-email-claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Claudiu Manoil <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhao Chenhui <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 01, 2015 at 01:10:22PM +0300, Claudiu Manoil wrote:
> Enable the "wake-on-filer" (aka. wake on user defined packet)
> wake on lan capability for the eTSEC ethernet nodes.
> 
> Cc: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Zhao Chenhui <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/fsl/p1022si-post.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
