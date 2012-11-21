From: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/9] usb: chipidea: add PTW and PTS handling
Date: Wed, 21 Nov 2012 17:06:26 +0100
Message-ID: <50ACFC02.9010805@parrot.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-7-git-send-email-m.grzeschik@pengutronix.de> <87zk2h67ik.fsf@ashishki-desk.ger.corp.intel.com> <20121116131628.GA21447@pengutronix.de> <87lie1659c.fsf@ashishki-desk.ger.corp.intel.com> <20121116135743.GB21447@pengutronix.de> <87ip9563r8.fsf@ashishki-desk.ger.corp.intel.com> <50A651E1.5030001@parrot.com> <87fw495zgh.fsf@ashishki-desk.ger.corp.intel.com> <20121121155723.GA16409@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121121155723.GA16409-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Michael Grzeschik a =E9crit :
> On Fri, Nov 16, 2012 at 05:39:42PM +0200, Alexander Shishkin wrote:
>> Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org> writes:
>>
>>> Alexander Shishkin a =E9crit :
>>>> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>>>
>>>>> On Fri, Nov 16, 2012 at 03:34:23PM +0200, Alexander Shishkin wrot=
e:
>>>>>> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>>>>>
>>>>>>> On Fri, Nov 16, 2012 at 02:45:39PM +0200, Alexander Shishkin wr=
ote:
>>>>>>>> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>>>>>>>
>>>>>>>>> This patch makes it possible to configure the PTW and PTS bit=
s inside
>>>>>>>>> the portsc register for host and device mode before the drive=
r starts
>>>>>>>>> and the phy can be addressed as hardware implementation is de=
signed.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>>>>> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>>>>> ---
>>>>>>>>>  drivers/usb/chipidea/bits.h        |    3 +++
>>>>>>>>>  drivers/usb/chipidea/ci.h          |    2 ++
>>>>>>>>>  drivers/usb/chipidea/ci13xxx_imx.c |    1 +
>>>>>>>>>  drivers/usb/chipidea/core.c        |   47 ++++++++++++++++++=
++++++++++++++++++
>>>>>>>>>  drivers/usb/chipidea/host.c        |    4 +++
>>>>>>>>>  include/linux/usb/chipidea.h       |    9 +++++++
>>>>>>>>>  6 files changed, 66 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipid=
ea/bits.h
>>>>>>>>> index 4b6ae3e..3cded5f 100644
>>>>>>>>> --- a/drivers/usb/chipidea/bits.h
>>>>>>>>> +++ b/drivers/usb/chipidea/bits.h
>>>>>>>>> @@ -48,6 +48,9 @@
>>>>>>>>>  #define PORTSC_SUSP           BIT(7)
>>>>>>>>>  #define PORTSC_HSP            BIT(9)
>>>>>>>>>  #define PORTSC_PTC            (0x0FUL << 16)
>>>>>>>>> +#define PORTSC_PTS            (BIT(31) | BIT(30))
>>>>>>>>> +#define PORTSC_PTW            BIT(28)
>>>>>>>>> +#define PORTSC_STS            BIT(29)
>>>>>>>> Hm, my spec says these are actually in DEVLC register and only=
 have this
>>>>>>>> meaning in device mode. And in portsc these bits fall in devic=
e address
>>>>>>>> bitfield. Can you refer me to your spec?
>>>>>>> You can find it here:
>>>>>>> http://cache.freescale.com/files/32bit/doc/ref_manual/iMX53RM.p=
df?fpsp=3D1
>>>>>>> Page 4947
>>>>>> Oh, but see, the offset is 0x184, which in chipidea spec (the ve=
rsion
>>>>>> that I have) corresponds to DEVLC and not PORTSC. So in this dri=
ver's
>>>>>> terminology it's DEVLC too, at least currently.
>>>>>>
>>>>>> So have you tested this code and did it make any difference?
>>>>> Yes, i have tested this code with MX25, MX28, MX35 and MX53. In e=
very
>>>>> SoCs Datasheet the PORTSC register is defined on PORTBASE+0x184. =
Without
>>>>> this proper configuration its not possible to communicate with th=
e PHY.
>>>> No, I mean, you're writing DEVLC (using present driver's terminolo=
gy)
>>>> bits to PORTSC register. It *shouldn't* work. I suppose, it does
>>>> something, but not exactly what you intended.
>>>>
>>> I confirm in our datasheet we have PTW, PTS, STS in this register  =
PORTSCx with
>>> this mapping.
>>>
>>> In later design that support lpm, these bits have to move in anothe=
r register
>>> because ehci 1.1 use them [1].
>> Ahh, I didn't realize imxes were nolpm. Now it makes more sense. Thi=
s
>> means that, as you suggested in the other mail, these portsc/devlc
>> accesses should be done conditionally based on ci->hw_bank.lpm.
>=20
> To handle lpm devices in this patch, we need some register layout of =
the
> lpm core. Probably only te DEVLC register. Is there some documentatio=
n
> available?

In include/linux/usb/langwell_udc.h before it was removed, you could fi=
nd the
mapping :

    u32 devlc;      /* control LPM and each USB port behavior */
/* bits 31:29, parallel transceiver select */
#define LPM_PTS(d)  (((d)>>29)&7)
#define LPM_STS     BIT(28) /* serial transceiver select */
#define LPM_PTW     BIT(27) /* parallel transceiver width */
#define LPM_PSPD(d) (((d)>>25)&3)   /* bits 26:25, port speed */
#define LPM_PSPD_MASK   (BIT(26) | BIT(25))
#define LPM_SPEED_FULL  0
#define LPM_SPEED_LOW   1
#define LPM_SPEED_HIGH  2
#define LPM_SRT     BIT(24) /* shorten reset time */
#define LPM_PFSC    BIT(23) /* port force full speed connect */
#define LPM_PHCD    BIT(22) /* PHY low power suspend clock disable */
#define LPM_STL     BIT(16) /* STALL reply to LPM token */
#define LPM_BA(d)   \
    (((d)>>1)&0x7ff)    /* bits 11:1, BmAttributes */
#define LPM_NYT_ACK BIT(0)  /* NYET/ACK reply to LPM token */
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
