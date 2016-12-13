From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 6/6] mfd: dt: Move syscon bindings to syscon
 subdirectory
Date: Tue, 13 Dec 2016 22:35:34 +1030
Message-ID: <1481630734.3112.40.camel@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
 <20161206025321.1792-7-andrew@aj.id.au>
 <20161212153911.drhczoagyyhu7jm4@rob-hp-laptop>
 <1481604793.3112.32.camel@aj.id.au> <20161213110710.GV3625@dell.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8179148162186615951=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213110710.GV3625@dell.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Corey Minyard <minyard@acm.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org


--===============8179148162186615951==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-76zxxbvG4YgxPDrmCnxT"


--=-76zxxbvG4YgxPDrmCnxT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-12-13 at 11:07 +0000, Lee Jones wrote:
> On Tue, 13 Dec 2016, Andrew Jeffery wrote:
>=20
> > On Mon, 2016-12-12 at 09:39 -0600, Rob Herring wrote:
> > > On Tue, Dec 06, 2016 at 01:53:21PM +1100, Andrew Jeffery wrote:
> > > > The use of syscons is growing, lets collate them in their own part =
of
> > > > the bindings tree.
> > > >=20
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > >=20
> > > > ---
> > > > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/aspeed-s=
cu.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > > > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel-gp=
br.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > > > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel-ma=
trix.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > > > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/atmel-sm=
c.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > > > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/qcom,tcs=
r.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > > > =C2=A0Documentation/devicetree/bindings/mfd/{ =3D> syscon}/syscon.t=
xt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 0
> > > > =C2=A0.../devicetree/bindings/mfd/{ =3D> syscon}/ti-keystone-devctr=
l.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0
> > > > =C2=A07 files changed, 0 insertions(+), 0 deletions(-)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/a=
speed-scu.txt (100%)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/a=
tmel-gpbr.txt (100%)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/a=
tmel-matrix.txt (100%)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/a=
tmel-smc.txt (100%)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/q=
com,tcsr.txt (100%)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/s=
yscon.txt (100%)
> > > > =C2=A0rename Documentation/devicetree/bindings/mfd/{ =3D> syscon}/t=
i-keystone-devctrl.txt (100%)
> > >=20
> > > I'm not so sure this is the right direction. syscon usage is pretty m=
uch=C2=A0
> > > spread throughout the tree.
> >=20
> > This patch was created based on my interpretation of Lee's feedback
> > here:
> >=20
> > https://lkml.org/lkml/2016/11/18/650
> >=20
> > Lee's next email in the chain poked Arnd for an opinion, but Arnd
> > didn't reply.
> >=20
> > I don't mind. I moved these bindings separately so we could just drop
> > the patch if there was push-back. If we drop the whole idea I'll need
> > to apply a small fix to patch 5/6 to avoid creating the syscon
> > subdirectory.
>=20
> The sub-directory is a good idea for drivers who are *solely* syscon
> based.
>=20

Yes, I wasn't saying otherwise, just commenting on my motivation and
approach.

As far as I can tell all of the bindings I move here describe solely
syscon-based devices.

Cheers,

Andrew
--=-76zxxbvG4YgxPDrmCnxT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT+QPAAoJEJ0dnzgO5LT5QIoP+QG/NgKZdolCLssq0ENTsdXf
nTXPGxU9bfT9QKVHP8bj52pD6KbiHLMvDXy/vS0y9h3lsyOljdOF/Gmy/usoc2Pg
nl5baoyeLPCdhKEb/K+GcxTTYz063IvOLliEyViEX3RQrQ9p4COUFvdD2LJEJC4e
Og/D+MnhuoXuKPR+jjwtQIvCdOsFs43h8V8Ej3XkHniytWzEzNiKRY2oPkJaVgS1
2GwrC1HHhh1P9JTQazMRekfOXNCRKIBLOjj5Oz8pQjtIijGhOHfCOiqC9GLoH24F
XHkNGW/pJ6eEihx9hJrFbJ0TrfGuao39k1hJV0144Ia03K+jPVsbfvlqW63RS28I
9B4S98o+lpeqxubRocjcUgkHSH3qqlF9vyG1ObotBvLclkRqyimX0I2RzCFwggKg
9yztc4YOwexdBB0e/DEuWFA+m6aoDPKvzkYhZMVdADtSTT9X1HpYWrpMM2+KtPPG
GgZB185pdlEIOySA6MOe8I66XSIFVNhKH7LfUv/UQ9P3N1pS7Ux9YIeP8JkS6EHN
e46P8HG1yXUK8aafXfK4A5KvVwQkTNf2Tq1ZEZ/WAq2tcupBBXzHVIsaOoTsxFYf
cqkB5ThlZapQtgWrfabijMDWi4eiJ6VKnl/u3iKPQD2ZjmoLdFcGinhD8zqVlYaD
jVAbCMrip08oQTley2sx
=z3TL
-----END PGP SIGNATURE-----

--=-76zxxbvG4YgxPDrmCnxT--



--===============8179148162186615951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8179148162186615951==--
