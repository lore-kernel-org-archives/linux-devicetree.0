From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Describing arbitrary bus mastering relationships in DT
Date: Fri, 2 May 2014 13:05:58 +0200
Message-ID: <20140502110557.GA18452@ulmo>
References: <20140501173248.GD3732@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140501173248.GD3732-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2014 at 06:32:48PM +0100, Dave Martin wrote:
[...]
> ** Outline binding **
>=20
> generic device node property: "slaves"
>=20
> 	optional
>=20
> 	type : cell array consisting of one or more phandles
>=20
> 	Implies that the device represented by the containing node
> 	can issue transactions to the referenced node.
>=20
> 	The referenced node is any bus or device node, and is
> 	interpreted in the usual way, including the treatment
> 	of ranges, #address-cells and #size-cells.  If the
> 	referenced node has a non-empty ranges property, the
> 	referencing node's #address-cells must be the same as
> 	that of the referenced node's device tree parent.
>=20
> generic device node property: "slave-names"
>=20
> 	prohibited if there is no "slaves" property; otherwise
> 	optional.  Recommended if the "slaves" property has
> 	two or more entries.
>=20
> 	type : string list with the same number of entries as
> 		the number of cells in the value of the
> 		"slaves" property.
>=20
> 	Assigns symbolic names to the entries in the "slaves"
> 	property, permitting slave connections with different
> 	roles to be disambiguated.  See
> 	Documentation/devicetree/bindings/resource-names.txt
>=20
> generic device node: "slave"
>=20
> 	optional
>=20
> 	Implies that the device represented by the containing
> 	node can issue transactions to the "slave" node.  "slave"
> 	would always have these semantics; whether other child
> 	nodes have a similar meaning is binding-specific.
>=20
> 	property : "name"
>=20
> 		optional
>=20
> 		Assigns a symbolic name to this slave with
> 		respect to the master.
>=20
> If neither "slaves" nor any "slave" node is present, the topological
> relationships are those defined by ePAPR: the device may or not be
> a master, and if it is a master then it masters onto the parent node,
> optionally propagating through the parent to the parent's parent
> via mappings described by dma-ranges.

Let me see if I understood the above proposal by trying to translate it
into a simple example for a specific use-case. On Tegra for example we
have various units that can either access system memory directly or use
the IOMMU to translate accesses for them. One such unit would be the
display controller that scans out a framebuffer from memory.

	dc@0,54200000 {
		...

		slave {
			/*
			 * 2 is the memory controller client ID of the
			 * display controller.
			 */
			iommu =3D <&iommu 2>;

			...
		};
	};

Admittedly this is probably a lot more trivial than what you're looking
for. There's no need for virtualization here, the IOMMU is simply used
to isolate memory accesses by devices. Still it's a use-case that needs
to be supported and one that at least Tegra and Exynos have an immediate
need for.

So the above isn't much different from the proposed bindings, except
that the iommu property is now nested within a slave node. I guess this
gives us a lot more flexibility to extend the description of a slave as
needed to represent more complex scenarios.

One thing that confuses me slightly about your proposal is that these
subnodes describe the master interfaces of the containing nodes. Would
it not be more appropriate to name the nodes "master" instead?

Also, are slaves/slave-names and slave subnodes mutually exclusive? It
sounds like slaves/slave-names would be a specialization of the slave
subnode concept for the trivial cases. Would the following be an
equivalent description of the above example?

	dc@0,54200000 {
		...

		slaves =3D <&iommu 2>;
	};

I don't see how it could be exactly equivalent since it misses context
regarding the type of slave that's being interacted with. Perhaps that
could be solved by making that knowledge driver-specific (i.e. the
driver for the Tegra display controller will know that it can only be
the master on an IOMMU and therefore derive the slave type). Or the
slave's type could be derived from the slave-names property.

While this proposal lacks specifics for IOMMU devices, I think it could
work well to describe them in a generic way. Especially when slave nodes
are used, arbitrarily more data can be added to describe more complex
master interfaces (DMA windows, ...).

I still see an issue with supporting this generically with the currently
recommended way to use IOMMUs (via the DMA mapping API). There's not
enough granularity in the API to support this. It's probably going to
work fine for Tegra, but I think for more complex cases drivers will
probably need to use the IOMMU API directly.

But that's an implementation detail and can probably be solved later.

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTY3wVAAoJEN0jrNd/PrOhmaoQALml2yFTeYPSM3avq3cUbAad
VkPUbnydzcYFadiFv5Q+A6V7BnMjJCnCQW84TvJp5R+JE64hqniOqeeYiaQFo0iF
WFYkELflzR532EpBqfOzPO2VuLmXQH2HYHpWGdRJv9XlHVWM76OrsWVv6/ifdvIp
j4oRtTRqfQkMVu7pW8SlDoAgq88PoFN15oUJqwcBEvwD0OHVEWekDNsamWrB7G2q
kqpDvnQQwfk7FG/HXdrWPPKy811zsXpPuE1SyuojhZ3Ohu6vzwM6xw6DSlaa4UtZ
BA5lSP7bqViVCupuavUXOcQTuTCPbf8h4C+lWSwtCWQwVEfrbqMF68xNJq5OqYDe
V+so+YMNsYajEwohe6u3uYs5wkWErRNqKNd9LloX36o38TRyu/Qk/tNbCsHm8Bcs
XgSBn7IHKFNwGziXwXO/7ZmE6MCkhMvUL9Uha7NBmbntDBHVeiw2kD+wf5BkYaoZ
FGkvYAvfmuIUz/mslb/O/9QjPnilk/LuMR4PpSLiyyZ8QG1J13eW3fYk51A1nQOj
Q8gKtK6geb58s1UEKixRfcKibALkbbA6NmQzTTBBrjtJwGT7mlNQ+VUh1I0sEput
CsQxo3/9rVrfBhT09W8BWmHX7SS2MwWatbWjK52UuOvO8T3wVpobEjeV9iBTTo/x
cgmFhs4PCuDAKn6O8MQA
=Bm2h
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
