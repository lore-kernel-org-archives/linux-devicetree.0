From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Date: Wed, 25 Sep 2019 15:14:28 +0200
Message-ID: <20190925131428.GA207379@aptenodytes>
References: <20190925084932.147971-1-paul.kocialkowski@bootlin.com>
 <20190925084932.147971-2-paul.kocialkowski@bootlin.com>
 <CAL_JsqJY+d9frxuxspvo2SQ=vpWMCAWZfMODA-jm_rKu1GOEaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJY+d9frxuxspvo2SQ=vpWMCAWZfMODA-jm_rKu1GOEaw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 25 Sep 19, 08:07, Rob Herring wrote:
> On Wed, Sep 25, 2019 at 3:49 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../display/xylon,logicvc-display.yaml        | 314 ++++++++++++++++++
> >  1 file changed, 314 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,log=
icvc-display.yaml
>=20
> Error: Documentation/devicetree/bindings/display/xylon,logicvc-display.ex=
ample.dts:17.1-6
> syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:321: recipe for target
> 'Documentation/devicetree/bindings/display/xylon,logicvc-display.example.=
dt.yaml'
> failed
> make[1]: *** [Documentation/devicetree/bindings/display/xylon,logicvc-dis=
play.example.dt.yaml]
> Error 1
> Makefile:1282: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2

Okay I hadn't realized the example is extracted and tested, so I included .=
=2E.
in there. My mistake, sorry.

I did the testing with the dt-schema tools directly, on an out-of-tree dts,
not in-kernel-tree.

Will fix with v3 then.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2LaDQACgkQ3cLmz3+f
v9GDfAf7BGkW/MJkbSMHAOH7JJPvjMO6DZKdGlxsc7aseFvyex7joJAYutxV5TeF
zo5GZKigVItIuoKdkctHGdFJ/W/13C90SOMEx8NntTFv4Aan00ZF2/PPypkCQUKO
bPbIDnRC6lvdCb5L5ZP+y7d08yrq3Vbhoyz37LUyXahd3eqYS2EwS4m43jtEKsz2
lSTQ2BGmRth/wDJrFVoq1H40+JRX6GsePcmhOuXmKiAx9a2LErnbhgbWKo+48var
m1BxAMtecR4lFp7qWE7L1OdKGy4L3VlzszEcUEMtdb/zPWy8o6pJMaySL5aQtyjI
Ps/os9b9Kh316ykRUf5mkAuHk5izdg==
=9Fif
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
