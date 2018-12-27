Return-Path: <SRS0=S6uY=PE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:50074 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728373AbeL0Kbd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Dec 2018 05:31:33 -0500
From: <Lars.Povlsen@microchip.com>
Subject: Re: [PATCH] mips: gpio: mscc_sgpio: Add DT bindings documentation
Date: Thu, 27 Dec 2018 10:31:29 +0000
Message-ID: <BYAPR11MB31090494F6DC3D1AEE64075782B60@BYAPR11MB3109.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: linus.walleij@linaro.org, devicetree@vger.kernel.org
Cc: gregory.clement@bootlin.com
List-ID: <devicetree@vger.kernel.org>

Hi Linus!

Thank you very much for your feedback - and sorry about the delay in=20
getting back to you.

I will send you a v2 updated version addressing you comments. Thank you!

See below for comments

---Lars

> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Fri, 7 Dec 2018 10:43:38 +0100
> Message-ID: <CACRpkdZ47tELuJR3DG-
> d8tsvz4ez_j6TxCYiiGT3L01CJ1LSTA@mail.gmail.com>
> Subject: Re: [PATCH] mips: gpio: mscc_sgpio: Add DT bindings
> documentation
> To: lars.povlsen@microchip.com
> Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
> <devicetree@vger.kernel.org>,
> 	Gregory Clement <gregory.clement@bootlin.com>
>=20
> Hi Lars,
>=20
> thanks for your patch!
>=20
> On Mon, Nov 26, 2018 at 1:22 PM Lars Povlsen
> <lars.povlsen@microchip.com> wrote:
>=20
> > +MSCC Serial GPIO driver
>=20
> Expand the acronym please, if IIUC this is
> "Microsemi Corporation (MSCC) Serial GPIO driver"

Will do.

>=20
> > +- mscc,sgpio-frequency: The frequency at which the serial bitstream
> is
> > +  generated and sampled. Default: 12500000 (Hz).
>=20
> Uhm what is a serial bitstream in this context, I am lost.
> Please elaborate.

I added some background details to the description.

>=20
> > +- mscc,sgpio-bitcount: The number of bits enabled per
> > +  port. (1-4). Default: 2.
>=20
> Can't you just use the standard "ngpios" property for this?
> See
> Documentation/devicetree/bindings/gpio/gpio.txt
>=20

I dropped this property in favor of deriving from gpio-ranges and
(optionally) ngpios as proposed.

> Why is this a global setting for all ports and not per-port?
>=20
> > +- mscc,sgpio-ports: A bitmask (32 bits) of which ports are enabled in
> > +  the serialized gpio stream. Default: 0xFFFFFFFF.
>=20
> I don't understand this either. Are there up to 32 ports?
> (Also referred to as "banks") with 1-4 GPIOs each?

Yes each port represent 1-4 GPIOs. Changed to:

- mscc,sgpio-ports: A bitmask (32 bits) of which ports are enabled in
  the serialized gpio stream. One 'port' will transport from 1 to 4
  gpio bits. Default: 0xFFFFFFFF.


Again, thank you very much for your comments - they are highly appreciated.

---Lars

>=20
> Yours,
> Linus Walleij
> -------------------- End of forwarded message --------------------
>=20
> --
> Gregory Clement, Bootlin
> Embedded Linux and Kernel engineering
> http://bootlin.com
