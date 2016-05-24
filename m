From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 3/4] plugin: Transparently support old style syntax
Date: Tue, 24 May 2016 20:53:55 +1000
Message-ID: <20160524105355.GE17226@voom.fritz.box>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2016 at 07:58:28PM -0500, Rob Herring wrote:
> On Thu, May 5, 2016 at 2:48 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > The old style syntax for plugins is still out in the wild.
>=20
> In the wild where?
>=20
> IMO, too bad. That's the danger of deploying prototype code. Perhaps a
> tool to convert them would be better.

I tend to agree.  If converting to the new format was fiddly, I'd see
the point of including compatibility.  But AFAICT it's literally a
matter of removing a single semicolon.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRDLDAAoJEGw4ysog2bOSoREQAIjzEP+OEKZVRTkllj3oIKy9
zZvVDNFahufATu+qicy7Ly9gcd9Qe325qluMOZakMoT1BdJGLCkAnAxRb/HlCzCP
Y8lbmj9kiU27xrqWyqlDkMOgbry7BavZvrw1+nfdsYR/k2wgH8YMN4y/TeQiIhmF
8QMZlEmpYLA8fIZ3PIXtUAwXo4reAUNLDywSvdnBmKn4a3MMxNYatnc4hEZupnQa
lzNf058F+8RH3Fcs0jLMK078IxfLGFDB7GbGg5QAze6vjcj7YAlb0mny8+Wu/biY
MbJ6L0gOD/6UK4phDpM6+gUYGaHbRaR4yb0lKUYeEwg60uqNDQuigah+2DOUwdow
c2ZT63zAb5DE9oN/ONqRdTMAwvpXZkzx+Q5vIGOnZOzSYlumgwUDrfqDZYfJ4wW5
X7hwz/XG6sfS/ZgLfr+7BxmeDRwQGZUqYINjsifubeF2iXnf93pQswQm9aPMCmdG
7O4UaKI+P+oL2MzMWEv0HejxSt0n8poaKIp3UT7jpX84raLtdSg73225aHZOklwx
DaZYOxQ4H7L3At6zdMYpuOpyy5T17N1utgkxweaCGTM9Xe7cZ/J034W5KVd0UGli
NZASz5+3QeQdPAByIRFpPlKbV/n3QQaWm7mqVd1jbwd9QYuT+O29akwhnf1a2xUv
zhHGYTzq86SrNY/ilEie
=yzT0
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
