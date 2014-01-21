From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/1] of/irq: create interrupts-extended-2 property
Date: Tue, 21 Jan 2014 19:57:50 +1100
Message-ID: <20140121085750.GC21650@voom.redhat.com>
References: <1389786445-10598-1-git-send-email-plagnioj@jcrosoft.com>
 <20140115161224.GH25824@e106331-lin.cambridge.arm.com>
 <20140120224742.EC905C40B12@trevor.secretlab.ca>
 <CAOesGMjrLs9eEPurjUpOfgyexnc__FJkRYmAR84_f7C15HH07Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjrLs9eEPurjUpOfgyexnc__FJkRYmAR84_f7C15HH07Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2014 at 05:03:23PM -0800, Olof Johansson wrote:
> On Mon, Jan 20, 2014 at 2:47 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> > On Wed, 15 Jan 2014 16:12:24 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>=
 wrote:
> >> >
> >> > Another, more invasive option would be extend the dts syntax and tea=
ch
> >> > dtc to handle property appending. Then the soc dts could stay as it =
is,
> >> > and the board dts could have something like:
> >> >
> >> >     /append-property/ interrupts =3D <&intc1 6 1>;
> >> >     /append-property/ interrupt-names =3D "board-specific-irq";
> >> >
> >> > Both these options solve the issue at the source, are general to oth=
er
> >> > properties, and allow more than one level of hierarchy (the proposed
> >> > interrupts-extended-2 only allows one level).
> >>
> >> I've just had a go at implementing the append-property mechanism above
> >> in dtc, and it was far easier than I expected (patch below).
> >>
> >> Does anyone have any issues with the /append-property/ idea?
> >
> > I think that is reasonable.
>=20
>=20
> The main problem with this (same for clocks) is if you need to append
> something with a name when the original didn't have any.
>=20
> Reordering entries might not work for interrupts, since the bindings
> might have requirements on order.
>=20
> I'm not aware of a good solution for this. Suggestions welcome.

So, in principle my preferred way to handle things like this would be
to add richer expression support, including a token for "previous
value" when overlaying.

But although I've recently had another look at it, that's still a ways
off, so I wouldn't object to another approach as a stopgap, as long as
its not too hideous.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bAmEntskrkuBymla
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJS3jaOAAoJEGw4ysog2bOSTh0QAKc2t097hVPI6dOIr+FHD6Tx
cXznsdBUpIqO7YEGBQkVQjwvn7eBeLJQPgACqU43HMU0h8uHCrPBLkSH4JNjsMrw
4Ws9scilqrAN/9Pyu78b95if5eJad9qigfJXAo28ClYBtkoGyBNIwsh3NyWcKiGK
Sh7zlYbEpBJCHTRlrwk+qMDT8HdrxN8zbLIQELaDHQaiyoA411wg0MNyyFiVJQyv
5obOzugt9lrvIg5JDhgNh48whMPkb0AR9Mtgp6qmvbccns06oLuS5Z7j+v0JAhTB
e2EKFxN1N8d/3bspAC1O9sJCU9TSNq304saLofiS7FIyPeX1OkyI1OX3KcwR+61L
d22yZwj4GEbrfERbnFbdKuSWKg04qrHjmcxLscLka536na2OOq5TE+SqSgxDJY8w
nFqu4SUIqCglZ3riP7hv/fuA4F9pzDbnA0rEqfa1uQ/Dzcbw0kjD84ayOfhx24FP
QKRG3nO+HiZd2G7XNhHN4RIUIkreHI6DYUWOfAlieNgButj3tG5az4dgNq46nach
+rFf8R2lWmN9sG2cQSAI3Ws7gpiK3qitdBVnY6IFaPlZHWl9drLSn19+Nfpx2NkX
hU6jviTRdXF/S6hHpIW9EgN79PoIUcgt6Vanxy7OOH+ERwE5Lk/jaj/kftK085Jd
m58DxJOTbx+rFCZ7oSvO
=KSpP
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
