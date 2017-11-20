From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [patches] Re: [PATCH v9 03/12] dt-bindings: RISC-V CPU Bindings
Date: Mon, 20 Nov 2017 08:35:28 +0100
Message-ID: <20171120073528.xkv4cydyniuhzshf@latitude>
References: <20170927015638.19443-1-palmer@dabbelt.com>
 <20170927015638.19443-4-palmer@dabbelt.com>
 <20171005101633.GA4929@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4wgxgkaapjegjgma"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171005101633.GA4929@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org
Cc: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ron minnich <rminnich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4wgxgkaapjegjgma
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Thu, Oct 05, 2017 at 11:16:33AM +0100, Mark Rutland wrote:
[...]
> I would *strongly* recommend that from day one, you determine the SMP
> bringup mechanism via an enable-method property, and document the
> contract with FW/bootloader somewhere in the kernel tree.

Somewhat, but not quite related: Please consider making the availability
of the Supervisor Binary Interface explicit in the devicetree.
I understand that the general plan is to make the SBI a mandatory
feature of every RISC-V system capable of running Linux, but I do want
to explore the possibility of running without run-time resident firmware
at some point in the future. Thus it would be nice if the devicetree
would indicate the presence of the SBI from the start, to avoid having
to invent a way to express its *absence* later on.

It could look something like this (modelled after qcom,scm):

/ {
	firmware {
		sbi {
			compatible =3D "riscv,sbi";
		};
	};
};

This topic may warrant some discussion, because other people may have
different opinions, and there hasn't been a discussion about it, AFAICS.


Thanks,
Jonathan Neusch=C3=A4fer

--4wgxgkaapjegjgma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaEoW2AAoJEAgwRJqO81/bx8oP/RTrcMRLO4Q/b0SRw2Vd0O9B
RAVugb3t/FdPZEP7dvMNpRabVefqThxXigY4NsJ0TxXDNBxz0jMsKeM/8fuCVAQp
mJC6gZtCSyq5T1382nZS/Bgzc+vzGxg7OH0FONok76js9pOgZHxU7oZSrZwSqeBX
nZUgvKRJeyhg2KxTN2ynq/KixOOxidpSAvmuo/I8c+/6kkUOZtZohDYOS9ZXvpBJ
iOGZ/SdmoXOWat8atUjcOkQchWN8VVq68Bz0eN4hlOZC1REUmPzKfnQo3t/pG2dH
wOGzJu78j8pQhP6S7sdi4Th9KkCIytrrvCtU5gTpl2zJ8xZ6wkVw8etGMPHAbF0H
HugvlSuah39GsuU47skP+RyWZpVe6SvZmtAQt0l6jslIAbrOjUIkSnsOczVg9vRH
QfPacrBegrKvnEPhcCkXUAOtxAu7lNs2zrqSw/+YOF6jSzYA8vWdZTxmsB3YCIMA
GxG+eAoTK3B2SyNWEMfikgXX0AMR8Ahp8kvQyuIDlPcPQ3KadAYVcurLWOVF2JN7
U1m4tNOK4TG+3k+/sS431bJ+FMdC0lHx7tzBgoIcaGJPZ1OKKmEqcn6sy5KIPmzg
iMoW/WkbyLRMo8H85tV7PgXOW4ofuQ0wjAvHrlXJpznsjIrEuiTFH0TRb2FJIxY6
5CHwkOYGAftlnDMs0GjP
=7yUn
-----END PGP SIGNATURE-----

--4wgxgkaapjegjgma--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
