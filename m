From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: BCM5301X: Add /device_id property including
 device ID string
Date: Fri, 10 Apr 2015 12:55:02 +0200
Message-ID: <CACna6rzmACyJ6=EJCCi2eCp1A8cCLJiusm7=pyHQM0QL+82Zng@mail.gmail.com>
References: <1427667288-23903-1-git-send-email-zajec5@gmail.com>
	<CACna6rykQq6AVSWzJh3qnHVNzPXbTD9TMGQf9D9p50pcbQkmng@mail.gmail.com>
	<20150330105828.GE17971@leverpostej>
	<24438163.XzJnLCdvP5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24438163.XzJnLCdvP5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10 April 2015 at 12:50, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 30 March 2015 11:58:29 Mark Rutland wrote:
>> > > On Sun, Mar 29, 2015 at 11:14:48PM +0100, Rafa=C5=82 Mi=C5=82eck=
i wrote:
>> > >> Device vendors often assign IDs to their devices to allow compa=
ring
>> > >> firmware image with device model. This is required to prevent u=
sers
>> > >> from flashing incompatible image and soft-bricking device.
>> > >> Add device_id property to DTs to allow user space (and optional=
ly
>> > >> bootloader) verifying firmware images.
>> > >
>> > > This sounds like exactly what the "model" property is meant to b=
e (per
>> > > ePAPR) -- a string that specifices the manufacturer's model numb=
er of
>> > > the device, ideally in "manufacturer,model" format.
>> >
>> > What if manufacturer decided to use some totally unfriendly ID for
>> > their low-level (firmware upgrade) model identification? I can't
>> > really see us using
>> > model  "U12H245T00_NETGEAR"
>> > which would mean nothing compared to the current friendly:
>> > model  "Netgear R6250 V1 (BCM4708)"
>>
>> If it uniquely identifies the model, it's fit to be a model string. =
If
>> being "friendly" means that we lose that, then the property is usele=
ss
>> anyway.
>>
>> Note that both examples above deviate from the recommended format, a=
nd
>> something like: "netgear,U12H245T00" would better align with the
>> recommendation.
>
> Sorry for jumping in late here, but this still sounds like more fitti=
ng
> for the "compatible" property than "model". For compatible, you can
> already have multiple strings, and they come with a vendor prefix.
>
> Any of these would seem reasonable to me:
>
> a)
>         compatible =3D "asus,rt-ac68u", "openwrt,RT-AC68U", "brcm,bcm=
4708";
>         model =3D "Asus RT-AC68U (BCM4708)";
>
> b)
>         compatible =3D "asus,rt-ac68u", "brcm,RT-AC68U", "brcm,bcm470=
8";
>         model =3D "Asus RT-AC68U (BCM4708)";
>
> c)
>         compatible =3D "asus,rt-ac68u", "asus,RT-AC68U", "brcm,bcm470=
8";
>         model =3D "Asus RT-AC68U (BCM4708)";
>
> depending on which party maintains the list of these identifiers.

Thanks, I think it looks like the best alternative to my initial idea.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
