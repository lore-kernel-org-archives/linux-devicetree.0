Return-Path: <SRS0=cxpq=TJ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 00/10] usb: Add host and device support for RZ/A2
Date: Thu, 9 May 2019 06:23:37 +0000
Message-ID: 
 <OSBPR01MB3174EB1DCBEB9C7CDB3EC3D6D8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <TY1PR01MB1562C5FCC551A2857A6D15E78A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY1PR01MB1562C5FCC551A2857A6D15E78A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris=1B$B$5$s=1B(B

> From: Chris Brandt, Sent: Thursday, May 9, 2019 3:08 AM
>=20
> Hi Shimoda=1B$B$5$s=1B(B
>=20
> > From: Yoshihiro Shimoda
> > Sent: Tuesday, May 07, 2019 5:17 AM
> > > For the most part, the RZ/A2 has the same USB 2.0 host and device
> > > HW as the R-Car Gen3, so we can reuse a lot of the code.
> > >
> > > However, there are a couple extra register bits, and the CFIFO
> > > register 8-bit access works a little different (weird, no idea why).
> >
> > This is just my gut feeling, but if we set the BIGEND bit in the CFIFOS=
EL
> > of RZ/A2M (R-Car Gen3 doesn't have such a bit though), could the origin=
al
> > code work correctly?
>=20
> I just tried to set CFIFOSEL.BIGEND =3D 1

Thank you for trying it!

>  * Set CFIFOSEL.BIGEND =3D 1
>  * Write 8-bit values to CFIFO (same method as R-Car)
>  * Set CFIFOSEL.BIGEND =3D 0
>=20
> The result is bad.

I got it...

> But, then I tried this:
>  * Set CFIFOSEL.MBW =3D 0   (CFIFO port access =3D 8-bit)
>  * Write 8-bit values to CFIFO
>  * Set CFIFOSEL.MBW =3D 2   (CFIFO port access =3D 32-bit)
>=20
> Code:
> u16 cfifosel =3D usbhs_read(priv, fifo->sel);
>=20
> usbhs_write(priv, fifo->sel, cfifosel & 0xF3FF); // MBW =3D 8-bit
>=20
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr); //same address each time
>=20
> usbhs_write(priv, fifo->sel, cfifosel);	// MBW =3D 32-bit
>=20
>=20
> This method works good.

I got it.

>   (I assume this method would work with R-Car also)

Unfortunately, R-Car cannot work with this method...
But, "iowrite8(buf[i], addr + 3);" or "iowrite32(buf[i], addr);" works on t=
he R-Car.
And then, I realized that R-Car CFIFO register allows 32-bit access only...
# So, I'm asking HW guy whether the 8-bit access can be allowed or not now.=
..

> But...then we have extra register reads and writes.
> Register accesses are slower, so performance is lower.
>=20
> So, I prefer my original method:
> 	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (i & 0x03));
> 	else
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
>=20
>=20
> Do you agree?

I agree.
However, I have some comments about the patch. So, I'll reply on the patch =
later.

Best regards,
Yoshihiro Shimoda

> Chris
