From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Added license header to dtc/libfdt/fdt.h and libfdt_env.h
Date: Mon, 4 Feb 2013 20:19:54 +1100
Message-ID: <20130204091954.GD5535@truffula.fritz.box>
References: <1359582686-32755-1-git-send-email-jsobota@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4378706137342593006=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359582686-32755-1-git-send-email-jsobota-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Justin Sobota <jsobota-l0cyMroinI0@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============4378706137342593006==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Needs a commit message and a signed-off-by.  Otherwise looks fine.

On Wed, Jan 30, 2013 at 04:51:26PM -0500, Justin Sobota wrote:
> ---
>  libfdt/fdt.h        |   50 +++++++++++++++++++++++++++++++++++++++++++++=
+++++
>  libfdt/libfdt_env.h |   50 +++++++++++++++++++++++++++++++++++++++++++++=
+++++
>  2 files changed, 100 insertions(+)
>  mode change 100644 =3D> 100755 libfdt/fdt.h
>  mode change 100644 =3D> 100755 libfdt/libfdt_env.h
>=20
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> old mode 100644
> new mode 100755
> index 45dd134..4f28b55
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -1,5 +1,55 @@
>  #ifndef _FDT_H
>  #define _FDT_H
> +/*
> + * libfdt - Flat Device Tree manipulation
> + * Copyright (C) 2006 David Gibson, IBM Corporation.
> + *
> + * libfdt is dual licensed: you can use it either under the terms of
> + * the GPL, or the BSD license, at your option.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + *     You should have received a copy of the GNU General Public
> + *     License along with this library; if not, write to the Free
> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> + *     MA 02110-1301 USA
> + *
> + * Alternatively,
> + *
> + *  b) Redistribution and use in source and binary forms, with or
> + *     without modification, are permitted provided that the following
> + *     conditions are met:
> + *
> + *     1. Redistributions of source code must retain the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer.
> + *     2. Redistributions in binary form must reproduce the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer in the documentation and/or other materials
> + *        provided with the distribution.
> + *
> + *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> + *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
> + *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> + *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> + *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> + *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> + *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> + *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> + *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> + *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> + *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> =20
>  #ifndef __ASSEMBLY__
> =20
> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> old mode 100644
> new mode 100755
> index 956b4ae..18de839
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -1,5 +1,55 @@
>  #ifndef _LIBFDT_ENV_H
>  #define _LIBFDT_ENV_H
> +/*
> + * libfdt - Flat Device Tree manipulation
> + * Copyright (C) 2006 David Gibson, IBM Corporation.
> + *
> + * libfdt is dual licensed: you can use it either under the terms of
> + * the GPL, or the BSD license, at your option.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + *     You should have received a copy of the GNU General Public
> + *     License along with this library; if not, write to the Free
> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> + *     MA 02110-1301 USA
> + *
> + * Alternatively,
> + *
> + *  b) Redistribution and use in source and binary forms, with or
> + *     without modification, are permitted provided that the following
> + *     conditions are met:
> + *
> + *     1. Redistributions of source code must retain the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer.
> + *     2. Redistributions in binary form must reproduce the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer in the documentation and/or other materials
> + *        provided with the distribution.
> + *
> + *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> + *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
> + *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> + *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> + *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> + *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> + *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> + *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> + *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> + *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> + *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> =20
>  #include <stddef.h>
>  #include <stdint.h>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEPfToACgkQaILKxv3ab8avWACfYfbCFpj0JmgjFX8zGas8kk1T
IJIAniYQoJO+OqlhfdoXAUhyAdVGhCSK
=rBvP
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--

--===============4378706137342593006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4378706137342593006==--
