From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/6] resource: Extend the PPC32 reserved memory hack
Date: Tue, 23 Jan 2018 17:37:39 +0100
Message-ID: <20180123163739.2sxhzavghzgbjw4c@latitude>
References: <20180122050411.32460-1-j.neuschaefer@gmx.net>
 <20180122050411.32460-2-j.neuschaefer@gmx.net>
 <871sigwx41.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n5tgjbf2wsepvrep"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <871sigwx41.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, devicetree@vger.kernel.org, Albert Herranz <albert_herranz@yahoo.es>, linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--n5tgjbf2wsepvrep
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2018 at 11:58:06PM +1100, Michael Ellerman wrote:
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> writes:
>=20
> > On the Nintendo Wii, there are two ranges of physical memory, and MMIO
> > in between, but Linux on ppc32 doesn't support discontiguous memory.
> > Therefore a hack was introduced in commit c5df7f775148 ("powerpc: allow
> > ioremap within reserved memory regions") and commit de32400dd26e ("wii:
> > use both mem1 and mem2 as ram"):
> >
> >  - Treat the area from the start of the first memory area (MEM1) to the
> >    end of the second (MEM2) as one big memory area, but mark the part
> >    that doesn't belong to MEM1 or MEM2 as reserved.
> >  - Only on the Wii, allow ioremap to be used on reserved memory.
> >
> > This hack, however, doesn't account for the "resource"-based API in
> > kernel/resource.c, because __request_region performs its own checks.
> >
> > Extend the hack to kernel/resource.c, to allow more drivers to allocate
> > their MMIO regions on the Wii.
>=20
> Hi Jonathan,
>=20
> Sorry but I can't merge a hack like this in generic code.

Makes sense.

> Has anyone looked at adding proper discontig mem support to PPC32?

I'm not aware of any such effort.

Do you have any pointer on how to implement discontiguous memory
support? CONFIG_ARCH_SPARSEMEM_ENABLE seems relevant.

> Or can we punch a hole in the resource in the right place? Maybe from
> add_system_ram_resources() ?

Not sure. add_system_ram_resources would need the original memblock
table, which is overwritten in wii_memory_fixups, if I read the code
correctly.

If a proper solution doesn't take an overwhelming amount of work, I'd
prefer a proper solution.


Thanks,
Jonathan Neusch=C3=A4fer

--n5tgjbf2wsepvrep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaZ2TMAAoJEAgwRJqO81/b6P8P/2PFc+LvG2SE+jjBkkkikVEx
Q27V5EieuGFEovgphDam8xDGVHC63KjH7PhjaxiFW6WU6fY7mV0zWw0SeFYX4amu
85CI3UrBEyUhfN/Xq6ZyP6ua3U6AoJ3Hmm/vZ/be7UDYpF4QGq2UPR4JV0s/HQi9
PPUm4QAgN1XGsXdlkOTTuLu12nOqIQ5N1J2bqoZZ2/vxqbFxStTlorNFSqPvW4up
wzVcsbAE39A8eeFWCKFftcYnrRD0zHtLcj+9ERgs/DWmSL5x9w4lduS0lIfLjJ2A
DV7KLjCXc2VvM06TZzIb3bZqdGR90M/2ixbDWtkUTtATt12G5WQ+V6yQtZ8o6r41
gGQ4+AAYojHU9mclui2DXzan8aaJVmNqpgpf1BPvu0zN5fAwnvQTwybtIXwq9nLJ
adta96ympBAHZiVpDrZMMG74jfqcv7EJimv5VPdzhuclIJQ8+qW4fn65FmWsJDsT
98CV5oDS1OkM2p8w8AZOEa85KC5sGaSWMQCa2DeJ/jvnZ9iVQDmAqpfYNl2ohQT+
y3ogKgZ5YHgibINEN0865NeQkKlxHAynQLRfzXvIW1tg0e67ZTe9FxwpbMcyBdN9
IwIXxCLuKO1c6i5euFNjrfv5NnAQID3ESGKvj580p7CNGxI+RkcY6588cwvTmAfM
2rRFPDVXTriiAGuxYVI8
=c+mt
-----END PGP SIGNATURE-----

--n5tgjbf2wsepvrep--
