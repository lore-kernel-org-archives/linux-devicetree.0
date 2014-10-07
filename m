From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Documentation: devicetree: bindings: Document
 correct and deprecated vendor-prefix with device isl29028
Date: Tue, 7 Oct 2014 13:17:40 +0100
Message-ID: <20141007121740.GL24725@leverpostej>
References: <1412682308-8784-1-git-send-email-darshanapadmadas@gmail.com>
 <1412682308-8784-2-git-send-email-darshanapadmadas@gmail.com>
 <20141007120249.GH24725@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141007120249.GH24725@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 01:02:49PM +0100, Mark Rutland wrote:
> On Tue, Oct 07, 2014 at 12:45:05PM +0100, Darshana Padmadas wrote:
> > This patch documents the device isl29028 with its vendor-prefix. Un=
documented deprecated vendor-prefix
> > found by checkpatch also documented for compatibility reasons.
> >=20
> > Signed-off-by: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>=20
> > ---
> >  Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.=
txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> > index 6af570e..d024613 100644
> > --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> > +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> > @@ -57,6 +57,8 @@ gmt,g751		G751: Digital Temperature Sensor and Th=
ermal Watchdog with Two-Wire In
> >  infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol,=
 max 100khz)
> >  infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400=
khz)
> >  isl,isl12057		Intersil ISL12057 I2C RTC Chip
> > +isil,isl29028           Deprecated name, use isl,isl29028 instead

Looking again, could you change the comment to "(deprecated, use isl)",
as I mentioned previously?

Then that will match what we have for powervr, which seems to be the
only other instance of "deprecated" in vendor-prefixes.txt.

Cheers,
Mark.

> > +isl,isl29028            Intersil ISL29028 Ambient Light and Proxim=
ity Sensor
> >  maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
> >  maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADC=
s
> >  maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C3=82=C2=B2=
C-Compatible Serial Interface
> > --=20
> > 1.9.1
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetre=
e" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
