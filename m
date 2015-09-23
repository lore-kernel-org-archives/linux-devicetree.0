From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Wed, 23 Sep 2015 18:03:15 -0500
Message-ID: <20150923230315.GF26335@jcartwri.amer.corp.natinst.com>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-4-git-send-email-atull@opensource.altera.com>
 <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
 <alpine.DEB.2.02.1509231129350.23595@linuxheads99>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3241531632061958733=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <alpine.DEB.2.02.1509231129350.23595@linuxheads99>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: atull <atull@opensource.altera.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, pavel@denx.de, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org


--===============3241531632061958733==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 12:10:13PM -0500, atull wrote:
> On Tue, 22 Sep 2015, Josh Cartwright wrote:
[..]
> > > +struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
> > > +{
> > > +	struct fpga_manager *mgr;
> > > +	struct device *dev;
> > > +
> > > +	if (!node)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	dev =3D class_find_device(fpga_mgr_class, NULL, node,
> > > +				fpga_mgr_of_node_match);
> > > +	if (!dev)
> > > +		return ERR_PTR(-ENODEV);
> > > +
> > > +	mgr =3D to_fpga_manager(dev);
> > > +	put_device(dev);
> >=20
> > Who's ensuring the FPGA manager device's lifetime between _get and _put?
>=20
> Well... get_device and put_device are not sufficient?

Sorry if I was too opaque.

You've just put_device()'d the only reference to the device you had
here, so nothing is preventing from the device from being ripped away
while it's being used.

You should remove the put_device() call here, and add a corresponding
put_device() in fpga_mgr_put().

The module refcounting is also a bit strange, as you are
acquiring/releasing a reference to THIS_MODULE, but you also should care
about the lower-level driver's module refcount.

[..]
> > > +	dt_label =3D of_get_property(mgr->dev.of_node, "label", NULL);
> > > +	if (dt_label)
> > > +		ret =3D dev_set_name(&mgr->dev, "%s", dt_label);
> > > +	else
> > > +		ret =3D dev_set_name(&mgr->dev, "fpga%d", id);
> >=20
> > I'm wondering if an alias {} node is better for this.
>=20
> I could look into that.  Is there an example of that you particularly
> like for this?

Look at i2c's usage of the of_alias_*() functions.

  Josh

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWAy+wAAoJEKp7ZBKwQFArLiYH/1kR7EPnFxXUbWeOdMSuSqrD
Ywug3gdnrSQg8RAmAnTHKmU6nbYQi+bo1YmE0znjo2UY70VswwHvjAOxrQOn/kUA
VBMHtzDmUuVeoBaL7yXEJCIgc9E8hOweJ7GryStynkYdt/K1XuvmynLQfb0gPnso
39fVwomgAxhVfA64EN3pAOy8YWJEa8JhQcNiaaUhc2DEKVRjEJGF/yVzvd7ZqXz+
r+Oze5QwqQUzBgrsMHNNchX7eFy/k05SiOgnXR7Ql6c34d46EEJ4lkBONBmLuM8S
LOwFt1NTqDzGWLvr9mEJIN5sPgVnUI2GiZbDL6Bek4qz8coBO0OL1nQdSbw2Ca4=
=NmOA
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--

--===============3241531632061958733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============3241531632061958733==--
