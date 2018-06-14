From: "Reizer, Eyal" <eyalr-l0cyMroinI0@public.gmane.org>
Subject: RE: [EXTERNAL] Re: [PATCH] arm64: dts: hikey: Define wl1835 power
   capabilities
Date: Thu, 14 Jun 2018 06:40:05 +0000
Message-ID: <ae036763950c4c9e80ceccc8c61e78dd@ti.com>
References: <20180613151305.17240-1-ryan@edited.us>
        <CANcMJZASEDRxaXwdG96nNeEDPrDm_ap5MjhXonEcg=yHZ8F=qg@mail.gmail.com>
 <87tvq6a577.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87tvq6a577.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Valentin Schneider <Valentin.Schneider-5wv7dgnIgG8@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> These properties are required for compatibility with runtime PM.
> >> Without these properties, MMC host controller will not be aware
> >> of power capabilities. When the wlcore driver attempts to power
> >> on the device, it will erroneously fail with -EACCES.
> >>
> >> Signed-off-by: Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>
> >
> > Fixes: 60f36637bbbd ("wlcore: sdio: allow pm to handle sdio power")
> > Tested-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Acked-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > Wei Xu: This fixes a functional regression with wifi on the HiKey
> > board that was introduced in 4.18-rc with commit 60f36637bbbd
> > ("wlcore: sdio: allow pm to handle sdio power").
> >
> > Could you please be sure to queue this for the 4.18-rc ?
>=20
> Adding linux-wireless so that wireless folks are aware of this wlcore
> regression fix as well.
>=20
Actually  "cap-power-off-card" is normally included with all .dts files sup=
porting wilink=20
So it should have been there from the start for this board as well.=20
It probably worked without it due to the explicit call to mmc_power_restore=
_host()
that was there as an old workaround for trying to control the power explici=
tly from the
driver which was actually causing other failures on suspend/resume as the m=
mc layer=20
already power the module on resume.
"keep-power-in-suspend" is needed in case of planning to use "WoWLAN":
Iw phy0 wowlan enable....

Best Regards,
Eyal
