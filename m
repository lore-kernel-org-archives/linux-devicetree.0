Return-Path: <SRS0=A7QD=FR=bootlin.com=boris.brezillon@kernel.org>
Date: Fri, 23 Feb 2018 23:45:46 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2 2/7] i3c: Add core I3C infrastructure
Message-ID: <20180223234546.54e62150@bbrezillon>
In-Reply-To: <b39f9016-b2ff-6d8d-96b3-945f32ab2b67@synopsys.com>
References: <20171214151610.19153-1-boris.brezillon@free-electrons.com>
	<20171214151610.19153-3-boris.brezillon@free-electrons.com>
	<b39f9016-b2ff-6d8d-96b3-945f32ab2b67@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Przemyslaw Sroka <psroka@cadence.com>, Arkadiusz Golec <agolec@cadence.com>, Alan Douglas <adouglas@cadence.com>, Bartosz Folta <bfolta@cadence.com>, Damian Kos <dkos@cadence.com>, Alicja Jurasik-Urbaniak <alicja@cadence.com>, Cyprian Wronka <cwronka@cadence.com>, Suresh Punnoose <sureshp@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Nishanth Menon <nm@ti.com>, "Rob Herring  <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland" <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, 23 Feb 2018 16:56:14 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:


> > +
> > +/**
> > + * struct i3c_ccc_setda - payload passed to ENTTM CCC
> > + *
> > + * @mode: one of the &enum i3c_ccc_test_mode modes
> > + *
> > + * Information passed to the ENTTM CCC to instruct an I3C device to en=
ter a
> > + * specific test mode.

Oops, copy&paste error. I'll fix the kernel-doc header.

> > + */
> > +struct i3c_ccc_setda {
> > +	u8 addr;
> > +} __packed; =20
>=20
> =C2=A0what do you mean with struct? Maybe setdasa? if so, what is the add=
r?

It's the payload passed to SETDASA and SETNEWDA, hence the generic
_setda suffix. addr is the new dynamic address assigned to the
device.



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
