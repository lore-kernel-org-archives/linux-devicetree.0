From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dts: sun8i-h3: add UART1-3 to Orange Pi Plus
Date: Mon, 5 Sep 2016 21:31:11 +0200
Message-ID: <20160905193111.GC4728@lukather>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
 <20160902070425.GB6313@lukather>
 <20160903120932.GA6289@carbon.kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160903120932.GA6289-fYCmWnekAjb2kgGZbG0gbwQM7Ykfvd1G@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wens-jdAy2FN1RRM@public.gmane.org, Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jorik,

On Sat, Sep 03, 2016 at 02:09:32PM +0200, Jorik Jonker wrote:
> On Fri, Sep 02, 2016 at 09:04:25AM +0200, Maxime Ripard wrote:
> >Unfortunately, these pins can be used for other purposes as well, so
> >we cannot make force that decision down to our users.
>=20
> Yes, but since the associated peripheral is disabled, the users are free =
to
> configure other functions/peripherals, right? I mean something like this =
in
> pseudo-DT:
>=20
> /soc/pio: pinctrl@01c20800/uart1_pins:
>   allwinner,pins =3D "PG6, PG7";
> /soc/pio: pinctrl@01c20800/foo0_pins:
>   allwinner,pins =3D "PG6, PG7";
>   ..
> /soc/uart1: serial@serial@01c28400:
>   pinctrl-0 =3D <&uart1_pins>;
>   status =3D "disabled";
> /soc/bar:
>   pinctrl-0 =3D <&uart1_pins>;
>   status =3D "disabled";
>=20
> Assuming Linux/DT allows this, this would force nothing, only offer choice
> and ease of use.

Hmm, sorry, I went over your patches too quickly...

That's a great compromise I think. Chen-Yu, any opinion on this?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzcf/AAoJEBx+YmzsjxAgbrUP/1MbqtAoXlvx2dOD9CIJER1h
cXj+uANuShAos5xOckjrIQo5a29Yx3hrjUueXROYBfpOVY4y9EL0wo3lDFppKir2
wrdvx6j10jKJLmxK3xGwd486k0taZr2xBxfw2J4afnloSnWDrXDMgRwbkRqhJICO
773VXnLk6+/EZtMaUoUfoEZZUSgnamB3TDErqU2gJEyyv7lB9So0Haz1GERsTj0M
DxXT1rVB6wQa08c4gGA5ODGgoxsTRD7UBhNxxPBwOMvccterqN3Ggt5tt6F8dwGX
5oZj9Qwn3geWet+ucjv5Gw/4tZaIyomhcGMj51KMTH6jIWAAq3Pt/Rit7Qwx/0gP
cvl8v6lQ3cyMm2lSc1C+NGMBlDU/6oDQ5ko5R0X9mn8S37Cdg1F4NEYhtrb3aM+q
yuD5CrvOuajYICaLrakPW6IuOF8GfL3U2AKKcXG+QoiPXap5/g8YP/qqkl6TYYCJ
IYU5L+3ELuBOCPo8N4ppd0p885tZT5Vm7JMzTMDrVLHk3so9ByaXxJQHw4yPrjAy
paOFl+LXZMcn52txdfxj4WmQhb7ms49W2QgFvRzLoo3mGfC4jR6DA9WR8TZ0JgmF
Hj1FmtkjcTElruJTEQtbPkygDxt0uMZQ/fg17m1acEA5m8jDsFeDD/dZTQqMJc5T
sc795W53QFS8y7reJ4QZ
=3eDq
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
