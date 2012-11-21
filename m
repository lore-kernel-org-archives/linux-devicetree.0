From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/9] usb: chipidea: add PTW and PTS handling
Date: Wed, 21 Nov 2012 16:57:23 +0100
Message-ID: <20121121155723.GA16409@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-7-git-send-email-m.grzeschik@pengutronix.de>
 <87zk2h67ik.fsf@ashishki-desk.ger.corp.intel.com>
 <20121116131628.GA21447@pengutronix.de>
 <87lie1659c.fsf@ashishki-desk.ger.corp.intel.com>
 <20121116135743.GB21447@pengutronix.de>
 <87ip9563r8.fsf@ashishki-desk.ger.corp.intel.com>
 <50A651E1.5030001@parrot.com>
 <87fw495zgh.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87fw495zgh.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2012 at 05:39:42PM +0200, Alexander Shishkin wrote:
> Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org> writes:
>=20
> > Alexander Shishkin a =E9crit :
> >> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> >>=20
> >>> On Fri, Nov 16, 2012 at 03:34:23PM +0200, Alexander Shishkin wrot=
e:
> >>>> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> >>>>
> >>>>> On Fri, Nov 16, 2012 at 02:45:39PM +0200, Alexander Shishkin wr=
ote:
> >>>>>> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> >>>>>>
> >>>>>>> This patch makes it possible to configure the PTW and PTS bit=
s inside
> >>>>>>> the portsc register for host and device mode before the drive=
r starts
> >>>>>>> and the phy can be addressed as hardware implementation is de=
signed.
> >>>>>>>
> >>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>>>>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>>>>> ---
> >>>>>>>  drivers/usb/chipidea/bits.h        |    3 +++
> >>>>>>>  drivers/usb/chipidea/ci.h          |    2 ++
> >>>>>>>  drivers/usb/chipidea/ci13xxx_imx.c |    1 +
> >>>>>>>  drivers/usb/chipidea/core.c        |   47 ++++++++++++++++++=
++++++++++++++++++
> >>>>>>>  drivers/usb/chipidea/host.c        |    4 +++
> >>>>>>>  include/linux/usb/chipidea.h       |    9 +++++++
> >>>>>>>  6 files changed, 66 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipid=
ea/bits.h
> >>>>>>> index 4b6ae3e..3cded5f 100644
> >>>>>>> --- a/drivers/usb/chipidea/bits.h
> >>>>>>> +++ b/drivers/usb/chipidea/bits.h
> >>>>>>> @@ -48,6 +48,9 @@
> >>>>>>>  #define PORTSC_SUSP           BIT(7)
> >>>>>>>  #define PORTSC_HSP            BIT(9)
> >>>>>>>  #define PORTSC_PTC            (0x0FUL << 16)
> >>>>>>> +#define PORTSC_PTS            (BIT(31) | BIT(30))
> >>>>>>> +#define PORTSC_PTW            BIT(28)
> >>>>>>> +#define PORTSC_STS            BIT(29)
> >>>>>> Hm, my spec says these are actually in DEVLC register and only=
 have this
> >>>>>> meaning in device mode. And in portsc these bits fall in devic=
e address
> >>>>>> bitfield. Can you refer me to your spec?
> >>>>> You can find it here:
> >>>>> http://cache.freescale.com/files/32bit/doc/ref_manual/iMX53RM.p=
df?fpsp=3D1
> >>>>> Page 4947
> >>>> Oh, but see, the offset is 0x184, which in chipidea spec (the ve=
rsion
> >>>> that I have) corresponds to DEVLC and not PORTSC. So in this dri=
ver's
> >>>> terminology it's DEVLC too, at least currently.
> >>>>
> >>>> So have you tested this code and did it make any difference?
> >>> Yes, i have tested this code with MX25, MX28, MX35 and MX53. In e=
very
> >>> SoCs Datasheet the PORTSC register is defined on PORTBASE+0x184. =
Without
> >>> this proper configuration its not possible to communicate with th=
e PHY.
> >>=20
> >> No, I mean, you're writing DEVLC (using present driver's terminolo=
gy)
> >> bits to PORTSC register. It *shouldn't* work. I suppose, it does
> >> something, but not exactly what you intended.
> >>=20
> > I confirm in our datasheet we have PTW, PTS, STS in this register  =
PORTSCx with
> > this mapping.
> >
> > In later design that support lpm, these bits have to move in anothe=
r register
> > because ehci 1.1 use them [1].
>=20
> Ahh, I didn't realize imxes were nolpm. Now it makes more sense. This
> means that, as you suggested in the other mail, these portsc/devlc
> accesses should be done conditionally based on ci->hw_bank.lpm.

To handle lpm devices in this patch, we need some register layout of th=
e
lpm core. Probably only te DEVLC register. Is there some documentation
available?

Regards,
Michael

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
