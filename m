From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Tue, 7 Apr 2015 10:42:23 +0100
Message-ID: <20150407094223.GI3461@x1>
References: <1427891304-20160-1-git-send-email-lee.jones@linaro.org>
 <1427891304-20160-5-git-send-email-lee.jones@linaro.org>
 <CAMuHMdXbWTuQAP9hg1qVCgaodkD3Wjin9UX=7uT=F0yodqEm+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXbWTuQAP9hg1qVCgaodkD3Wjin9UX=7uT=F0yodqEm+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 02 Apr 2015, Geert Uytterhoeven wrote:

> On Wed, Apr 1, 2015 at 2:28 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrot=
e:
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/clock/clock-bindings.txt   | 31 ++++++++++=
++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings=
=2Etxt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > index 06fc6d5..94cdda2 100644
> > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -44,6 +44,37 @@ For example:
> >    clocks by index. The names should reflect the clock output signa=
l
> >    names for the device.
> >
> > +clock-always-on:    Some hardware contains bunches of clocks which=
 must never be
> > +                   turned off.  If drivers a) fail to obtain a ref=
erence to any
> > +                   of these or b) give up a previously obtained re=
ference
> > +                   during suspend, the common clk framework will a=
ttempt to
> > +                   disable them and a platform can fail irrecovera=
bly as a
> > +                   result.  Usually the only way to recover from t=
hese failures
> > +                   is to reboot.
> > +
> > +                   To avoid either of these two scenarios from cat=
astrophically
> > +                   disabling an otherwise perfectly healthy runnin=
g system,
> > +                   clocks can be identified as always-on using thi=
s property
> > +                   from inside a clocksource's node.
> > +
> > +                   This property is not to be abused.  It is only =
to be used to
> > +                   protect platforms from being crippled by gated =
clocks, not
> > +                   as a convenience function to avoid using the fr=
amework
> > +                   correctly inside device drivers.
>=20
> Please document what are the expected value(s) for this property.
> I assume these are clock indices into the array of hardware clocks?
>=20
> Do they take into account sparse hardware clocks, cfr. the "clock-ind=
ices"
> property below (I didn't check)?

They must match a valid indices.  If the clock-indices property is
present, the value identified as always-on must match one of the
clocks listed.

I'll mention that.

> > +For example:
> > +
> > +    oscillator {
> > +        #clock-cells =3D <1>;
> > +        clock-output-names =3D "ckil", "ckih";
> > +        clock-always-on =3D <0>, <1>;
> > +    };
> > +
> > +- this node defines a device with two clock outputs, just as in th=
e
> > +  example above.  The only difference being that 'ckil' and 'ckih'
> > +  are now identified as an always-on clocks, so the framework will
> > +  know to never attempt to gate them.
> > +
> >  clock-indices:    If the identifying number for the clocks in the =
node
> >                    is not linear from zero, then this allows the ma=
pping of
> >                    identifiers into the clock-output-names array.
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
