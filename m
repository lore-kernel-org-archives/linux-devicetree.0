From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] pci: Provide support for parsing PCI DT ranges property
Date: Thu, 13 Dec 2012 11:03:18 +0100
Message-ID: <20121213100318.GB13055@avionic-0098.adnet.avionic-design.de>
References: <20121212163749.GA17371@arm.com>
 <20121213091333.GA14828@avionic-0098.adnet.avionic-design.de>
 <20121213094543.GA23446@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6260287145089005777=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121213094543.GA23446-5wv7dgnIgG8@public.gmane.org>
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
To: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============6260287145089005777==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 09:45:43AM +0000, Andrew Murray wrote:
> On Thu, Dec 13, 2012 at 09:13:33AM +0000, Thierry Reding wrote:
> > Hi Andrew,
> >=20
> > I don't like iterator interfaces too much, but I can live with that.
> > Other than that the patch looks good to me and I'll try to work it into
> > my Tegra PCIe patch series.
> >=20
> > Just two minor comments below.
> >=20
> > > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > [...]
> > > @@ -421,7 +472,7 @@ u64 __of_translate_address(struct device_node *de=
v, const __be32 *in_addr,
> > >  		goto bail;
> > >  	bus =3D of_match_bus(parent);
> > > =20
> > > -	/* Cound address cells & copy address locally */
> > > +	/* Count address cells & copy address locally */
> > >  	bus->count_cells(dev, &na, &ns);
> > >  	if (!OF_CHECK_COUNTS(na, ns)) {
> > >  		printk(KERN_ERR "prom_parse: Bad cell count for %s\n",
> >=20
> > This is really minor, but it should still go into a separate patch.
> >=20
> > > diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> > > index 01b925a..4582b20 100644
> > > --- a/include/linux/of_address.h
> > > +++ b/include/linux/of_address.h
> > > @@ -26,6 +26,8 @@ static inline unsigned long pci_address_to_pio(phys=
_addr_t addr) { return -1; }
> > >  #define pci_address_to_pio pci_address_to_pio
> > >  #endif
> > > =20
> > > +const __be32 *of_pci_process_ranges(struct device_node *node,
> > > +				    struct resource *res, const __be32 *from);
> > >  #else /* CONFIG_OF_ADDRESS */
> > >  static inline int of_address_to_resource(struct device_node *dev, in=
t index,
> > >  					 struct resource *r)
> > > @@ -48,6 +50,11 @@ static inline const u32 *of_get_address(struct dev=
ice_node *dev, int index,
> > >  {
> > >  	return NULL;
> > >  }
> > > +const __be32 *of_pci_process_ranges(struct device_node *node,
> >=20
> > There should be a blank line to separate the above two lines.
> >=20
>=20
> Thanks for the feedback.
>=20
> I will send another patch for the typo and leave this patch with you for
> working into your existing series.

I suppose you have your own series that uses this patch?

Thierry

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQyafmAAoJEN0jrNd/PrOhZn4P/3Xv0Otsykjsd/RABVgUEEI9
BGF3JD4F1+HXAOTlmb8avJ74CkjQQqLXzGjTwklWODaPAZrkBQXY42d9RJi+3FD/
qVMpXo1kh8ZisZF1gHPWHSpQzYfcayGwTd5SlcUKK0g3tH4aM8UMhIAzA+3AnhwR
3O4+4B4ri2JwOkkSUouxMN3sDA7kmPx8JxMLz3x0ZbOjtm5+90/mygc3eSanbuNo
Zg4E7Zk5toa+GyRgs6uoKojSWWNQlDJPFLQ5WMMhB8W/5ln4PM/100pmXw4N1mCK
rY+xXuUrnjRkGprO+8usTB6aRTEv7xhvT3H7Un7i+RZH1QNBhugbzFJ8HTGgCz6j
gdBBCywL4O4ENFt1sxd1/NnP/dAJwmExDOEjFze93IEPxBsIIgSAP+iKYfQQ0hWJ
T3qeIFg2vMppec6kLndD+MITamR+i31WEwMvX4PprY8wu4af2JnhD22pafnOrIUI
x6Eq7PYPgZidaoemxj3dPtkBYI1eGC6vCFPGz3vSQC85rbmAGwcQ3y8bkR9ROcwH
iqyKNDt8V7gvFQIPxcC3mf8YsKCCqd7TrZgM/fgqCaSQFTabdVZuYXThHfKLccmq
ycabwD68EXrZEO6aXC3T4mbk2iYVsVqPQbytzI6eLY4uvt/OKaiVNEsedQDCGu6p
E4MqjYZUcu98iarL2Sb5
=xukc
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

--===============6260287145089005777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6260287145089005777==--
