From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 24/32] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Sat, 9 Mar 2013 12:10:03 +0100
Message-ID: <20130309111003.GA495@avionic-0098.mockup.avionic-design.de>
References: <20130306121118.GA17079@avionic-0098.mockup.avionic-design.de>
 <20130306180946.GA2433@obsidianresearch.com>
 <20130307080832.GD3451@avionic-0098.mockup.avionic-design.de>
 <20130307174955.GC20840@obsidianresearch.com>
 <20130307194830.GA1811@avionic-0098.mockup.avionic-design.de>
 <20130307200235.GB20695@obsidianresearch.com>
 <20130307204726.GB1811@avionic-0098.mockup.avionic-design.de>
 <51392B4D.9040404@gmail.com>
 <20130308071443.GA5772@avionic-0098.mockup.avionic-design.de>
 <513A7044.1020700@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6326886202592859817=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <513A7044.1020700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============6326886202592859817==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2013 at 05:12:04PM -0600, Rob Herring wrote:
> On 03/08/2013 01:14 AM, Thierry Reding wrote:
> > On Thu, Mar 07, 2013 at 06:05:33PM -0600, Rob Herring wrote:
> >> On 03/07/2013 02:47 PM, Thierry Reding wrote:
> > [...]
> >>> In a nutshell (since some of the context isn't quoted anymore) the
> >>> problem that we're trying to solve is that some of the embedded SoCs
> >>> require per-root-port registers for configuration. The PCI DT
> >>> specification doesn't make any provisions for this. A few alternatives
> >>> have been discussed so far:
> >>
> >> I'm not sure I follow. This is different than the host controller
> >> registers? Why would this not just be multiple entries in the reg prop=
erty?
> >=20
> > Well the register regions are per root-port. On Tegra20 there's 2 of
> > them, Tegra30 has 3 and if I understand correctly Marvell can have up to
> > 10 (!). Adding all of them to the reg property of the host controller
> > could work but it needs some way to match the reg entry to the root port
> > similar to option 1 below.
>=20
> The compatible property of the PCI host controller can imply what each
> index of the reg property entries is for.
>=20
> >=20
> > Adding a property in the root port nodes seems like a cleaner and more
> > accurate representation of the hardware to me, but if that's not
> > acceptable perhaps we need to bite the bullet and add the code to look
> > the registers up from the parent's reg property.
>=20
> What I don't like is a new property defined to describe mmio addresses.
> We already have a property for that and it is "reg".

Okay, understood.

> But I think I'm still missing something:
>=20
> >>> 			pci@0,1 {
> >>> 				...
> >>> 				reg =3D <0x00000800 0 0 0 0>;
>=20
> Is this a PCI bus address?

Yes. The example is slightly wrong. pci@0,1 should actually be pci@1,0.
That means it is device 1, function 0 on the bus (implicitly 0 in this
case). That matches the values in the reg property, whose first cell is
defined as follows, quoting the PCI OF specification:

	npt000ss bbbbbbbb dddddfff rrrrrrrr

Where:

	n         is 0 if the address is relocatable, 1 otherwise
	p         is 1 if the addressable region is "prefetchable", 0
	          otherwise
	t         is 1 if the address is aliased (for non-relocatable
	          I/O), below 1 MB (for Memory), or below 64 KB (for
	          relocatable I/O).
	ss        is the space code, denoting the address space
	bbbbbbbb  is the 8-bit Bus Number
	ddddd     is the 5-bit Device Number
	fff       is the 3-bit Function Number
	rrrrrrrr  is the 8-bit Register Number

Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJROxiLAAoJEN0jrNd/PrOh4uIP/ipDWHGJoD2n7pg3eYFHm2IT
pC5gYZi8U7SfknvrfKjmhOEFnAzQ/bvjDHoTrtBNk4sTYzSe45jK/mIzKBfQDvJI
IqhJooTgjjPrZtsj/Zc4Z6qJDhrqHAnLngb2eYg0yhAO7VVOv1BY4GFdgy5sbcTS
c7imWu45oPssWH7CBkJU7O++e5GP269PhVOZtHZpItmFYbUbCDrkB7Gw7h0/sGrg
7KbWzLzSRZuMLOPW3DEel+eHkpCdqywsidzdTwWuerSoTr1xvSW+MnFI9vLkUev5
fyZ439wQ8P4DF6E85a0ZGYTYQXvb9Pk1n1Eg4ZfZ2VAi5VYbRAzeBl7P6K0uE3uJ
mr45//pIiHG5zY3ragEAgq9kBKP7DTpKMFytyN6fPK8qb4CGb1ezKvgyITtjnkzZ
Eo2l4K90rTvLZJ1CMNDqMI+HAzxBv1S5zAfhgvVvlNi1pwQQ+fY5Y7H0Bar2s2sh
t5omgF0jOBSUIGjnx8uI/0Gnkdo0py4uBB9qZyiqc8V/KVL089PtiTAT/iPk95Q9
lmjPRcOeEO4wvV4lvSin+ZCMVbAIzJ5ijhLVldTEyL0slBeL9oEHdtTqVSjUGoeW
Wh26pL6SgyLGU3w5KKXhXKqQxkmlsvuEsRIoLC/Rx2QUFEaiZgbe9KmA9Ug+HNZa
yfIwRBOgnhySyBrMeUnf
=qHGK
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

--===============6326886202592859817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6326886202592859817==--
