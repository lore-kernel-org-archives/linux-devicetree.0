From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 01/15] ARM: dts: alpine: fix PCIe node name
Date: Wed, 22 Mar 2017 09:01:37 +0100
Message-ID: <20170322080137.st3osq5ckfis6uwz@kwain>
References: <20170322020313.24338-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7556657999836502612=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170322020313.24338-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Tsahee Zidenberg <tsahee@annapurnalabs.com>
List-Id: devicetree@vger.kernel.org


--===============7556657999836502612==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qbjs2aomj5oqbcj"
Content-Disposition: inline


--3qbjs2aomj5oqbcj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Mar 21, 2017 at 09:02:59PM -0500, Rob Herring wrote:
> PCIe bridges should have a node name of 'pcie'.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

This can go through arm-soc directly. If not I'll take it.
Thanks!

Antoine

> Cc: Tsahee Zidenberg <tsahee@annapurnalabs.com>
> Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
> Sub-arch maintainers, please apply to your trees unless arm-soc wants=20
> to take the whole lot.
>=20
>  arch/arm/boot/dts/alpine.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/alpine.dtsi b/arch/arm/boot/dts/alpine.dtsi
> index d0eefc3b886c..f09f9c8e178a 100644
> --- a/arch/arm/boot/dts/alpine.dtsi
> +++ b/arch/arm/boot/dts/alpine.dtsi
> @@ -139,7 +139,7 @@
>  		};
> =20
>  		/* Internal PCIe Controller */
> -		pcie-internal@0xfbc00000 {
> +		pcie@fbc00000 {
>  			compatible =3D "pci-host-ecam-generic";
>  			device_type =3D "pci";
>  			#size-cells =3D <2>;
> --=20
> 2.10.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3qbjs2aomj5oqbcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJY0i9gAAoJEFxNi8it27zYZ0AP/2i/pW7RWLom9g8QPCN5g2f3
yVGjlvOaZmKgFP2fsaAMIbNpzFydJpRKVivEVKbP7J1BrZXQNmXioph96kktWfAl
zoq7htEbHe61M6pugee1cMvc+aosSbzDbf9qIppHM5fFJ6HsNUCqCWz4MRYUnm3U
EcivhhVBQ7sWblYqi3lFLYN6IdiBxetnOFIkCsbEnRbQ1T3jw3a27R2oY47LfssM
F/ZTalpZWXofA41UBqhhEMuRCQn9io+PUSia/QJPm8oYQj3DXpXoh6y9qadNDGti
ZlkFBBTmcpdAd7qFC0hSuMhxMJam2JaLPLUllI+511DShS2K1l2zOHLWrL+Lj+f3
8Fk9FH3Mqj7VbLXRvFShdtIFoMI7GMMRrbu3qS24tjo7WHSxdFWyqXp/fHcDBNlS
3BxVTiadV61yX3sifdGH5/MIJXSbEtpPQSYqwJy7FtOrDZPppvWfHqsyI6qC7ona
qiTUEqAytEuV/ujppPKFb2+e6S26JUOPIZuAN359IG+AZfgpHCrNkE58SQ3DTguV
PRbYwQfhHA6k77z39m1B75IJRtHzPDbMnzR1XXN6KvFtDLRfqYeqAohtJG3CyVQo
6XrHDUgbhHrji5IZIrfHsbLyIMClOm2fj4WgyVPC14UugwZbgoB5O8QPyJxbIYjw
wbTg1BH6ws02lTUiwyIP
=mTeX
-----END PGP SIGNATURE-----

--3qbjs2aomj5oqbcj--


--===============7556657999836502612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7556657999836502612==--
