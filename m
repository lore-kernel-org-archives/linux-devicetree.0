From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 12/12] ARM: dts: imx28-evk: add usb devices
Date: Tue, 22 May 2012 07:24:09 +0200
Message-ID: <201205220724.09841.marex@denx.de>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com> <20120522045240.GM8140@S2101-09.ap.freescale.net> <20120522050345.GP6206@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120522050345.GP6206-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Richard Zhao,

> On Tue, May 22, 2012 at 12:52:43PM +0800, Shawn Guo wrote:
> > On Mon, May 21, 2012 at 05:23:57PM +0800, Richard Zhao wrote:
> > >  	ahb@80080000 {
> > > 
> > > +		usb0: usb@80080000 {
> > > +			fsl,vbus-power = <&gpio3 9 0>;
> > 
> > fsl,vbus-power-gpios
> 
> Yes.
> 
> > > +			status = "okay";
> > > +		};
> > > +
> > > +		usb1: usb@80090000 {
> > > +			fsl,vbus-power = <&gpio3 8 0>;
> > 
> > Ditto
> 
> Yes.
> 
> I'll test mx28 too next time before send out patch.
> Maybe need your help :)

I'm still stuck a bit with the DT conversion :-( I'll start testing ASAP.

> Thanks
> Richard
> 
> > > +			status = "okay";
> > > +		};
> > > +

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
