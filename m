Return-Path: <SRS0=Y+yZ=SO=jmondi.org=jacopo@kernel.org>
Date: Fri, 12 Apr 2019 09:03:38 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: rcar-csi2: List resets as a
 mandatory property
Message-ID: <20190412070338.5n6cs55pkecwglnu@uno.localdomain>
References: <20190312234930.23193-1-niklas.soderlund+renesas@ragnatech.se>
 <20190312234930.23193-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kohb6q32x453fa7o"
Content-Disposition: inline
In-Reply-To: <20190312234930.23193-2-niklas.soderlund+renesas@ragnatech.se>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--kohb6q32x453fa7o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, Mar 13, 2019 at 12:49:29AM +0100, Niklas S=C3=B6derlund wrote:
> The resets property will become mandatory to operate the device, list it
> as such. All device tree source files have always included the reset
> property so making it mandatory will not introduce any regressions.
>
> While at it improve the description for the clocks property.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.tx=
t b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> index d63275e17afdd180..9a0d0531c67df48c 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> @@ -18,7 +18,8 @@ Mandatory properties
>
>   - reg: the register base and size for the device registers
>   - interrupts: the interrupt for the device
> - - clocks: reference to the parent clock
> + - clocks: A phandle + clock specifier for the module clock
> + - resets: A phandle + reset specifier for the module reset
>

Verified that all users in mainline of this bindings already contains
a 'reset' property:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>  The device node shall contain two 'port' child nodes according to the
>  bindings defined in Documentation/devicetree/bindings/media/
> --
> 2.21.0
>

--kohb6q32x453fa7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlywOEoACgkQcjQGjxah
VjzdcQ/49g4XgS0i3j0gVBBy3zo9Ux91vgIiPiUsibF/TxDTvkwJutzlRvxDpb9I
9jX7Vu/73CIwerHlcMHF/JrR9xFMsJCQ1bv3dBvA2HOx3vqCudns04C6hAam5izS
OI+in6KOENSeKeXPu58CdVSrgDbmspB9irg6pkKU96MswvjX3G9Vt78ztJ4uVbPU
i0RtsWe6uofYQGZ3toV7/stiZFoUOkFUUEzPc2MOGl3LjLkOaaoM8iOnVXPlPhxx
++10/HyMWhC3TkLCWmI0HPm8E1vkULjJ8EqowUZ3LhUFd0CVZEvG+sBnbGESQRXA
xzQYxIivddnC7iDEjLpN3WFwKAQ653vPiqzUv3lVOpd5vIfdyLPTc1GiJ5cm7ziQ
Cz+H38Oz6uyuMs2PmPLQBsmqdBp4WVhunzECe0xX4ycL3/6zNL6rM6IaqVi8eVCk
PoXJwOAXhveLrhskIteaOupkjAwL5G5QCk+9W4Gd3efiFnUU0OVRfJni9tUVmEom
uHE24H7vMZNyamFeUHAijC2K7mKs9JWtN0KW/uyJZej+D05XGxoFcT3wuAWiS3Co
ByW/leUl0sC66enqgRWG9gEMBvTUz+mvJvHk2epfYwHiK+SyL5p5yYPm0GNm/Ens
KFEVxDM0jPmh7Fo4hT2+qwAdiRs58BHr7RYDIbZRILOIKPB1hA==
=dLsB
-----END PGP SIGNATURE-----

--kohb6q32x453fa7o--
