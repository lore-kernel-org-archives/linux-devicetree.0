Return-Path: <SRS0=z3qq=TI=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 00/10] usb: Add host and device support for RZ/A2
Date: Wed, 8 May 2019 18:07:40 +0000
Message-ID: 
 <TY1PR01MB1562C5FCC551A2857A6D15E78A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda=1B$B$5$s=1B(B

> From: Yoshihiro Shimoda
> Sent: Tuesday, May 07, 2019 5:17 AM
> > For the most part, the RZ/A2 has the same USB 2.0 host and device
> > HW as the R-Car Gen3, so we can reuse a lot of the code.
> >
> > However, there are a couple extra register bits, and the CFIFO
> > register 8-bit access works a little different (weird, no idea why).
>=20
> This is just my gut feeling, but if we set the BIGEND bit in the CFIFOSEL
> of RZ/A2M (R-Car Gen3 doesn't have such a bit though), could the original
> code work correctly?

I just tried to set CFIFOSEL.BIGEND =3D 1

 * Set CFIFOSEL.BIGEND =3D 1
 * Write 8-bit values to CFIFO (same method as R-Car)
 * Set CFIFOSEL.BIGEND =3D 0

The result is bad.


But, then I tried this:
 * Set CFIFOSEL.MBW =3D 0   (CFIFO port access =3D 8-bit)
 * Write 8-bit values to CFIFO
 * Set CFIFOSEL.MBW =3D 2   (CFIFO port access =3D 32-bit)

Code:
u16 cfifosel =3D usbhs_read(priv, fifo->sel);

usbhs_write(priv, fifo->sel, cfifosel & 0xF3FF); // MBW =3D 8-bit

		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr); //same address each time

usbhs_write(priv, fifo->sel, cfifosel);	// MBW =3D 32-bit


This method works good.

  (I assume this method would work with R-Car also)

But...then we have extra register reads and writes.
Register accesses are slower, so performance is lower.

So, I prefer my original method:
	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (i & 0x03));
	else
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));


Do you agree?

Chris
