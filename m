From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 24/32] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Thu, 7 Mar 2013 21:47:26 +0100
Message-ID: <20130307204726.GB1811@avionic-0098.mockup.avionic-design.de>
References: <1360686546-24277-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360686546-24277-25-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130212223511.GB31555@obsidianresearch.com>
 <20130306105441.4d24033e@skate>
 <20130306121118.GA17079@avionic-0098.mockup.avionic-design.de>
 <20130306180946.GA2433@obsidianresearch.com>
 <20130307080832.GD3451@avionic-0098.mockup.avionic-design.de>
 <20130307174955.GC20840@obsidianresearch.com>
 <20130307194830.GA1811@avionic-0098.mockup.avionic-design.de>
 <20130307200235.GB20695@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1347760931835129442=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130307200235.GB20695-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1347760931835129442==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 01:02:35PM -0700, Jason Gunthorpe wrote:
> On Thu, Mar 07, 2013 at 08:48:30PM +0100, Thierry Reding wrote:
> > On Thu, Mar 07, 2013 at 10:49:55AM -0700, Jason Gunthorpe wrote:
> > > On Thu, Mar 07, 2013 at 09:08:32AM +0100, Thierry Reding wrote:
> > [...]
> > > > > Both have various problems, but I think I prefer the first one as=
 it
> > > > > doesn't conflate the contoller registers and host apertures in a
> > > > > single ranges..
> > > >=20
> > > > I think a better alternative would be (and this matches what Thomas=
 has
> > > > said elsewhere) to use something like the first alternative but mov=
e the
> > > > regs property into the pcie@0,X nodes. That would save us from havi=
ng to
> > > > index a property in the parent. At least from a DT point of view I =
find
> > > > that to be a more consistent representation.
> > >=20
> > > You are thinking a new property 'host-controller-regs' or the like?
> >=20
> > Well, something shorter would be nice, but that's the general idea, yes.
> > As I mentioned before, for Tegra these registers aren't actually any
> > controller specific registers but rather a window to access the PCI
> > configuration space for the root ports.
>=20
> Yes, I understand - but in this DT model configuration space access is
> a host controller function, not a PCI-device function. Anyhow I was
> also thinking that by the choice of the name it could do translation
> from the host-controller scope, not from the bridge scope - so the
> extra elements in ranges could be avoided as well. Hence the name..
>=20
> > I don't think assigned-addresses is a good fit either. The PCI binding
> > document is equally specific about it as it is about the reg property.
> > So in my opinion a separate property would be a better choice. The only
> > big obstacle is that it needs to be somehow hooked up with the OF core
> > so that proper address translation can be performed.
>=20
> Yes, agreed.
>=20
> My suggestion is to get the OF experts like GKL/Rob H/etc to weigh in
> on a preferred approach to this problem with the goal of standardizing
> across all PCI host drivers. Seems like there are 2 main options
> (outside regs + regnames/etc or new 'regs' in the bridge) and 1 hacky
> one (assigned addresses)

Arnd is already Cc'ed on this thread, adding Grant, Rob and the
devicetree-discuss ML.

In a nutshell (since some of the context isn't quoted anymore) the
problem that we're trying to solve is that some of the embedded SoCs
require per-root-port registers for configuration. The PCI DT
specification doesn't make any provisions for this. A few alternatives
have been discussed so far:

	1) Use a "regs" property outside of the root port nodes with
	   some mechanism to index into them from within the root port
	   nodes. Conceptually somewhat like this:

		pcie-controller {
			...
			regs =3D <0x80000000 0x00001000
			        0x80001000 0x00001000>;

			pci@0,1 {
				...
				port-index =3D <0>;
			};

			pci@0,2 {
				...
				port-index =3D <1>;
			};
		};

	2) Use a "regs" property inside of the root part nodes, along
	   the following lines:

		pcie-controller {
			...
			pci@0,1 {
				...
				reg =3D <0x00000800 0 0 0 0>;

				regs =3D <0x80000000 0x00001000>;
			};

			pci@0,2 {
				...
				reg =3D <0x00001000 0 0 0 0>;

				regs =3D <0x80001000 0x00001000>;
			};
		};

	3) Repurpose the "assigned-addresses" property to achieve the
	   same. This should work out-of-the-box but isn't a good fit
	   because it conflicts with the OF PCI specification which
	   defines this property to contain the addresses assigned to
	   the base address registers.

Options 1 and 2 above require changes to the OF core to allow proper
address translation, but the changes shouldn't be very big.

> > One possible solution that wouldn't be too hard to implement is to
> > provide a new function (say of_get_named_address()) similar to
> > of_get_address() which doesn't get the name of the register property
> > from the struct of_bus but from a parameter and call that function from
> > another new function similar to of_address_to_resource() that also gets
> > the property name from a parameter. I can't think of a better name for
> > the latter than of_named_address_to_resource(), which is rather long.
>=20
> Seems like a reasonable API, maybe pass in a be32*/length pointer
> instead of a name to be more flexible?

There's already __of_address_to_resource() which takes a be32 * and size
but I thought it might be easier to wrap that to make it easier on the
drivers to use the API.

Thierry

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJROPzeAAoJEN0jrNd/PrOhDMgP/ji9z3erHoYfgD5pB82kUPdk
THqvj5LLh1hhVZS48szZWHffqr9mgoWSBQH8m7DSVPN06JFLjkALFXPszWQwSZgC
8Kge91FfhkREPiPrS4Q92+2NGy0Z5QKS5uqvd0lBDKLtZTwVwNbpMFgSqEpc+9FI
DLK83PiSothdqdatwrwlnQTBalXD9RDVKI90gq0wp7LN7jK6wCNnm291pHuSOa8X
cuhVI79855YHW1q2F+YwCnKfRga6ydhuDj5hSA9lq3GCLo/vW3LM/eJyJcWreZfw
B8Sg5KxlsAcogsOnOx1DTSrWN1IaORBg7PBw5MIsvJ5PluLcB9bKklQCTvZL/0Hs
Kt3FUeUErYoBKhglMbML0WA0q4NuEmdcKYjpAc7aJ+joe1O+HqxY0gLlcU/eqUKn
c9o/+P88wBusw5eSaJDVs6rVQCJo7eM5YS7dvTwP0hP4ItGRCwMDmBW/+UyHDwgZ
n7J3P2matHLc3CnhAZu39caNq3LQE23wXsCQWmbaabm1V+fWYtuVtdc06vZA75UV
35Dlsm1u8rgyHpEc2B8MF5NBqx72nYT7rLS28TKrF7C9g9eQjLNt0vh3QBqezB8s
XnMUSJrLKG7Elr49timHko5+s9bxpEds9/iliyCSlx6a4gNgY5GeCAPdY6O/d0d4
iFuEdAQxU6GJpLR/Sgge
=CsnA
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--

--===============1347760931835129442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1347760931835129442==--
