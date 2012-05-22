From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 08/12] ARM: imx6q: add usbphy clocks
Date: Tue, 22 May 2012 14:08:31 +0800
Message-ID: <20120522060830.GT6206@b20223-02.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-9-git-send-email-richard.zhao@freescale.com>
 <20120522053706.GO8140@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522053706.GO8140-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 01:37:08PM +0800, Shawn Guo wrote:
> On Mon, May 21, 2012 at 05:23:53PM +0800, Richard Zhao wrote:
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm/mach-imx/clk-imx6q.c |    7 ++++++-
> >  1 files changed, 6 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
> > index f99509a..0d003aa 100644
> > --- a/arch/arm/mach-imx/clk-imx6q.c
> > +++ b/arch/arm/mach-imx/clk-imx6q.c
> > @@ -152,7 +152,7 @@ enum mx6q_clks {
> >  	ssi2, ssi3, uart_ipg, uart_serial, usboh3, usdhc1, usdhc2, usdhc3,
> >  	usdhc4, vdo_axi, vpu_axi, cko1, pll1_sys, pll2_bus, pll3_usb_otg,
> >  	pll4_audio, pll5_video, pll6_mlb, pll7_usb_host, pll8_enet, ssi1_ipg,
> > -	ssi2_ipg, ssi3_ipg, clk_max
> > +	ssi2_ipg, ssi3_ipg, usbphy1_gate, usbphy2_gate, clk_max
> 
> Can you drop the "_gate" suffix?  We do not have such suffix for leaf
> clock in imx6q clock file.
ok

Thanks
Richard
 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
