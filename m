From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v3] pwm_backlight: Add device tree support for Low
 Threshold Brightness
Date: Fri, 28 Sep 2012 07:45:48 +0200
Message-ID: <20120928054548.GB10237@avionic-0098.mockup.avionic-design.de>
References: <1348670827-5720-1-git-send-email-avinashphilip@ti.com>
 <20120927143309.02614908.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120927143309.02614908.akpm@linux-foundation.org>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Philip, Avinash" <avinashphilip@ti.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, rpurdie@rpsys.net, broonie@opensource.wolfsonmicro.com, shawn.guo@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nsekhar@ti.com, gururaja.hebbar@ti.com
List-Id: devicetree@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 02:33:09PM -0700, Andrew Morton wrote:
> On Wed, 26 Sep 2012 20:17:07 +0530
> "Philip, Avinash" <avinashphilip@ti.com> wrote:
>=20
> > Some back lights perform poorly when driven by a PWM with a short
> > duty-cycle. For such devices, the low threshold can be used to specify a
> > lower bound for the duty-cycle and should be chosen to exclude the
> > problematic range.
> >=20
> > Add device tree probing support for lth_brightness putting
> > low-threshold-brightness as optional property.
> >=20
> > ...
> >
> > --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.t=
xt
> > +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.t=
xt
> > @@ -14,6 +14,15 @@ Required properties:
> >  Optional properties:
> >    - pwm-names: a list of names for the PWM devices specified in the
> >                 "pwms" property (see PWM binding[0])
> > +  - low-threshold-brightness: brightness threshold low level. Low thre=
shold
> > +    brightness set to value so that backlight present on low end of
> > +    brightness.
> > +    Some panels, backlight would absent if duty percentage of PWM wave=
 is less
> > +    than certain level (say 20%). By setting low-threshold-brightness =
to a
> > +    value above (percentage of brightness-levels max) 50 (20% of 255, =
if 255
> > +    is max). On setting low-threshold-brightness, range of brightness-=
levels
> > +    is calculated in a region of low-threshold-brightness to brightnes=
s-levels
> > +    max.
>=20
> hoo boy, that's hard to follow.  How does this look?
>=20
> --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt=
~pwm_backlight-add-device-tree-support-for-low-threshold-brightness-fix
> +++ a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> @@ -14,15 +14,15 @@ Required properties:
>  Optional properties:
>    - pwm-names: a list of names for the PWM devices specified in the
>                 "pwms" property (see PWM binding[0])
> -  - low-threshold-brightness: brightness threshold low level. Low thresh=
old
> -    brightness set to value so that backlight present on low end of
> -    brightness.
> -    Some panels, backlight would absent if duty percentage of PWM wave i=
s less
> -    than certain level (say 20%). By setting low-threshold-brightness to=
 a
> -    value above (percentage of brightness-levels max) 50 (20% of 255, if=
 255
> -    is max). On setting low-threshold-brightness, range of brightness-le=
vels
> -    is calculated in a region of low-threshold-brightness to brightness-=
levels
> -    max.
> +  - low-threshold-brightness: brightness threshold low level. Sets the l=
owest
> +    brightness value.
> +    On some panels the backlight misbehaves if the duty cycle percentage=
 of the
> +    PWM wave is less than a certain level (say 20%).  In this example th=
e user
> +    can set low-threshold-brightness to a value above 50 (ie, 20% of 255=
), thus
> +    preventing the PWM duty cycle from going too low.
> +    On setting low-threshold-brightness the range of brightness levels is
> +    calculated in the range low-threshold-brightness to the maximum valu=
e in
> +    brightness-levels, described above.
> =20
>  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
> =20
>=20
>=20
> Also, I'm wondering if we really needed a new property - couldn't one
> do this simply by setting brightness-levels to 50..255?

Yes. This was discussed in the thread that followed the posting of this
patch's v2. We've decided to drop it and go with brightness-levels only
for device tree data. Eventually all existing users should convert to
that as well so we can remove some of the cruft from the platform data
up.

Thierry

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQZTmMAAoJEN0jrNd/PrOhuxsQALsRNFfz8Bm/fSbycbr7ZJfu
jyCL1pQse6n0jxVYoIa3yK/+jZWIdaLReiuft4aYbcSKajNPEBgyNrxdccKDTebd
aq8a4QYpdTDSnYjX7uDQ1XOPxn3IAk9dB3398sKHccAJ+XnccVxKvmgdXeZyQnC0
9Qd4oH/vOWXYXeiB9dUKxZQpNsr9at95xvrqIhcOgyg13M3TG7L/0LJNID74CYjS
ZN/IFNm3AsWHdLsh4trdjU9bC/E8eNZJ5HiEi9nVm4EhyoYGJeAlRRt0R+M6EiUS
xucgzn9DeQjBODiXzlVsAOXIHwrglfoYiBzHNtAa7XsIeDxjc29cCKeBkGz+gtfH
u5cwGXlit2TWUsrUtPOEGrM887b41Xx2KW2xAWnGj/JfWaupH7SzinQZafAKpEpY
/M9+96jAQjnrnYvKE3bPlAOF6QkFpiRTRVDxtnq+wV8L+PyeZn+s/5hYE3YwloAq
g1lKzAIwWStvcAJT/WVoJ/1/SYA8lBBwqwE0YA7jaYHzVd0AuNvYrhwMXGz55mxt
/oSHOiVe7NWNUUE7jmkfFWizK8fngjxWMjth3pUV7sDeR1tqG0SxxQ0Wj+VKYy0J
BQHDkRyAzf4i1vedfw6TGeoHnhdEGICiqlSPHIknGWtciL5KUoq+/u08Q/PXGMNy
8Pzt/TOdpaK194HmlBo2
=lgr/
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
