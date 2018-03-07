From: James Hogan <jhogan@kernel.org>
Subject: MIPS DT W=1 warnings (was Re: [PATCH v5 2/5] MIPS: mscc: add ocelot
 dtsi)
Date: Wed, 7 Mar 2018 21:49:26 +0000
Message-ID: <20180307214925.GU4197@saruman>
References: <20180306121607.1567-1-alexandre.belloni@bootlin.com>
 <20180306121607.1567-3-alexandre.belloni@bootlin.com>
 <CAL_JsqKzEUO1DiaVtw8vBtiO9Xw7_5EprrC8z3C9JA6bFq1KmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MhP8cYafZlTESjGT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKzEUO1DiaVtw8vBtiO9Xw7_5EprrC8z3C9JA6bFq1KmQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ralf Baechle <ralf@linux-mips.org>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, =?utf-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org


--MhP8cYafZlTESjGT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Mar 07, 2018 at 10:08:28AM -0600, Rob Herring wrote:
> Please compile with W=3D1 and fix any issues like this one which is a
> unit-address without a reg property. Drop the unit-address.

I was just giving the BMIPS W=3D1 DT warnings a look, and a few look
spurious. I'd value your opinion on their legitimacy (its hard to care
about W=3D1 if spurious or seemingly pedantic warnings are going to be
common). e.g.


1)
arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: Warning (unit_address_vs_reg): No=
de /ubus/syscon-reboot@10000068 has a unit name, but no reg property       =
  =20

due to:

periph_cntl: syscon@fff8c000 {
	compatible =3D "syscon";
	reg =3D <0xfff8c000 0xc>;
	native-endian;
};

reboot: syscon-reboot@fff8c008 {
	compatible =3D "syscon-reboot";
	regmap =3D <&periph_cntl>;
	offset =3D <0x8>;
	mask =3D <0x1>;
};

That doesn't seem to take regmap into account. Would you strictly drop
the unit-address in this case, or is there a way the DT compiler can be
fixed (i presume offset and mask are binding specific, so the best it
could do is probably to allow the unit-address due to the regmap without
checking the actual address)?


2)
arch/mips/boot/dts/brcm/bcm9ejtagprb.dtb: Warning (simple_bus_reg): Node /u=
bus/syscon-reboot@10000068 missing or empty reg/ranges property

Same code as above. Should syscon-reboot be outside of the simple-bus
that both nodes are in, or is it fine there? There's a similar warning
=66rom a DTS which has a syscon property instead of regmap.


3)
arch/mips/boot/dts/brcm/bcm97425svmb.dtb: Warning (simple_bus_reg): Node /r=
db@10000000/spi@41c000 simple-bus unit address format error, expected "4199=
20"

qspi: spi@41c000 {
	#address-cells =3D <0x1>;
	#size-cells =3D <0x0>;
	compatible =3D "brcm,spi-bcm-qspi",
		     "brcm,spi-brcmstb-qspi";
	clocks =3D <&upg_clk>;
	reg =3D <0x419920 0x4 0x41c200 0x188 0x41c000 0x50>;
	reg-names =3D "cs_reg", "hif_mspi", "bspi";
	...

Well 41c000 is one of the reg entries, just not the first. I presume
bspi is the "main" one, perhaps that should come first since we have
reg-names, but even that could potentially confuse driver code if it
didn't find reg resources by name (in this case it does appear to, so
perhaps that would fine)?


Thanks
James

--MhP8cYafZlTESjGT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlqgXmUACgkQbAtpk944
dnoh8BAAm19Ncrz8I87sU9634jgN/y/RC3UzZL2JEG9TEWo7VJWqZuLddt//yZ9I
OdgedWa5If1CSKc7RGCMpa0mhLE8xAHRmeQnzIygx0Nl9uoQpWoh9Y6epNNKHJ67
sB3kgATY0zpICtOebTwB/0VsYErbigVBzEtKVC/xXNRu+90qVHMr4HZiOVwx9g7E
Uc/Yq7r5iUExjtu+MdP12ldEcS3Kq1Djz2sLpOG2mQWoKT4UEwlneQIFAJWgjm0y
6ozsOZL/6JTp5edKvxOmVi8tfBCYodk22iwW61AsELPVMBzzIr4sy7Do3r9sCH5B
HDpCIQQTS4eZ7Pqi+6sD7uLSP05mFyP4otejO4eMcySR9gT29x2s6Qj+Z2WTxgBg
51qIOAOEb4eoDHt+8bQjOTrYdwkSazr95Tyg8bXMj6YPGfiYV7cDPTQ8Fd3ToH36
ZisYGKMhqsX5racfIQkpRvVWgC61ZsF/nEsBAlj1C5JeviyEWdGmMKMQRiIUyL/U
UCrRWHJVrm7jMJrkZ3CBGqCzyXOgGXQpUrC24pUSapk+4NJFZyEGjTxLAXrFm4i6
e6yWNXC2YNkBrO6lVp5bUpYMtxzepew+BhG6YXRFAKyLkxJZqoKzYOztaiCP5SJL
S46mFLXB+qIqz4cUEAkbLcDshGiPF/bLEJ6f/+ZE6PiLs4DssB4=
=0Oql
-----END PGP SIGNATURE-----

--MhP8cYafZlTESjGT--
