From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: add gpio-ranges property to iMX GPIO
 controllers
Date: Fri, 9 Sep 2016 11:00:16 +0200
Message-ID: <20160909090016.pc4d5j7lvjvbofvf@pengutronix.de>
References: <1473386556-1934-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20160909072020.ieehalkgxxjfewhs@pengutronix.de>
 <729f2fd7-df40-c631-5365-892ee25854b3@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <729f2fd7-df40-c631-5365-892ee25854b3-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Deepak Das <deepak_das-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2016 at 11:44:10AM +0300, Vladimir Zapolskiy wrote:
> Hi Uwe,
> 
> On 09/09/2016 10:20 AM, Uwe Kleine-König wrote:
> > On Fri, Sep 09, 2016 at 05:02:36AM +0300, Vladimir Zapolskiy wrote:
> > > To establish a connection between GPIO controllers and pin multiplexor
> > > controller add gpio-ranges properties to all GPIO controllers found
> > > on iMX50, iMX6Q/D, iMX6DL/S, iMX6SL, iMX6SX, iMX6UL and iMX7D/S
> > > SoCs. The change was done after human parsing of output from
> > 
> > When looking at doing the same for i.MX35 there are a few pin pairs that
> > are driven by the same GPIO, e.g.:
> > 
> > 	$ grep GPIO3_9 imx35-pinfunc.h
> > 	#define MX35_PAD_CTS1__GPIO3_9					0x194 0x5d8 0x918 0x5 0x0
> > 	#define MX35_PAD_FEC_COL__GPIO3_9				0x2ec 0x750 0x918 0x5 0x1
> > 
> > With this it's not possible to correctly add a gpio-ranges, right?
> 
> this is an interesting exceptional case, I don't think that pinctrl
> and gpio subsystems are ready to handle it.
> 
> If both pads are muxed to the same GPIO, then I presume on output it
> behaves like a tee, but do you know what would be the input value,
> if one line is driven high and another one is low?

That depends on the setting of register
IOMUXC_GPIO3_IPP_IND_G_IN_9_SELECT_INPUT at offset 0x918 (third value in
the constants). If it's 0 (fifth value) the value at MX35_PAD_CTS1 is
read, if it's 1 MX35_PAD_FEC_COL is used.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
