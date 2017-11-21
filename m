From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Tue, 21 Nov 2017 02:08:44 +0100
Message-ID: <20171121010843.4nmndskaoslqcyyh@latitude>
References: <20171120202856.nptoirhm5luiamt7@latitude>
 <mhng-4a3ed3c5-a562-427c-817e-cd897789d5c0@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kuoznduu6gtgogwf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <mhng-4a3ed3c5-a562-427c-817e-cd897789d5c0@palmer-si-x1c4>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org
Cc: j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kuoznduu6gtgogwf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 01:28:01PM -0800, Palmer Dabbelt wrote:
[...]
> > > +++ b/Documentation/devicetree/bindings/firmware/riscv.sbi.txt
> >=20
> > Nit: Other bindings use either a comma (as in the compatible string,
> > "riscv,sbi.txt") or a dash (vendor-product.txt, "riscv-sbi.txt") in the
> > file name.
>=20
> That was just a typo, I'll fix it.

Ok

> > > @@ -0,0 +1,20 @@
> > > +RISC-V Supervisor Binary Interface (SBI)
> > > +
> > > +The RISC-V privileged ISA specification mandates the presence of a s=
upervisor
> > > +binary interface that performs some operations which might otherwise=
 require
> > > +particularly complicated instructions.  This interface includes
> > > +inter-processor interrupts, TLB flushes, i-cache and TLB shootdowns,=
 a
> > > +console, and power management.
> > > +
> > > +Required properties:
> > > +- compatible: must contain one of the following
> > > + * "riscv,sbi" for the SBI defined by the privileged specification o=
f the
> > > +   system.
> >=20
> > "of the system" seems to imply that different RISC-V systems (different
> > RISC-V implementations) can have different privileged specifications.
>=20
> Actually, that was intentional -- I wrote it this way because different
> RISC-V systems do have different privileged specifications.  The RISC-V
> specifications aren't frozen in time, they're just guaranteed to be
> compatible in the future.  For example, the user ISA document has been
> updated multiple times (the C spec, eliminating some unspecified behavior)
> and will continue to be updated (V and other extensions, the memory model=
).
> The privileged spec will be updated in a compatible way just like the user
> spec will be -- I know there's at least hypervisor support in the works, =
and
> I saw some things to remove undefined behavior go past as well.
>=20
> In a similar fashion, the ABI and SBI will continue to evolve.  For examp=
le,
> we'll probably add new system calls to extend the user ABI and new hyper
> calls to extend the SBI.

My problem with the wording was that the OS somehow has to know which
version and variant of the SBI it is talking to -- either through
in-band communication (an SBI call to request SBI information, etc.), or
through devicetree or similar mechanisms.

>=20
> > I think it's better to refer to concrete documents, that don't depend on
> > the rest of the system, instead. Either:


Thanks,
Jonathan Neusch=C3=A4fer

--kuoznduu6gtgogwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaE3yTAAoJEAgwRJqO81/bgoUQALiRczHL4V5hCqRjiIFNEt2M
um/4Az9jtVPSMYpIP5jc4iYGqwZ7S/0k38wNR3cg4StLSCNFG9fZK7X4oefWWTjo
ZMB4c2I2twrse6mMmNSbEGKCOJ/sR40Uk80EocTC/PFOfNYhEcrT1i5kLqZC+gDx
XqHwOM0mFJbXpj0KW+P39Vt8P95sFLI669NuIe9ymtNborT1hLwGCgMcm7Fv9Xyh
5jGmtWkYwwrlPTYnDKq4ZJuhRgz1yNsZLb/QiF4HklSBeXSfjmh7E09Urn+/eZSl
zdIFu/96GE6nvkHY3+ZmegH8OiV0kaqw4/WiyKhHS2itWGwI+81ussY3DIuCi3YC
ojv7wMJgwgUhJc83PC3jGiv6kzojp3ssw18CCr2NXwAjlXrgMi0qGCKVy9k3DTX6
6BBMV50BFLy41QXKyrJY6oOLwR2jHVWmfYSa9AhBawZ1Gz3WiEjm4GQl8SqY7Wg+
p3lX+C2gSkbym0TaLcBgveHd3NsM1QbmUO9y9LplL2hhh8yuq0Ce5S6F8rV0iuQW
7HJ9PNux84EBmdhJvORKmx5ZLTgxZAwL0u5zTpYoIgs/o2CjprN9mAqgNoQO5zJC
xbKnciwRXWqxE9rf0T94E3nis/hwbUK9ZhTwUW2DCjPwAl8BHeowFuvoIXuq8GIn
tDL8TIIn04e3U9THiDtM
=4dtp
-----END PGP SIGNATURE-----

--kuoznduu6gtgogwf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
