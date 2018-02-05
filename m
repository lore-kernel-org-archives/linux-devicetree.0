From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 3/4] arm64: add support for i.MX8M EVK board
Date: Mon, 05 Feb 2018 12:10:46 +0100
Message-ID: <1517829046.3175.9.camel@pengutronix.de>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
         <20180201183126.32384-3-l.stach@pengutronix.de>
         <20180205072438.nxvhlqk54d7firbz@sapphire.tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205072438.nxvhlqk54d7firbz-MwjkAAnuF3khR1HGirfZ1z4kX+cae0hd@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

Am Montag, den 05.02.2018, 09:24 +0200 schrieb Baruch Siach:
> Hi Lucas,
> 
> On Thu, Feb 01, 2018 at 07:31:25PM +0100, Lucas Stach wrote:
> > This is the evaluation kit board for the i.MX8M. The current level
> > of
> > support yields a working console and is able to boot userspace from
> > SD card or Network.
> > 
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org> (v1)
> > Tested-by: Tested-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> (v1)
> 
> I only tested once.

Hehe, seems I was a little tired after reworking all those patches. ;)

> 
> Tested v2 as well, on top of clk v2 and the pinctrl v2 patches.
> 
> Tested-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

Thanks.

> Would have been nice to have all these series in a single branch
> somewhere.

I've pushed a branch with all the MX8M work to:
https://git.pengutronix.de/git/lst/linux mx8-work

I'll update this branch if I need to do another revision of this
patchset.

Regards,
Lucas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
