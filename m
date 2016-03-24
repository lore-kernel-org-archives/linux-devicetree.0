From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 3/5] ARM: at91: pm: configure PMC fast startup signals
Date: Thu, 24 Mar 2016 12:24:52 +0100
Message-ID: <20160324112452.GJ2570@piout.net>
References: <1458111489-23774-1-git-send-email-wenyou.yang@atmel.com>
 <1458111489-23774-4-git-send-email-wenyou.yang@atmel.com>
 <20160317171433.GD2831@piout.net>
 <B256D81BAE5131468A838E5D7A243641D643C03F@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D643C03F@penmbx01>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/03/2016 at 02:24:32 +0000, Yang, Wenyou wrote :
> Hi Alexandre,
>=20
> > -----Original Message-----
> > From: Alexandre Belloni [mailto:alexandre.belloni-wi1+55ScJUtKEb57/3fJTGGXanvQGlWp@public.gmane.org=
m]
> > Sent: 2016=E5=B9=B43=E6=9C=8818=E6=97=A5 1:15
> > To: Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > Cc: Ferre, Nicolas <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>; Jean-Christophe Plagn=
iol-
> > Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>; Russell King <linux-lFZ/pmaqli4g9kffE6ERjg@public.gmane.org=
uk>; linux-
> > kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rob Herring
> > <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>; Mark Brown
> > <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>;=
 Kumar
> > Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Subject: Re: [PATCH v5 3/5] ARM: at91: pm: configure PMC fast start=
up signals
> >=20
> > On 16/03/2016 at 14:58:07 +0800, Wenyou Yang wrote :
> > > The fast startup signal is used as wake up sources for ULP1 mode.
> > > As soon as a fast startup signal is asserted, the embedded 12 MHz=
 RC
> > > oscillator restarts automatically.
> > >
> > > This patch is to configure the fast startup signals, which signal=
 is
> > > enabled to trigger the PMC to wake up the system from ULP1 mode s=
hould
> > > be configured via the DT.
> > >
> > > Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >=20
> > I would actually avoid doing that from the PMC driver and do that c=
onfiguration
> > from the aic5 driver. It has all the information you need, it knows=
 what kind of level
> > or edge is needed to wake up and what are the wakeup interrupts to =
enable. This
> > will allow you to stop introducing a new binding. Also, this will a=
void discrepancies
> > between what is configured in the DT and what the user really wants=
 (for exemple
> > differences between the edge direction configured for the PIOBu in =
userspace
> > versus what is in the device tree or wakeonlan activation/deactivat=
ion).
>=20
> Thank you for your feedback.
>=20
> But some wake-ups such as WKUP pin, ACC_CE, RXLP_MCE, don't have the =
corresponding

The WKUP pin can be configured from the shdwc driver, ACC_CE from the
ACC driver, RXLP_MCE, from the RXLP driver because you will need
drivers for those at some point anyway.

> interrupt number. Moreover, I think, the ULP1 is very different form =
the ULP0, it is not woken
> up by the interrupt. It is fallen sleep and woken up by the some mech=
anism in the PMC.=20
>=20

Well, we don't really care about the mechanism. We only care about how
the user is able to configure the wakeup sources.

With your patch set, what happens when no ULP1 sources are defined but
there are ULP0 sources? What happens when there are both ULP1 and ULP0
sources?

What would be good is to use ULP1 when only ULP1 sources are set up and
ULP0 in the other cases. This will greatly help the user. Also, what I'=
m
suggesting actually allows to change the ULP1 sources at runtime from
devices that are actually used which is quite better than setting them
up statically from DT.


--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
