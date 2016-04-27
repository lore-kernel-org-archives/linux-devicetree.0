From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH V10 1/6] mfd: add device-tree binding doc for PMIC
 max77620/max20024
Date: Wed, 27 Apr 2016 17:04:44 +0200
Message-ID: <20160427150443.GC4176@ulmo.ba.sec>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-2-git-send-email-ldewangan@nvidia.com>
 <20160427124959.GC4892@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160427124959.GC4892@dell>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com
List-Id: devicetree@vger.kernel.org

--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 01:49:59PM +0100, Lee Jones wrote:
> On Wed, 30 Mar 2016, Laxman Dewangan wrote:
>=20
> > The MAXIM PMIC MAX77620 and MAX20024 are power management IC
> > which supports RTC, GPIO, DCDC/LDO regulators, interrupt,
> > watchdog etc.
> >=20
> > Add DT binding document for the different functionality of
> > this device.
> >=20
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> >=20
> > ---
> > Changes from V1:
> > - Added units in some of properties.
> > - Change the boolean property to tristate type and detail some of
> >   properties.
> >=20
> > Change from V2:
> > - added unit in period related dt property.
> >=20
> > Change from V3: None
> > - Added Rob's ack.
> >=20
> > Changes from V4:
> > - A- Provide more details in the dt binding doc.
> > - Take care of fps nodes.
> > - Split the submodule's DT binding doc on respective folder.
> > - Drop the battery charger and low battery binding and related code as
> >   it need to go on power driver.
> >=20
> > Change from V5:
> > - None
> >=20
> > Change from V6:
> > -start the patch title with mfd instead of DT: mfd:
> >=20
> > Change from V7:
> > - Better describe the FPS to make more clear.
> >=20
> > Changes from V8:
> > None
> >=20
> > Changes from V9:
> > None
> >=20
> >  Documentation/devicetree/bindings/mfd/max77620.txt | 143 +++++++++++++=
++++++++
> >  include/dt-bindings/mfd/max77620.h                 |  39 ++++++
> >  2 files changed, 182 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
> >  create mode 100644 include/dt-bindings/mfd/max77620.h
>=20
> For my own reference:
>=20
>   Acked-by: Lee Jones <lee.jones@linaro.org>

Hi Lee,

I'm confused now. Were you going to pick this up, or are you waiting for
someone else to do it?

Thierry

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXINULAAoJEN0jrNd/PrOh1WsP/3vEotfvBXQtacOPhsy0qrlM
+/zYqDQfzwFx0Sy3ZlAh+BNuG0zc76ljwxB8rXfQXVsGLZWmIibuGksXeBAuGuaq
MQay94ksBHe/NmccWMXVA2DqUXgE1nv3A37suqSP/4YEX2pzf5PzYtwT5zX/zWeB
lHL9h+AOyL798ifY3GjeldyJfjcFlB05c5pfoFpswEdfas8I9bW7ZS86vzgyO414
JUpgLLazT84yD6f6mN0MvsCWfpdpOMgM2raA1W0TkEKqm10PG/SAuvl+mLER4KPW
0wdRPr1bMZlbu+S3tI03FgpkTicy4n8JLokpnkDC0ks8qKKht06+iNsRphSoPXI/
jrFuWCT/449vpSkv/25orQfzOubLcZJteTZnSxxXq/O/KI5+NbmF55DFILQbzBL2
NEJg+rppr/td1ACDayHMvQY1SOdY3pRO4Po+sohc4WEuA4RQv9tbeitMWh5PQhNg
1PfJIKb2tm0TNUOX5T6/myKMV4CKvHvgwUlvZQIT2Oh1pZv2/XTnQ7DnfrUAzwER
Ri2v1IzU+WD29TvRncAp+0I8z72bAEu20sMVpkjl9Ab0YE1/zrRxrvBdlYqL3bo/
SH44fKYXk/bt1lN4oRixq1M2+jAGdAqrqMxIkbQ33/z4pxxWObHiBcWu0uqnf2gx
MJnWf0rmuJf6JkNTWJrB
=Lk/M
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
