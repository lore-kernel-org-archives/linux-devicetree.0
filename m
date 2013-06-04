From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Tue, 4 Jun 2013 14:18:15 +0200
Message-ID: <20130604121815.GK7626@kw.sim.vm.gnt>
References: <51ADBEE0.5040500@keymile.com> <51ADC2C2.6010106@gmail.com>
 <20130604104302.GX3803@titan.lakedaemon.net>
 <20130604115927.GJ7626@kw.sim.vm.gnt>
 <20130604120500.GZ3803@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7348848544532550622=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130604120500.GZ3803@titan.lakedaemon.net>
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


--===============7348848544532550622==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KIbT1ud6duwZIwNL"
Content-Disposition: inline


--KIbT1ud6duwZIwNL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2013 at 08:05:00AM -0400, Jason Cooper wrote:
> On Tue, Jun 04, 2013 at 01:59:27PM +0200, Simon Guinot wrote:
> > On Tue, Jun 04, 2013 at 06:43:02AM -0400, Jason Cooper wrote:
> > > On Tue, Jun 04, 2013 at 12:34:42PM +0200, Sebastian Hesselbarth wrote:
> > > > On 06/04/13 12:18, Gerlando Falauto wrote:
> > > > >I noticed how most of the DT-aware board-setup files only have a s=
ingle
> > > > ><board>_init() function, calling kirkwood_ge00_init() with a struct
> > > > >mv643xx_eth_platform_data as a single argument.
> > > > >
> > > > >I was wondering -- is there a reason why we cannot remove all this
> > > > >board-specific code and move all this to the DT?
> > > >=20
> > > > Gerlando,
> > > >=20
> > > > DT for mv643xx_eth is on the way (https://lkml.org/lkml/2013/5/29/5=
27).
> > > > We wait for the driver to surface to relax branch dependencies and =
then
> > > > move all DT Orion SoCs to it.
> > > >=20
> > > > > I would really love to have all our boards under a single
> > > > > CONFIG_<FAMILY>_DT and a single compatible string, with all the
> > > > > differences within the DTs itself -- no more #ifdef CONFIG_<BOARD=
>,
> > > > > no more of_machine_is_compatible("boardXXX").
> > > >=20
> > > > All those will happen if there is DT support for mv643xx_eth which
> > > > is the only driver left without DT and board dependencies. But there
> > > > will be no CONFIG_LACIE_DT or whatever, but just CONFIG_KIRKWOOD_DT
> > > > and board dependent stuff described in the corresponding dts.
> > >=20
> > > Gerlando,
> > >=20
> > > Yes, the mess you describe is temporary.  Those board files used to h=
ave
> > > a lot more code in them, legacy init of partitions, MPP, LEDs, etc.  =
As
> > > we have converted drivers, they have gotten smaller and smaller.
> > >=20
> > > Now, with Sebastian's hard work, we'll finally be able to remove them
> > > and kirkwood will be completely DT.  We're very excited about this. :)
> > >=20
> > > Next, we'll move the Marvell DT boards over to mach-mvebu/ and only
> > > legacy boards in -kirkwood/, -orion5x/, -dove/, and -mv78xx0/ will
> > > remain.  After a few releases we will deprecate any legacy boards whi=
ch
> > > haven't been converted to DT.
> >=20
> > Hi Jason,
> >=20
> > While I have obviously planed to convert all the LaCie boards to DT,
> > I think that removing the legacy support so quickly is a little bit
> > harsh.
>=20
> Yeah, my wording might not have been the best.  See below.
>=20
> > IMHO, it could be nice to wait the end-of-life for all this products
> > before removing their support.
>=20
> I'd prefer to convert them to DT, then keep them as long as folks are
> interested in them.  If no one cares about a board, and no one wants to
> convert it to DT or test the conversion, why keep it around?
>=20
> Let me clarify, by 'deprecate them' I meant *begin* the process of
> deprecating them.  eg marking them as deprecated for around three
> releases or so.

OK. Thanks for the clarifications.

Simon

--KIbT1ud6duwZIwNL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGt2wcACgkQgtp0PDeOcDo3oACdHF9dZYqrkQHw8tJmRJWDDcA4
HGkAn1Gf3qzgHkREcojWCxEs9ip0S9pH
=LVCm
-----END PGP SIGNATURE-----

--KIbT1ud6duwZIwNL--


--===============7348848544532550622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7348848544532550622==--
