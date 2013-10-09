From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Wed, 09 Oct 2013 13:52:29 +0200
Message-ID: <5255437D.7040207@monstr.eu>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>  <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>  <20131008171343.GB25606@e102652-lin.cambridge.arm.com> <1381264278.645.232.camel@pasglop>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="bIRq6vEKG3hBrsvKettFvR9aujdGMmfRQ"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1381264278.645.232.camel@pasglop>
Sender: linux-pci-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bIRq6vEKG3hBrsvKettFvR9aujdGMmfRQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/08/2013 10:31 PM, Benjamin Herrenschmidt wrote:
> On Tue, 2013-10-08 at 18:13 +0100, Liviu Dudau wrote:
>> There are at least a handful of architectures that seem to share the s=
ame
>> implementation for most (all?) of the pcibios_*() functions. (PowerPC =
and
>> microblaze the most obvious offenders, x86 to a certain extent).
>=20
> That's because microblaze started by copying the powerpc code :-)=20

yes and the reason was that xilinx ppc405 and then ppc440 used
the same pci IPs that's why it was easier just to use this code.

I am keeping microblaze pcie driver out of mainline but definitely
unification work has to be done.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--bIRq6vEKG3hBrsvKettFvR9aujdGMmfRQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlJVQ30ACgkQykllyylKDCGKZwCeLy0FOGAo9PbI5sfn7j+F6wFM
vS0An0ode+IiphH8glruGnmMeyZDo0Z2
=abnv
-----END PGP SIGNATURE-----

--bIRq6vEKG3hBrsvKettFvR9aujdGMmfRQ--
