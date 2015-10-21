From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 21 Oct 2015 17:13:39 +0100
Message-ID: <20151021161339.GN32054@sirena.org.uk>
References: <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
 <20151020113128.GN31804@x1>
 <56264990.8050501@ti.com>
 <20151021084633.GB3270@x1>
 <20151021102952.GJ32054@sirena.org.uk>
 <20151021111832.GC3270@x1>
 <20151021121409.GA8232@sirena.org.uk>
 <20151021152659.GF3270@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y8IEA2AKDLXNckrV"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151021152659.GF3270@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Y8IEA2AKDLXNckrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2015 at 04:26:59PM +0100, Lee Jones wrote:
> On Wed, 21 Oct 2015, Mark Brown wrote:
> > On Wed, Oct 21, 2015 at 12:18:32PM +0100, Lee Jones wrote:

> > > I didn't say it hasn't been done before, just that I didn't like it
> > > for the aforementioned reasons.  I can also find 1000's of compatible
> > > strings which do append "-<device_type>", so it's not exactly an
> > > unheard of practice.

> > It's a pretty substantial change in the way we make compatible strings
> > that we probably want to discuss more widely if we want to adopt it -
> > we've not been using that idiom and it's pretty surprising.  I'm not
> > really sure it help much and we do already have the pre-@ noise words
> > for this purpose (as well as comments in the DT).

> I'm not *that* fussed about it to justify starting-up wider community
> discussions.

> My only point is that:

>   compatible = "<vendor>,udw9283";

> ... is meaningless gibberish and I think it'd be better to be more
> forthcoming which prevents having to dig around in DTS files for the
> node name/label for true device/type identification.

What I suspect most people actually do here is google the part name if
it's not obvious from context (presumably people with a compatible
string only are either looking at the driver or some DT source
instantiating it).

--Y8IEA2AKDLXNckrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWJ7myAAoJECTWi3JdVIfQQNIIAILVDGXE7QSIwF98dmirjiDY
+StoA/fUn7qFtoTMxCubnBftujj8hcFFCGvtXRsb/ze1Pp4xWwRljul9Ejqtbr7D
4xAnAAp0k2OMacH85eSRgqbHwGFNXF47zulphX1dcbZAMg+zRIpyy7aYKqXNu4z7
rtH38j1rfu7pr7oUQcbne/11uOOLblm5TxO/R83Wdwe0KmVIqo5dxO7s1HS9J1+m
B9Kq2n/IxKXR52BoHY0l+l5Q+Hs5EjayIJn3RzJ1wURGWHulGOMsBEXnCXdsnYrn
Hxlb4AXFltlSigrMgQ/3kC/Q25hqEcTr0qM4oRPoE8mSS47EvhynKhfkM/BgqXo=
=H09d
-----END PGP SIGNATURE-----

--Y8IEA2AKDLXNckrV--
