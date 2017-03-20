From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Mon, 20 Mar 2017 12:06:15 +0000
Message-ID: <20170320120615.mh3fmcr2cv4dvegf@sirena.org.uk>
References: <20170308200246.126331-1-mka@chromium.org>
 <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
 <20170309194054.GA15095@google.com>
 <20170317211547.22jrqud5np4ve2jk@sirena.org.uk>
 <20170318000330.GC50582@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kaxvcakod4bjzd7b"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170318000330.GC50582@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org


--kaxvcakod4bjzd7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 05:03:30PM -0700, Matthias Kaehlcke wrote:

> In principle I totally agree with you that consumers should be able
> to enumerate the supported voltages with the existing functions. And
> they can, as long as they already know (or assume) that the regulator
> they are using actually has discrete steps, otherwise they might get
> unexpected results.

Given the limits of number representation continuous regulators also
have discrete steps, they just have a lot of them (but so do some
regulators we currently say aren't continuous so...).

> You are right that my case is very specialist, however I think it is
> a general problem that a consumer can't know whether the results of
> _list_voltage(), etc correspond to the regulator itself or to its
> supplies. E.g. a consumer might have a continuous reg which is
> supplied by a discrete reg, in this case _list_voltage() would return
> the steps of the supply reg, which is probably not what most consumers
> expect.

No, this is doesn't make much sense!  Why should we be reporting
properties of the parent regulator when the child regulator is
regulating away all visibility of those properties?

> > > Please see my explication above on why the vctrl driver needs to know
> > > this.

> > I'm seeing nothing in the above that addresses my question, you don't
> > even seem to have mentioned supplies. =20

> Sorry, I really didn't try to evade your question. Does it make more
> sense with the example above?

No, not at all.

> > What we should be doing for continuous regulators is allowing people to
> > list the supported voltages as they would for other regulators.

> In the overall regulator context this may make sense, at this point I
> don't really have enough background on the subsystem to have an
> informed opinion.

> From the vctrl perspective I wouldn't be overly happy, since it
> wouldn't allow to distinguish between continuous and discrete
> supplies, and I still think that handling discrete supplies
> differently is simpler/more efficient. This doesn't mean I argue
> against your proposal if it is deemed the right thing from a subsystem
> perspective.

If it helps think of a continuous regulator as a discrete regulator with
a base voltage of 0 and steps of 1uV.

--kaxvcakod4bjzd7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljPxbcACgkQJNaLcl1U
h9AvIQf+JRN+QVQNUlJ/a78bB84d+ebctr/hVcfz7U8WsXGG29UfhXwaMiFFZxac
hXpjUtLDrEwxE2rBRPNpOKWsoj2c5o4/9nOGy1hgOCTCJE+o09ebIxt+AMsAjqQ6
hcNT7plLqEJCssT/yY3g2KhhWRHL6ZO5n//UjH5Ib9Gpk4euMaK1Klg/VfM3JRec
GFcX5n6OGqTuJD0T6Uxrny7TCbsWToRNfy4BZ6VUK6meLUfpN2EYWtOzjuL14KgQ
aIMkIedmGkUCt27n2i7CRRlhT7gYPIMKkoZW8RXNM/1Hu1PryafW34TxkWbUVsy/
wMtK9bMhuZ2rXpg0fhBJ2kd78FONAw==
=bYEY
-----END PGP SIGNATURE-----

--kaxvcakod4bjzd7b--
