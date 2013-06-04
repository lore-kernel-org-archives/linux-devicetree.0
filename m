From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Tue, 4 Jun 2013 13:59:27 +0200
Message-ID: <20130604115927.GJ7626@kw.sim.vm.gnt>
References: <51ADBEE0.5040500@keymile.com> <51ADC2C2.6010106@gmail.com>
 <20130604104302.GX3803@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0928623282162275155=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130604104302.GX3803@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>, "Longchamp,
 Valentin" <Valentin.Longchamp@keymile.com>, devicetree-discuss@lists.ozlabs.org, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Gerlando Falauto <gerlando.falauto@keymile.com>, Simon Guinot <simon@sequanux.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============0928623282162275155==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HmK7y6O+lKZIGkr"
Content-Disposition: inline


--+HmK7y6O+lKZIGkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2013 at 06:43:02AM -0400, Jason Cooper wrote:
> On Tue, Jun 04, 2013 at 12:34:42PM +0200, Sebastian Hesselbarth wrote:
> > On 06/04/13 12:18, Gerlando Falauto wrote:
> > >I noticed how most of the DT-aware board-setup files only have a single
> > ><board>_init() function, calling kirkwood_ge00_init() with a struct
> > >mv643xx_eth_platform_data as a single argument.
> > >
> > >I was wondering -- is there a reason why we cannot remove all this
> > >board-specific code and move all this to the DT?
> >=20
> > Gerlando,
> >=20
> > DT for mv643xx_eth is on the way (https://lkml.org/lkml/2013/5/29/527).
> > We wait for the driver to surface to relax branch dependencies and then
> > move all DT Orion SoCs to it.
> >=20
> > > I would really love to have all our boards under a single
> > > CONFIG_<FAMILY>_DT and a single compatible string, with all the
> > > differences within the DTs itself -- no more #ifdef CONFIG_<BOARD>,
> > > no more of_machine_is_compatible("boardXXX").
> >=20
> > All those will happen if there is DT support for mv643xx_eth which
> > is the only driver left without DT and board dependencies. But there
> > will be no CONFIG_LACIE_DT or whatever, but just CONFIG_KIRKWOOD_DT
> > and board dependent stuff described in the corresponding dts.
>=20
> Gerlando,
>=20
> Yes, the mess you describe is temporary.  Those board files used to have
> a lot more code in them, legacy init of partitions, MPP, LEDs, etc.  As
> we have converted drivers, they have gotten smaller and smaller.
>=20
> Now, with Sebastian's hard work, we'll finally be able to remove them
> and kirkwood will be completely DT.  We're very excited about this. :)
>=20
> Next, we'll move the Marvell DT boards over to mach-mvebu/ and only
> legacy boards in -kirkwood/, -orion5x/, -dove/, and -mv78xx0/ will
> remain.  After a few releases we will deprecate any legacy boards which
> haven't been converted to DT.

Hi Jason,

While I have obviously planed to convert all the LaCie boards to DT,
I think that removing the legacy support so quickly is a little bit
harsh.

IMHO, it could be nice to wait the end-of-life for all this products
before removing their support.

Regards,

Simon

>=20
> thx,
>=20
> Jason.
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--+HmK7y6O+lKZIGkr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGt1p8ACgkQgtp0PDeOcDopbACeOniGOrebL6amhWz6JG5TJLIs
fscAnjuN3ItvZ7qTGaemE6pmr2rLxDTq
=4TJq
-----END PGP SIGNATURE-----

--+HmK7y6O+lKZIGkr--


--===============0928623282162275155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0928623282162275155==--
