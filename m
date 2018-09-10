From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] of: Convert to using %pOFn instead of
 device_node.name
Date: Mon, 10 Sep 2018 11:06:25 +0200
Message-ID: <20180910090625.GA702@ulmo>
References: <20180828155254.10709-1-robh@kernel.org>
 <20180828155254.10709-4-robh@kernel.org>
 <20180907122928.GA5821@ulmo>
 <0999919005219fa94ccc69ff57659d47911d3abd.camel@perches.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0999919005219fa94ccc69ff57659d47911d3abd.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2018 at 05:30:23PM -0700, Joe Perches wrote:
> On Fri, 2018-09-07 at 14:29 +0200, Thierry Reding wrote:
> > On Tue, Aug 28, 2018 at 10:52:53AM -0500, Rob Herring wrote:
> > > In preparation to remove the node name pointer from struct device_nod=
e,
> > > convert printf users to use the %pOFn format specifier.
> > >=20
> > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: netdev@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  drivers/of/device.c   |  4 ++--
> > >  drivers/of/of_mdio.c  | 12 ++++++------
> > >  drivers/of/of_numa.c  |  4 ++--
> > >  drivers/of/overlay.c  |  4 ++--
> > >  drivers/of/platform.c |  8 ++++----
> > >  drivers/of/unittest.c | 12 ++++++------
> > >  6 files changed, 22 insertions(+), 22 deletions(-)
> > >=20
> > > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > > index 5957cd4fa262..daa075d87317 100644
> > > --- a/drivers/of/device.c
> > > +++ b/drivers/of/device.c
> > > @@ -219,7 +219,7 @@ static ssize_t of_device_get_modalias(struct devi=
ce *dev, char *str, ssize_t len
> > >  		return -ENODEV;
> > > =20
> > >  	/* Name & Type */
> > > -	csize =3D snprintf(str, len, "of:N%sT%s", dev->of_node->name,
> > > +	csize =3D snprintf(str, len, "of:N%pOFnT%s", dev->of_node,
> > >  			 dev->of_node->type);
> > >  	tsize =3D csize;
> > >  	len -=3D csize;
> >=20
> > This seems to cause the modalias to be improperly constructed. As a
> > consequence, automatic module loading at boot time is now broken. I
> > think the reason why this fails is because vsnprintf() will skip all
> > alpha-numeric characters after a call to pointer(). Presumably this
> > is meant to be a generic way of skipping whatever specifiers we throw
> > at it.
> >=20
> > Unfortunately for the case of OF modaliases, this means that the 'T'
> > character gets eaten, so we end up with something like this:
> >=20
> > 	# udevadm info /sys/bus/platform/devices/54200000.dc
> > 	[...]
> > 	E: MODALIAS=3Dof:Ndc<NULL>Cnvidia,tegra124-dc
> > 	[...]
> >=20
> > instead of this:
> >=20
> > 	# udevadm info /sys/bus/platform/devices/54200000.dc
> > 	[...]
> > 	E: MODALIAS=3Dof:NdcT<NULL>Cnvidia,tegra124-dc
> > 	[...]
> >=20
> > Everything is back to normal if I revert this patch. However, since
> > that's obviously not what we want, I think perhaps what we need is a
> > way for pointer() (and its implementations) to report back how many
> > characters in the format string it consumed so that we can support
> > these kinds of back-to-back strings.
> >=20
> > If nobody else has the time I can look into coding up a fix, but in the
> > meantime it might be best to back this one out until we can handle the
> > OF modalias format string.
>=20
> Or just use 2 consecutive snprintf calls
>=20
> 	csize =3D snprintf(str, len, "of:N%pOFn", dev->of_node);
> 	csize +=3D snprintf(str + csize, len - csize, "T%s",
> 			  dev->of_node->type);

Yeah, that's what I ended up doing. Rob came up with another alternative
which is to output the 'T' via %c, which also works around the issue.

Thierry

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluWNAwACgkQ3SOs138+
s6Gokg/+K3EawlUajE6ZpjcPOUOT9YUvcNEj3Z0/11JF7nBbZ52sBrBs7PEOdLWW
Rgw3+5UX70U5o/oB2+d0m9mCS6zk5zsqAhDacU/3xEHod64qdjexPuU4VH1skk2Q
2m/Tx3Z/aivJAKjovI5IRjk8lD3RUVkTk1x3Jw2BrNxtahYygKNNeh3aqrjHqonm
DFaZBn6gBGMeDSGFVL0n2X+5rE0NJFLIhbBs0isfQppTZeerqawm25i0r+vT/IJd
lGYar4hPqFb9VGtBwe0rZ6hg0j7f1BI+JUe4tV/XmGmKLJJc5IWBhAwlsNCwjFpt
UN3NtJBv5oWOAazcvV/YrCxk/C5dzdNRgp6ccbcc2GUHlqHnvs86dcNlvhv3DcBG
B+umZbQC+b30qyZs4xcZUAg7qygf22BbyAF+OMDxn9YR6GIivqNgSJTtTErAExLB
HtSS1awvtCETNlgNY5vy/Nh0Jnzm5XzUAauuO467e/OzqWgN0IQCteNlWpD9ZNOe
RNEUWEdb49qN2coDLi/pi4Mc+nkHhFcQ+rfQDN5OKwcomx9dE5XHNzPTJmsLbbAr
2Z/7P+g2IePJOUpVWUvz+wcESGCExsd+rgXHYUC+HYekCSJal2MtfkP1zMoFfefH
hlistUPBmCXmJpHokHsq0QLPK04lpp2P8hMBic9YXcOyKw1ShDI=
=TA2P
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
