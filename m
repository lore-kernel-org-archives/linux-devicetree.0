From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: add driver for the TI DAC8554
Date: Mon, 15 Dec 2014 11:02:13 +0100
Message-ID: <20141215100213.GA6159@avionic-0071.adnet.avionic-design.de>
References: <1416858614-32265-1-git-send-email-nikolaus.schulz@avionic-design.de>
 <1416858614-32265-2-git-send-email-nikolaus.schulz@avionic-design.de>
 <5482EA33.7020305@gmx.de>
 <20141212155804.GA1142@avionic-0071.adnet.avionic-design.de>
 <548C209A.7000904@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <548C209A.7000904-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 13, 2014 at 12:18:50PM +0100, Hartmut Knaack wrote:
> Nikolaus Schulz schrieb am 12.12.2014 um 16:58:
> > On Sat, Dec 06, 2014 at 12:36:19PM +0100, Hartmut Knaack wrote:
> >> Nikolaus Schulz schrieb am 24.11.2014 um 20:50:
> >>> The TI DAC8554 is a quad-channel Digital-to-Analog Converter with=
 an SPI
> >>> interface.
[dac8554_probe:]
> >>> +	st->vref_mv =3Doltage_uv / 1000;
> >> How hard do you want to depend on a voltage regulator? Doing regul=
ator_get_voltage()
> >> could even be called dynamically in _read_raw(), making a real reg=
ulator optional.
> >=20
> > Hmm. I understand that the DAC voltage input may not be provided by=
 a
> > regulator, but is that a common scenario?  No other DAC driver I lo=
oked
> > at handles that case, they all consider it an error if the regulato=
r is
> > absent.
> >=20
> I had people in mind, who might want to use such DAC with one of the =
popular
> embedded boards like Raspberry Pi - people who would just like to "pl=
ug and
> play" without the need or ability to build a kernel (or would prefer =
to go
> with the convenience of a distribution kernel). But since you've put =
a
> dependency on OF, I don't see a way to use this device with a stock d=
istribution
> kernel anyway.

As long as the kernel supports devicetree, compiling the module and a
new DT blob should be enough to enable support for the DAC8554.

And, as Jonathan has pointed out, if there is no real regulator
providing the input current, a fixed regulator can be added to the DT.

> But I still think that calculating the actual voltage during _read_ra=
w() would
> be a good idea, as there is support for regulators providing differen=
t voltages,
> which can be changed during runtime.

Agreed.

--=20
Avionic Design GmbH
Nikolaus Schulz
Wragekamp 10
D-22397 Hamburg
Germany

Tel.:  +49 40 88187-163
=46ax:   +49 40 88187-150
Email: nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org

Avionic Design GmbH
Amtsgericht Hamburg HRB 82598
Gesch=E4ftsf=FChrung: Cornelis Broers
Ust.-Ident-Nr.: DE813378254
