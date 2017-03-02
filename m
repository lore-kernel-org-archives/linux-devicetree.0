From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/5] pinctrl: sunxi: refactor pinctrl choice selecting
 for ARM64
Date: Thu, 2 Mar 2017 09:25:38 +0100
Message-ID: <20170302082538.dej6h3l5zfdgttj4@lukather>
References: <20170301180111.12365-1-icenowy@aosc.xyz>
 <20170301180111.12365-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0244244545554071398=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170301180111.12365-2-icenowy@aosc.xyz>
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0244244545554071398==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hecc5wjup6fbpjxa"
Content-Disposition: inline


--hecc5wjup6fbpjxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 02:01:07AM +0800, Icenowy Zheng wrote:
> ARM64 Allwinner SoCs used to have every pinctrl driver selected in
> ARCH_SUNXI. Change this to make their default value to (ARM64 &&
> ARCH_SUNXI).
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hecc5wjup6fbpjxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYt9b+AAoJEBx+YmzsjxAg768P/3Bo7ZqIEKaplKW0WJWXz4/6
wM5fBCsu4C/2HUTqp7uBjF2P3bNJLbbZ0MrcKaALaw356/w9JsL3OxMzsXVRa5m/
gr5+s50MoXNXP1xkd6T3T1CYxLTCxSA8Eee3MP0Rg0L+5QlVUOTm0+HLFYeQchtb
Rx0Bbc9ZHD8tL3DbqvxIF4mAHYCvzW9+hPFybHRKqsHRsF2FnXDMxLCU8rRHvgnN
fKKSnW0U32R3JFNjWgtW/z5kKrlYcuvaa1+kziVaqU7XYgaEXN0lYvECqhwV3DY7
a4YZx6S3Q+kKOPV3DMI8+Dg5InORrreH9MtkthZd5bIIfs8KEEaUHOniateOkkeK
bvGzBoi12zkYpKiR15bIJZE4YjvgxQwn6Ygb28GsZNKpXD1cfLxALrrtrc4QUQUh
jSF9rRYODxcfah88stNjz+T//egN4k8DOWmRbMDl/vvxk17cAwNwlogncgPZoRAg
DaM96B2gurhtnRfNOt1gamxMMH6ZMdyrir7kUvBeUj8tYqTi7Pei+GKhxnTeRWQE
4i84G3H9lAZN2XemWeRdDBqBD/fYbsGlQgz+b1KwDE7rAGSApAjf0XH/PNXZaaiE
uxeWVSvJRKM/QGn6nDMmFafXZmXry9ZFnCmQAKHWT3zh6gu1wh9WT6zzDkJAMfP2
WKPbkAWusjXiHOB5ZfdV
=1SKa
-----END PGP SIGNATURE-----

--hecc5wjup6fbpjxa--


--===============0244244545554071398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0244244545554071398==--
