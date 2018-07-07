Return-Path: <sre@kernel.org>
Date: Sat, 7 Jul 2018 22:24:08 +0200
From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v5 5/6] dt-bindings: power: reset: qcom: Add resin binding
Message-ID: <20180707202408.jmy5cz6qe6xjsb2t@earth.universe>
References: <20180628150850.15358-1-vkoul@kernel.org>
 <20180628150850.15358-6-vkoul@kernel.org>
 <20180707051414.GW22377@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xxlfnjwfvpbhpa6x"
Content-Disposition: inline
In-Reply-To: <20180707051414.GW22377@vkoul-mobl>
To: Vinod <vkoul@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--xxlfnjwfvpbhpa6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Sat, Jul 07, 2018 at 10:44:14AM +0530, Vinod wrote:
> On 28-06-18, 20:38, Vinod Koul wrote:
> > Resin is similar to pwrkey, add the description and example
> > for resin bindings
>=20
> I think this should go thru your tree as well

Right. I just queued this one with Rob's Reviewed-by.

-- Sebastian

> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/input/qcom,pm8941-pwrkey.txt       |  1 +
> >  Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 14 ++++++=
++++++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey=
=2Etxt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> > index bf719396eadd..34ab5763f494 100644
> > --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> > +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> > @@ -7,6 +7,7 @@ PROPERTIES
> >  	Value type: <string>
> >  	Definition: must be one of:
> >  		    "qcom,pm8941-pwrkey"
> > +		    "qcom,pm8941-resin"
> > =20
> >  - reg:
> >  	Usage: required
> > diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt=
 b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> > index f32cdd358267..651491bb63b7 100644
> > --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> > +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> > @@ -1,9 +1,9 @@
> >  Qualcomm PON Device
> > =20
> >  The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
> > -along with the Android reboot-mode.
> > +and resin along with the Android reboot-mode.
> > =20
> > -This DT node has pwrkey as sub node.
> > +This DT node has pwrkey and resin as sub nodes.
> > =20
> >  Required Properties:
> >  -compatible: "qcom,pm8916-pon"
> > @@ -12,6 +12,8 @@ Required Properties:
> >  Optional subnode:
> >  -pwrkey: Specifies the subnode pwrkey and should follow the
> >   qcom,pm8941-pwrkey.txt description.
> > +-resin: Specifies the subnode resin and should follow the
> > + qcom,pm8xxx-pwrkey.txt description.
> > =20
> >  The rest of the properties should follow the generic reboot-mode descr=
iption
> >  found in reboot-mode.txt
> > @@ -32,4 +34,12 @@ Example:
> >  			bias-pull-up;
> >  			linux,code =3D <KEY_POWER>;
> >  		};
> > +
> > +		resin {
> > +			compatible =3D "qcom,pm8941-resin";
> > +			interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> > +			debounce =3D <15625>;
> > +			bias-pull-up;
> > +			linux,code =3D <KEY_VOLUMEDOWN>;
> > +		};
> >  	};
> > --=20
> > 2.14.4
>=20
> --=20
> ~Vinod

--xxlfnjwfvpbhpa6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAltBIWUACgkQ2O7X88g7
+prELw/8Dvq17my6HrbP72OHowQ+Zz4/ZEhN0G9qo6tYwbFpuvHyZWlyzUYG+g5J
Pl46pElx2NLT6KxZeSiz35VsaPNuZREuUt9XkRPa4ZinFVfB7moOsYAURNLkzZl/
BTTbTM4fY4BRO9YJW7BUZKrXumzS1mhVfkYiZj6+9ePb0psA+boAgv3zCVsHpR3D
EIT0TRVVDvnUmnVFIIODeo6n5hD9TKUci8eu46NkU1mQMOa88/uxvzyMV4unZrvo
RuL0muIysuj3NhvdxcibGZ1F/4wYHZfNInD0f/s/jRw+7/+tjWUKSQzA4sy09mDz
f7K9cFsKSHSvvqldxqcCbQ5GrlxKRz+iuGw+voyRHLiIhmVEoW/U9pSSye4aww9x
/7mlVJJSE0vSPsyt1J7CiVh0/kdflBWUHlOoDs1YuaJFAO22MYzgCgPaFN48CY2k
Dhls+hCWLA8lECNGna/8vpXgTjc8sty1bhYa0thdIoUQzZvacKsZnuNtYkGTL8eo
X3MXEPSearkdLa+hMThwkT72xNvaEOOaALMP4M7Xy46xjLDq3B0tI/oO4CBhWSf2
b5onqiGCaJcp640hMw0qN6Dy+Xu+xlkwqtu4OoFMOVWXHV9HLGCROcZBDlr8BllN
6lDaYGazGTgvS9IV2ACw9h8kmLZ1BwkR0HY1u88urBV4MM/uG2w=
=QMGR
-----END PGP SIGNATURE-----

--xxlfnjwfvpbhpa6x--
