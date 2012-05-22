From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 10/12] ARM: dts: imx6q-sabrelite: add usb devices
Date: Tue, 22 May 2012 14:19:49 +0800
Message-ID: <20120522061947.GU6206@b20223-02.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-11-git-send-email-richard.zhao@freescale.com>
 <20120522051005.GN8140@S2101-09.ap.freescale.net>
 <20120522055901.GR6206@b20223-02.ap.freescale.net>
 <20120522060828.GP8140@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522060828.GP8140-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 02:08:31PM +0800, Shawn Guo wrote:
> On Tue, May 22, 2012 at 01:59:02PM +0800, Richard Zhao wrote:
> > Yes, but we don't have now. If I add dependency which don't even hit
> > next tree, I experienced people refuse pick my patch.
> > Of course, If you're ok to pick other patches, I can leave the code
> > locally for test.
> 
> I'm fine for now.
> 
> > > > +				gpios {
> > > > +					pinctrl_gpio_hog: gpiohog {
> > > > +					};
> > > > +				};
> > > > +
> > > Why the empty nodes?
> > It's place holder that let use know to add gpio hog-on-boot in board dts.
> > 
> It's meaningless.  Please remove it.
Ok.

Thanks
Richard
> 
> -- 
> Regards,
> Shawn
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
