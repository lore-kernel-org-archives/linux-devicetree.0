From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [RFC PATCH 05/12] of: add common header for flattened device
	tree representation
Date: Wed, 7 Oct 2009 15:57:17 +1100
Message-ID: <20091007155717.8df62c4d.sfr@canb.auug.org.au>
References: <20091007041007.16890.62194.stgit@angua>
	<20091007043052.16890.15975.stgit@angua>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1954373883940136972=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091007043052.16890.15975.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1954373883940136972==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__7_Oct_2009_15_57_17_+1100_l1q47go_8v2ZubGA"

--Signature=_Wed__7_Oct_2009_15_57_17_+1100_l1q47go_8v2ZubGA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Just first obvious thing:

On Tue, 06 Oct 2009 22:30:59 -0600 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include=
/asm/prom.h
> index 64e8b3a..5f461f0 100644
> --- a/arch/microblaze/include/asm/prom.h
> +++ b/arch/microblaze/include/asm/prom.h
> @@ -17,20 +17,10 @@
>  #ifndef _ASM_MICROBLAZE_PROM_H
>  #define _ASM_MICROBLAZE_PROM_H
>  #ifdef __KERNEL__
> -
> -/* Definitions used by the flattened device tree */
> -#define OF_DT_HEADER		0xd00dfeed /* marker */

This is used in arch/microblaze/kernel/head.S, but you move its
definition inside "#ifndef __ASSEMBLY__" below.  You should probably
replace the include of asm/prom.h in arch/microblaze/kernel/head.S with
linux/of_fdt.h (assuming that the comment in there is correct).

> -#define OF_DT_BEGIN_NODE	0x1 /* Start of node, full name */
> -#define OF_DT_END_NODE		0x2 /* End node */
> -#define OF_DT_PROP		0x3 /* Property: name off, size, content */
> -#define OF_DT_NOP		0x4 /* nop */
> -#define OF_DT_END		0x9
> -
> -#define OF_DT_VERSION		0x10
> -
>  #ifndef __ASSEMBLY__
> =20
>  #include <linux/types.h>
> +#include <linux/of_fdt.h>
>  #include <linux/proc_fs.h>
>  #include <linux/platform_device.h>
>  #include <asm/irq.h>

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__7_Oct_2009_15_57_17_+1100_l1q47go_8v2ZubGA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrMH60ACgkQjjKRsyhoI8xLfgCgjMLMcFnL4KQx0ayVaDj8aQNT
TTUAoJmh6zq7NLAZ43HLqCWniBstqIor
=JH0w
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Oct_2009_15_57_17_+1100_l1q47go_8v2ZubGA--

--===============1954373883940136972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1954373883940136972==--
