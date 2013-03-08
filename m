From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 24/32] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Fri, 8 Mar 2013 21:13:40 +0100
Message-ID: <20130308201339.GA26322@avionic-0098.mockup.avionic-design.de>
References: <20130307174955.GC20840@obsidianresearch.com>
 <20130307194830.GA1811@avionic-0098.mockup.avionic-design.de>
 <20130307200235.GB20695@obsidianresearch.com>
 <20130307204726.GB1811@avionic-0098.mockup.avionic-design.de>
 <51392B4D.9040404@gmail.com>
 <20130308071443.GA5772@avionic-0098.mockup.avionic-design.de>
 <20130308165228.GB4094@obsidianresearch.com>
 <20130308191227.GA6551@avionic-0098.mockup.avionic-design.de>
 <513A3F4F.2090501@firmworks.com>
 <20130308200245.GC29435@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8965379991851869284=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130308200245.GC29435-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8965379991851869284==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2013 at 01:02:46PM -0700, Jason Gunthorpe wrote:
> On Fri, Mar 08, 2013 at 09:43:11AM -1000, Mitch Bradley wrote:
[...]
> > 2) The "@0,0" and "@1,0" suffixes do not correspond to the reg values
> > <0x0800 0 0 0 0> and <0x1000 0 0 0 0> using any rule that I know.
>=20
> @0,1,0 (bus,device,fn) could be more appropriate, but that is
> cosmetic?

The OF PCI specification is pretty strict about this as well. It says in
section 2.2.1.3. that only the DD and DD,FF forms can appear in a device
path.

Thierry

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJROkZzAAoJEN0jrNd/PrOhjOYQAK2XmBbA+p5sqjGBjfDOxGc/
Q3Amkf4FE7o2fYrJacrsdo7uMgQQbghzer5JRjj2Qc2g3YMbp3BaQpOrkFRZAHj5
CQIrkBbRQtvuLC73ojeLuGTUD+eLRMpbByEENMM2kUXIOTQqKmtMcIdVF4vlWrFp
wvi4TK4YFnybBUP0hX7MRI7qgI4EmfNupPv0aCRbu+mHsEkVA1mF0ELbUtCPpQ8w
6h7AnawR06KkXIqk5cidcpXEK+XMjwJlEseceMPlQxiVkbDZ68I7DeXe0qjDrizN
x6uvBNvABkk9YHbKth7g99/I5h8BgCZl8jqVnyFKATifSh6rJ6oQEqXciz/tyxg0
XT5ZSyLDMeUsO1hfsVfYe56S5Tj9Af9yofSqK6ZGdq/QzXi1hW2mB4ZNsTJigMVx
RYwg0RKOXXcVXY8l8uiewjV4TyjS2xzWjZbQgvMBG6bzNTRsqKi35MAO/n7YXpfx
vWrIAiTbCPhN4HEZ2RsNtLSfPr7MJ7BtAaq6vNGhbRtQQjoYoeUlRDEC6yZK1yVA
y5jy554dwDgquh491iEsHpZkejaAzsdQyp1pO6e6JK8UDWF3NHsG/1ul0bG+Bl66
8YFGvFrDlUn3wU16wMkWOO6iClzEHVhhfS2yFISIPyYKvJZM3cPxUE+jL3r/2uE3
LBPdgW+hLfR/NUnHwqf+
=QXul
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============8965379991851869284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8965379991851869284==--
