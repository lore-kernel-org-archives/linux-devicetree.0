From: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Thu, 18 Jan 2018 22:26:04 +0000
Message-ID: <20180118222603.GG27409@jhogan-linux.mipstec.com>
References: <1514385475-23921-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1514385475-23921-2-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f9lFb+Z4UT82L8vr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1514385475-23921-2-git-send-email-aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Leung <douglas.leung-8NJIiSa5LzA@public.gmane.org>, Goran Ferenc <goran.ferenc-8NJIiSa5LzA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>, Petar Jovanovic <petar.jovanovic-8NJIiSa5LzA@public.gmane.org>, Raghu Gandham <raghu.gandham-8NJIiSa5LzA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--f9lFb+Z4UT82L8vr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2017 at 03:37:51PM +0100, Aleksandar Markovic wrote:
> From: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
>=20
> Document a binding for the MIPS Cluster Power Controller (CPC) that
> allows the device tree to specify where the CPC registers are located.
>=20
> Signed-off-by: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/power/mti,mips-cpc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt b/D=
ocumentation/devicetree/bindings/power/mti,mips-cpc.txt
> new file mode 100644

Is it worth adding to the MIPS GENERIC PLATFORM entry of MAINTAINERS,
given that it directly benefits it?

Cheers
James

> index 0000000..c6b8251
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
> @@ -0,0 +1,8 @@
> +Binding for MIPS Cluster Power Controller (CPC).
> +
> +This binding allows a system to specify where the CPC registers are
> +located.
> +
> +Required properties:
> +compatible : Should be "mti,mips-cpc".
> +regs: Should describe the address & size of the CPC register region.
> --=20
> 2.7.4
>=20

--f9lFb+Z4UT82L8vr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlphHvsACgkQbAtpk944
dnosoRAApbUmU9krdm+eQh/ArkjZmYh/onFKo1q9QNghYNVom4vHzCF7hRQZCYcP
6EJo6/x6JMyFwaM4/dTZ6NghInx2wrHGSbOMFbL8Il4LtlzXi2lmDoV0oX4P2SUD
+TEfbKUHoANRdq9eck8nM+heqsJkF/MZ++ykD/FUjRwkoKG9rgh7wwLaPtnHNCX1
fY6qwTxboy1gKWOfBV9kMAM7sHzztRdDbPnlOVup1MSXShCOgzK1y2GSLIdRZyl3
flTJUJojdv7OAzBKAZrqM8ldYqKLEiEkBR+APRH4OvnWHkcVtd0/iQ1ntGZVz1Hf
3XNGZARH+K1JwIfmpy4ZbeSog5dn74KjSY0dhI5wgCisOP2MGuOxwnJ2hl+nbXYF
Xa9YYbftxOw4+XiBCQPjT6euJemnXgo7pW4i7LWPk3caOic0IOlGQgQCUYZ3AHBy
03iSOBFDCHhCQSLDWY2EMTA4b5JvI/tU8qAc2yGU51U3rTG6Q4uucGHrlIaMgApZ
e9u/CFmCr0uxj9GL2enaejO44YlgG5B8Ql+94IDDCMa7D7slwcyVp5t+5Gko55fS
mAcrKo1/0LdSoy24XxmWc730WZJBxcvteCFAgnsjiC5rr/bMmzqjpWAmM3f1D6eV
vUk3q/D6KN9mIqfDJ19cvaurOsfS2gtULF3CC9uchu8iWaLFJds=
=6/vD
-----END PGP SIGNATURE-----

--f9lFb+Z4UT82L8vr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
