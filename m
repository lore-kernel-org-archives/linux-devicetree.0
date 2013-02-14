From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 1/4] of/pci: Provide support for parsing PCI DT ranges
 property
Date: Thu, 14 Feb 2013 20:17:45 +0100
Message-ID: <20130214191745.GA13875@avionic-0098.mockup.avionic-design.de>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
 <1360570940-17086-2-git-send-email-thierry.reding@avionic-design.de>
 <20130213225311.37FFB3E3557@localhost>
 <20130214165341.GA29199@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130214165341.GA29199@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 04:53:41PM +0000, Andrew Murray wrote:
> Thierry,
>=20
> If you don't have much bandwidth I'd be quite happy to take this on - this
> would be beneficial for my eventual patchset. I can start by refactoring =
common
> implementations of pci_process_bridge_OF_ranges or similar across the
> architectures as per Grant's suggestion? I didn't do this when I first po=
sted
> the patch as I was concerned about the testing effort.

Absolutely! Since it was your patch in the first place you're just as
well suited to do this if you want to and have the time.

Thanks,
Thierry

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRHThZAAoJEN0jrNd/PrOhqSwQAJn6VuXVWNnJ8Lb8M0Y0UGjA
8afkXuqdUqQ7SVhrFKbd7uMavtROFGAICIHvvs9bj0jyGJRY4rE/Xp+UvEha/1sK
3YMaOw++5yIFDDO22zTbsvVyqNCl86eGsLdLIR/r4bJ+YsAe2EKvOu+S9s1IYf6x
24afZfTwhUtJvkbIBH/PwPrUGp6V6b5r9k0x138+rAd3YjsJq7FByBcRzQGD9nu8
4n1IN65DRENoDs8vWM/V7g95FStfrRaBMD4JtLoht8dI4yS9tvj4UvLWxexUIgWQ
52GltAwUm6T2bXHQ5Y8PlOvyvP6q6TjAFhI+gMfrADMVTVq+fGQaEGKhZzkEYrIv
n0g7JxS74Hmpna3wqR2fS/RzsC0LqWIVXKpymRXzYAhlJt0JRcrVM89Qp4qZFVEc
Vw1ehWlx4m+tAWb2a551MmczUgGqSIt7rKtrdeOP7hVktvbtOzwKQErP/NvI4A+h
e9CQNXxsOYPS5MAK8qAc8qC7TBlT+UHnnqH37pXXdQgDIfRYZemHqHpDGJxpHd1m
a07jA1r7bA7CMXe8RqoOjNeA0IReKI2uwDMIOi2zpKElOZA828pjt7sqKo4hg/7V
1AAgI3w2ffyi+Hdfz+urVLGxOxgQvxWfiDos/oFSvvDeUmxk89Qdc9U6F66wfgTC
O2R1HPhT/2fNB98R4JEO
=qUDq
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
