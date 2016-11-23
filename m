From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: sunxi: sort the nodes in
 sun50i-a64-pine64.dts
Date: Wed, 23 Nov 2016 10:19:04 +0100
Message-ID: <20161123091904.lxhofakxqu5vtj6m@lukather>
References: <20161122155831.8724-1-icenowy@aosc.xyz>
 <20161122155831.8724-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7020672138301846200=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161122155831.8724-2-icenowy@aosc.xyz>
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


--===============7020672138301846200==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftaase6prf3wvjsx"
Content-Disposition: inline


--ftaase6prf3wvjsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 11:58:30PM +0800, Icenowy Zheng wrote:
> In this dts file, uart0 node is put before i2c1.
>=20
> Move the uart0 node to the end to satisfy alphebetical order.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Fixed the prefix and applied. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ftaase6prf3wvjsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNV8EAAoJEBx+YmzsjxAgIx4P/1j0wZzEO1kFwXrVK6ATe9Bu
h2kQQ8gH4XypYvqdb50RJtz7K6zlV/fWnNkicUf53GFIzxvRTqz7Hkv8eHwFcAXD
exVXKhWSx5Ws2ETnDdyO+hbF949BP1FsBBuICDeq4NkdP2U990gUtDnkKwCS8A0J
B73esvMD5g0C30W3VBXdB8HRw6IISp5A3kfws/Y/pnQhAS9wF5kjIkz/7pzKBLE3
1MQZvdhds/21183XCamkaHgKQpVNsl37MZRPyFzuum/6BA/NZf/FAFuP27ZgUXyL
1ipce1aV1LFxvgzrHHChZAHjDbsdbtKw2zA/34voOOGQNU2K8bRtFTIoaAwA5b8Z
ad/hWJIAJiuAAX7/wf6Mku69+a/pVlhocH4meSQV4VkEpXPeVIQNkbQQGkMb3SNu
FJYPxiq9CPF9vOyivy1nSpd0WAZ6EnMBlj14nOGBtEDpIaib46OaPfHTp4tO56ie
W1MIP5SzQs64NBkGxMntYt6lqt7AE0LSRkGM5G1DbMnH5yK6wGv09qsMROIoBHcw
nWAYvzXfR4vgkyI2Wdw5QiP31npemmge1zhi/VRBraNAVTd4A4wOO2TILSnVdJ2D
Opjb5DenLGzG+50+o6H1gmkom4HkNHOWPu/RaozLVMiku+912MOqts1fnzkJyh+U
PAZGzG/ZfOWRpS8WeQYD
=gTog
-----END PGP SIGNATURE-----

--ftaase6prf3wvjsx--


--===============7020672138301846200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7020672138301846200==--
