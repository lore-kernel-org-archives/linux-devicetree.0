From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mfd: flexcom: add a driver for Atmel Flexible
 Serial Communication Unit
Date: Mon, 20 Jul 2015 18:11:54 +0200
Message-ID: <55AD1DCA.9080308@atmel.com>
References: <cover.1434967670.git.cyrille.pitchen@atmel.com> <dddf7a6d750967785255733a7931780b3c465d5f.1434967670.git.cyrille.pitchen@atmel.com> <20150624142456.GS15013@x1> <558BD3B8.10709@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558BD3B8.10709-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

based on my previous mail, do someone have any idea on how to add suppo=
rt to
the Flexcom in the kernel ? We would like to manage the Flexcom separat=
ely so
we avoid patching 3 existing drivers.

Indeed, their associated devices have no need to know whether they're w=
rapped
or not by a Flexcom: the Flexcom itself has no functional impact on the=
 serial
controllers it contains.

Also, hiding the additional layer of the Flexcom from the USART, SPI an=
d I2C
drivers would ease their maintenance: it keeps the design of each IP
independent from the others so it would be more easy to add support to =
future
features.


Best Regards,

Cyrille


Le 25/06/2015 12:11, Cyrille Pitchen a =C3=A9crit :
> Hi lee,
>=20
> Le 24/06/2015 16:24, Lee Jones a =C3=A9crit :
>> On Mon, 22 Jun 2015, Cyrille Pitchen wrote:
>>
>>> This driver supports the new Atmel Flexcom. The Flexcom is a wrappe=
r which
>>> integrates one SPI controller, one I2C controller and one USART. On=
ly one
>>> function can be enabled at a time. This driver selects the function=
 once
>>> for all, when the Flexcom is probed, according to the value of the =
new
>>> "atmel,flexcom-mode" device tree property.
>>>
>>> This driver has chosen to present the Flexcom to the system as a MF=
D so
>>> the implementation is seamless for the existing Atmel SPI, I2C and =
USART
>>> drivers.
>>
>> No need for this driver.
>>
>> Just create your 3 platform drivers and get them to read the mode at
>> probe time.  If the mode isn't the one pertaining to itself return
>> -ENODEV and the Device Driver API will attempt the probe the next
>> device.  Ensure all of the devices have the same compatible string
>> i.e. atmel,sama5d2-flexcom.
>>
>=20
> The main idea of this patch was to hide the Flexcom overlay from the =
3 serial
> drivers. The Flexcom is a kind of muxer which selects one of the 3 IP=
s: it=20
> doesn't change the internal of the IPs. For instance, on sama5d2x SoC=
s,
> some SPI controlers are still standalone whereas others are wrapped b=
y a
> Flexcom but all these SPI controllers share the same IP version.
>=20
> Also, the Flexcom has its own I/O range. Especially, the Flexcom Mode=
 Register
> which selects the active peripheral is outside the I/O ranges of the =
SPI, I2C
> or USART IPs.
>=20
> The active peripheral must be selected first then its driver can acce=
ss its I/O
> registers but registers of the other inactive peripherals are still u=
navailable
> and would be read as zero since their peripherals are still disabled.
> That's why the very first version of the driver presented the Flexcom=
 as a
> clock because most peripherals can't be used before enabling their cl=
ock.
> However the Flexcom is not an actual clock so I was told that it woul=
d be
> better to introduce the Flexcom as an MFD.
>=20
> The idea is to separate the serial controller drivers and the Flexcom=
 driver
> the same way as a clock driver and a pin controller driver are separa=
ted from
> the driver of a peripheral which uses them.
>=20
>=20
> Best Regards,
>=20
> Cyrille
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
