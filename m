From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Mon, 20 Nov 2017 21:28:56 +0100
Message-ID: <20171120202856.nptoirhm5luiamt7@latitude>
References: <20171120195000.2070-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zfmnly5vfaibiovm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171120195000.2070-1-palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zfmnly5vfaibiovm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 11:50:00AM -0800, Palmer Dabbelt wrote:
> The RISC-V privileged ISA mandates the presence of an SBI, but there's
> no reason not to put it in the device tree.  This would allow us to
> possibly remove the SBI later.

Thanks!

>=20
> CC: Jonathan Neusch=C3=A4fer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> Signed-off-by: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/firmware/riscv.sbi.txt       | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/riscv.sbi.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/riscv.sbi.txt b/D=
ocumentation/devicetree/bindings/firmware/riscv.sbi.txt
> new file mode 100644
> index 000000000000..42384d5d52cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/riscv.sbi.txt

Nit: Other bindings use either a comma (as in the compatible string,
"riscv,sbi.txt") or a dash (vendor-product.txt, "riscv-sbi.txt") in the
file name.

> @@ -0,0 +1,20 @@
> +RISC-V Supervisor Binary Interface (SBI)
> +
> +The RISC-V privileged ISA specification mandates the presence of a super=
visor
> +binary interface that performs some operations which might otherwise req=
uire
> +particularly complicated instructions.  This interface includes
> +inter-processor interrupts, TLB flushes, i-cache and TLB shootdowns, a
> +console, and power management.
> +
> +Required properties:
> +- compatible: must contain one of the following
> + * "riscv,sbi" for the SBI defined by the privileged specification of the
> +   system.

"of the system" seems to imply that different RISC-V systems (different
RISC-V implementations) can have different privileged specifications.

I think it's better to refer to concrete documents, that don't depend on
the rest of the system, instead. Either:

 * "riscv,sbi" for the SBI defined by the RISC-V Privileged ISA Specificati=
on.

Or something like:

 * "sifive,sbi" for the SBI defined by SiFive document XYZ.


[ I know that there currently is no SBI spec, because the chapter has
  been removed from the Priv Spec, but this can be fixed later, once
  the final name of the document describing the SBI is clear. ]

> +
> +Example:
> +
> +firmware {
> +	sbi {
> +		compatible =3D "riscv,sbi";
> +	};
> +};
> --=20


Thanks,
Jonathan Neusch=C3=A4fer

--zfmnly5vfaibiovm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaEzr9AAoJEAgwRJqO81/b5aAP/2WD4PEZofUxQCXsFOrby4cg
YvmKna0iKTFbBddgDK7l+1ln5d5i/HWoXGjOk+71r+BxAW8NF+H+MNGj59tgeQYs
060hOcTpLBn3gxdNh5LWon1KBmkSzS6wGX917elTqJ97Ucjpeql8E/xq3hBOBotd
E6YxmidgfZFz0i8Dq2g25Y4ogDuDKrj8P+ewH9t9hi2huKuT1xqFlufC5o1ziajL
Rz4iBYTCryEYBB5wzZl3+g6FtS5cnmjGdMKDTp8CtczvfRp8miaZlfPIoXZtTPc8
qQr9L5jlF+AgJo7CLARnBY7Zrln5uQ33/bnL8JfMn2K05Og+Ev8mV7H/0tiHxX+4
jhrPBaUjzdUkMtug5OC2EGXqKDvgXeyhC7WBOIUkZE3JhcT/MmQCpL+0gG9elJ2A
74H4CYv6xNF0Yn1CNoFvtVjnMkRdzU9nSTHY5ZDr349vXe7mPdBpNsKr3xxmSZ5u
Pn4l5Xpc8CL5Udrh55U0h2mgtFalojHIfoS0Bw8lMnB6AvD6h0W9zgOOpD7ZTCzu
d0ca0hQSGr/0T661BP1H1G+ci5pMeTLcvoOLpgCpTsl6ieqhXA0xHp3098MaYxTF
NzAFaZ9gZDWLOefP9czL+yQKT1jo5tFev1BNNHsRw4RF0TtdLcwGTGU82FrpfZ+C
X11lhKoaNvhZ4dBZmFfq
=IYaV
-----END PGP SIGNATURE-----

--zfmnly5vfaibiovm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
