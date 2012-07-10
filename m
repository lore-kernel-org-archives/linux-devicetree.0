From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] pwm: add lpc32xx pwm support
Date: Tue, 10 Jul 2012 10:00:03 +0200
Message-ID: <20120710080003.GA30346@avionic-0098.adnet.avionic-design.de>
References: <1341862074-9240-1-git-send-email-aletes.xgr@gmail.com>
 <20120710064853.GA28840@avionic-0098.adnet.avionic-design.de>
 <4FFBE018.9060108@antcom.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FFBE018.9060108@antcom.de>
Sender: linux-doc-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: Alexandre Pereira da Silva <aletes.xgr@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 09:56:08AM +0200, Roland Stigge wrote:
> Hi,
>=20
> On 07/10/2012 08:48 AM, Thierry Reding wrote:
> >> --- /dev/null +++
> >> b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt @@ -0,0
> >> +1,12 @@ +LPC32XX PWM controller + +Required properties: +-
> >> compatible: should be "nxp,lpc3220-pwm"
> >=20
> > Does the compatible have to be lpc3220-pwm? Can't it be lpc32xx-pwm
> > to match the driver and binding names?
>=20
> When creating the other NXP LPC compatible strings, we agreed on
> taking the first LPC32xx chip, i.e., lpc3220, as prefix. (There are 4
> of them, -20, -30, -40, -50, most of them supporting things available
> in lpc3220.)
>=20
> So lpc3220-pwm looks good here.

I see, that makes sense.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP++EDAAoJEN0jrNd/PrOhXSEQAKQTTAAXEG/IVSInc3NfjW5d
O03+DhBpKzIgivtXSrRQmrKbxKRWZZom5bgUrN/sYy29x4qFelP0J8g+lgUrCDcz
0SG5CmshOuq5oAv8dFIHM0Mxj8lxINgy5Htvf8w/7eJFmK1HgojqbXk/Yg6R69K8
2ynmXitT419jHTC+clw1nS3gchwvpc3SSc5pyqxsJt8PuFQKfaSD0ZNwolFg135q
7YtozCT+AkLQ1pFnx0S7Z6mu2BbfnHsUDJRURCLVxVIxG8zduBUbBct6F84dGFRX
9soZNqXSXKWQzm7YTgZwW0uRC9b95rkMveJBrcvdygPvVZpeE1+0gHV9lwQY2GRB
/f8UrKElLbijW1Fvyz6TcPhESYPiW37tY1xZ+ulSdV48u7sMz18fb4ZOe/Jh2G7b
AKgm5mlkvJ0yzA7UeSK7jm+sTErqlD3o4VbQMToUA2qsSB9VvDByiVWFnST8arz6
gjZNR+5nToAtbEQw+dxcIx4pjyOWuKdSAAoNrnOfLTz16x96ablmnPAU2J5fwLW4
XzmaGykOgEJYveUqoDEmORtT0uF+FCajbnABBKJt4gcDLwW7oX98kTvL7Qv8hLke
cckiah+2EzuiT0LaaHD01Ih+Pg5gZEwZbAFgodaWkNAzenj5za1bGihQHaCCWnat
JaGg2TP6H8btUsd8Rt4t
=ZuHh
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
