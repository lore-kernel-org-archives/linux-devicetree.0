From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 6/9] usb: chipidea: add PTW and PTS handling
Date: Fri, 16 Nov 2012 17:39:42 +0200
Message-ID: <87fw495zgh.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-7-git-send-email-m.grzeschik@pengutronix.de> <87zk2h67ik.fsf@ashishki-desk.ger.corp.intel.com> <20121116131628.GA21447@pengutronix.de> <87lie1659c.fsf@ashishki-desk.ger.corp.intel.com> <20121116135743.GB21447@pengutronix.de> <87ip9563r8.fsf@ashishki-desk.ger.corp.intel.com> <50A651E1.5030001@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A651E1.5030001-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mkl@pengutronix.de" <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh@linuxfoundation.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "fabio.estevam@freescale.com" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel@pengutronix.de" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org> writes:

> Alexander Shishkin a =C3=A9crit :
>> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>=20
>>> On Fri, Nov 16, 2012 at 03:34:23PM +0200, Alexander Shishkin wrote:
>>>> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>>>
>>>>> On Fri, Nov 16, 2012 at 02:45:39PM +0200, Alexander Shishkin wrot=
e:
>>>>>> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>>>>>
>>>>>>> This patch makes it possible to configure the PTW and PTS bits =
inside
>>>>>>> the portsc register for host and device mode before the driver =
starts
>>>>>>> and the phy can be addressed as hardware implementation is desi=
gned.
>>>>>>>
>>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>>> ---
>>>>>>>  drivers/usb/chipidea/bits.h        |    3 +++
>>>>>>>  drivers/usb/chipidea/ci.h          |    2 ++
>>>>>>>  drivers/usb/chipidea/ci13xxx_imx.c |    1 +
>>>>>>>  drivers/usb/chipidea/core.c        |   47 ++++++++++++++++++++=
++++++++++++++++
>>>>>>>  drivers/usb/chipidea/host.c        |    4 +++
>>>>>>>  include/linux/usb/chipidea.h       |    9 +++++++
>>>>>>>  6 files changed, 66 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea=
/bits.h
>>>>>>> index 4b6ae3e..3cded5f 100644
>>>>>>> --- a/drivers/usb/chipidea/bits.h
>>>>>>> +++ b/drivers/usb/chipidea/bits.h
>>>>>>> @@ -48,6 +48,9 @@
>>>>>>>  #define PORTSC_SUSP           BIT(7)
>>>>>>>  #define PORTSC_HSP            BIT(9)
>>>>>>>  #define PORTSC_PTC            (0x0FUL << 16)
>>>>>>> +#define PORTSC_PTS            (BIT(31) | BIT(30))
>>>>>>> +#define PORTSC_PTW            BIT(28)
>>>>>>> +#define PORTSC_STS            BIT(29)
>>>>>> Hm, my spec says these are actually in DEVLC register and only h=
ave this
>>>>>> meaning in device mode. And in portsc these bits fall in device =
address
>>>>>> bitfield. Can you refer me to your spec?
>>>>> You can find it here:
>>>>> http://cache.freescale.com/files/32bit/doc/ref_manual/iMX53RM.pdf=
?fpsp=3D1
>>>>> Page 4947
>>>> Oh, but see, the offset is 0x184, which in chipidea spec (the vers=
ion
>>>> that I have) corresponds to DEVLC and not PORTSC. So in this drive=
r's
>>>> terminology it's DEVLC too, at least currently.
>>>>
>>>> So have you tested this code and did it make any difference?
>>> Yes, i have tested this code with MX25, MX28, MX35 and MX53. In eve=
ry
>>> SoCs Datasheet the PORTSC register is defined on PORTBASE+0x184. Wi=
thout
>>> this proper configuration its not possible to communicate with the =
PHY.
>>=20
>> No, I mean, you're writing DEVLC (using present driver's terminology=
)
>> bits to PORTSC register. It *shouldn't* work. I suppose, it does
>> something, but not exactly what you intended.
>>=20
> I confirm in our datasheet we have PTW, PTS, STS in this register  PO=
RTSCx with
> this mapping.
>
> In later design that support lpm, these bits have to move in another =
register
> because ehci 1.1 use them [1].

Ahh, I didn't realize imxes were nolpm. Now it makes more sense. This
means that, as you suggested in the other mail, these portsc/devlc
accesses should be done conditionally based on ci->hw_bank.lpm.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
