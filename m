From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: sunxi: enable EHCI1, OHCI1 and USB
 PHY nodes in Pine64
Date: Wed, 23 Nov 2016 10:20:22 +0100
Message-ID: <20161123092022.tn5gymbvcw3kr6uy@lukather>
References: <20161122155831.8724-1-icenowy@aosc.xyz>
 <20161122155831.8724-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0708262562934308658=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161122155831.8724-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0708262562934308658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cjy32f3wyxop3tgw"
Content-Disposition: inline


--cjy32f3wyxop3tgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 11:58:31PM +0800, Icenowy Zheng wrote:
> Pine64 have two USB Type-A ports, which are wired to the two ports of
> A64 USB PHY, and the lower port is the EHCI/OHCI1 port.
>=20
> Enable the necessary nodes to enable the lower USB port to work.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Fixed the prefix and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cjy32f3wyxop3tgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNV9WAAoJEBx+YmzsjxAgLHgQAKG+fOtYCiybF/cXpbZAupsS
zQmRGxFYnNQ5saiiHAsxHp1ZtHAbx2jeTT5vWLfrUnNL6YOzk0Mm3zQPUBDu03Ip
ZCJnkXrIeSIXxLOMwptMI8xUIEYaJFhCh2F7N7W676jy8+il0sg2RQTja2kbMBIi
/0UqiB8alAZnUsgQaDBNLvfpS43qXL2kMGMEkZwMslxPYaRw+K1r2wKZoKxV5jbL
/yu6tCPZ7pG9ztURhkZNvXCcoHhsdVOG4XkTQ2DH3+5ASVGhFCNVmz4bwvjoaggG
j05MgCydE/Yr0fE8dj9Y22EJ5W8VIVX2nhRz7rXid6EaYz7Keysx+28ikXMFtP80
9eAj0OIityDgPJ5jtI5a9OVQz2EKUDatwUuvLkiJxNIOb9ql7kcui8iMrF+Od6Iz
HqY4T33mSoa0M60zpDfaSOOxqhPG2EDQT2r9Xrkct3iPHRwM9rnOlGHz5U8a3IeY
7vauy6dzjp4m2k8no12qNgu/6PBq0ghHJbjv1hDl4Y3d8nDwOhit3aKRn/Y6j08t
7EdQ7o0bxe43c7U2a1nPBiCO5E5BHDdTb/2RagWB4VwUgU3e7mJp2Xvojmpke6sj
3r7UFcVhoGFfwOXJNNlV1vWazux8uLw+C8MoOA88Bi3xaUvu0UClc0iPxamZPeQu
BzEwWVbsjdmMq+ypbAH3
=vDIO
-----END PGP SIGNATURE-----

--cjy32f3wyxop3tgw--


--===============0708262562934308658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0708262562934308658==--
