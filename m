From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 4/4] of/pci: Add of_pci_parse_bus_range() function
Date: Thu, 14 Feb 2013 07:52:03 +0100
Message-ID: <20130214065203.GA29588@avionic-0098.mockup.avionic-design.de>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
 <1360570940-17086-5-git-send-email-thierry.reding@avionic-design.de>
 <20130213225844.B79093E3557@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2127959543989871148=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130213225844.B79093E3557@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============2127959543989871148==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2013 at 10:58:44PM +0000, Grant Likely wrote:
> On Mon, 11 Feb 2013 09:22:20 +0100, Thierry Reding <thierry.reding@avioni=
c-design.de> wrote:
> > This function can be used to parse a bus-range property as specified by
> > device nodes representing PCI bridges.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> Ditto for this one. We can wait on it until there is a user.

This is used by the Tegra driver and as I've explained the reason for
sending these patches separately was to get them merged beforehand to
reduce the number of dependencies that need to be tracked once the
driver is merged (possibly in 3.10, maybe later given the amount of
extra work you want done).

The patch used to be part of the Tegra series, but since Thomas started
using them for his Marvell work I thought it might be a good idea to
make them available separately.

But I can take it back into the Tegra series since that's where we seem
to be headed.

> > +/**
> > + * of_pci_parse_bus_range() - parse the bus-range property of a PCI de=
vice
> > + * @node: device node
> > + * @res: address to a struct resource to return the bus-range
> > + *
> > + * Returns 0 on success or a negative error-code on failure.
> > + */
> > +int of_pci_parse_bus_range(struct device_node *node, struct resource *=
res)
> > +{
> > +	const __be32 *values;
> > +	int len;
> > +
> > +	values =3D of_get_property(node, "bus-range", &len);
> > +	if (!values || len < sizeof(*values) * 2)
> > +		return -EINVAL;
> > +
> > +	res->name =3D node->name;
> > +	res->start =3D be32_to_cpup(values++);
> > +	res->end =3D be32_to_cpup(values);
> > +	res->flags =3D IORESOURCE_BUS;
>=20
> Is there precedence for using struct resource for passing around the PCI
> bus range values? Who will be the user of this function?

The PCI core code actually keeps track of bus-ranges this way. See
drivers/pci/probe.c for instance which uses the global the busn_resource
variable and keeps a list of struct resource:s for each domain as well.

Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRHImTAAoJEN0jrNd/PrOhX4gQAIU9KeeryHhM80ts/IVQThrr
h8nkCHuo48NoYqdhf5xlxAYcqW5ghEpdotSFt/kzdPWIoTAm9dMG/skhwMw0UwZk
phzeYlAmmVbc4v50RW6A8kpphHa0QiRn4EsxW86rrvjeuohkU0uN3MdOnEUAk3fZ
X1RjPPH4k0evvrLEjNLkaTzsMg8gZ6QJbHcd7yjVJvl4ZC/kSrsCVq00iNzb896J
PHfMBpXKrc3HI8HsOz9FE4SETmKcTxkR4U2KMoMlTIP7nXL6K4hQYq53N57J0V+Z
IqiyAdLA2Laz9ldquJi0DSZ5BV+aonsK9OVAz/+TVXv9aGzd2lFeWCxnmC8m3f0L
GU7DGPz+AgXBdqs9WR+m3TMkcRO1h57zGZFr6PSo8Yo9Xps7XqvsZwbmgaTywQLg
GBpiRVg4n/aEROgHSSWtbgTP3jDDn3b+LIZD21ZB9nftdZrFKIgsj2JScCRL86FY
IMlGeoG/M30f45ocwtIyq6F2uaSpC9LWOy1ZnEnRxLP9B1icwRRTltPrrKCOp820
itm0XA6Ya+6opKGiFQc8iI9u8q/qS5+M5Y6Cue9fPb36w7iMnvI7DslIEZTLdeQD
8TefOF7Q7YIWMAAg9GJc1ym2FSO6ojzqirF/BR+nr2bLfJwcXbMRq9IwGaJV99b8
lvjVUZZwQteK8BWoNozZ
=i7sv
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

--===============2127959543989871148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2127959543989871148==--
