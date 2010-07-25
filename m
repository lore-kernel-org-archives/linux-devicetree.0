From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH] of: Provide default of_node_to_nid() when CONFIG_NUMA
	is not set
Date: Sun, 25 Jul 2010 13:07:23 +1000
Message-ID: <20100725130723.a5192793.sfr@canb.auug.org.au>
References: <20100724154331.22701.3409.stgit@angua>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2820525104410129385=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100724154331.22701.3409.stgit@angua>
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
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2820525104410129385==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__25_Jul_2010_13_07_23_+1000_RD.pz8Eexz.QQVh="

--Signature=_Sun__25_Jul_2010_13_07_23_+1000_RD.pz8Eexz.QQVh=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Sat, 24 Jul 2010 09:43:31 -0600 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> of_node_to_nid() is only relevant for NUMA.  Don't force architectures to
> implement it if CONFIG_NUMA is not set.

Why not just do:

#ifndef of_node_to_nid
static inline int of_node_to_nid(struct device_node *device) { return 0; }
#define of_node_to_nid	of_node_to_nid
#endif

in include/linux/of.h

and then add:

#define of_node_to_nid	of_node_to_nid

Where it is declared/defined for each arch ...
(it would be nice if all the archs were consistent in where it was
declared).
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__25_Jul_2010_13_07_23_+1000_RD.pz8Eexz.QQVh=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMS6prAAoJEDMEi1NhKgbshFMH/i8Aj76EKx/9C5bPwVVHExHD
pYd2B3ivu0HASm+xvMsZE+8AAsRmRrfHczhyLgQDw0SbxsvWmZKAP6bJg8KscMSF
s73yV3tvEzCZpgTtCks/PxjVjkt/MHdSgyzaD+vcW62ZKyuNFXnGOEBbnC8d/v5G
G7aQ5gFrLMLUbdoGL+C1aSRr283ur2Wdukfe5ooVgoao3EayDvZOhlxr5aF2r4nq
WsZf5is1JQqwzcDiM2PykD8ReTtE+ZG/IUBzaOUi1OsxYhOMCEJsOm+egr93++lW
HKqd/qgvyKwL2tlTAnYttTsgtQCWtA2zX16ef/Ea9kLgVeOd935Plk2pcfG6XXA=
=FG69
-----END PGP SIGNATURE-----

--Signature=_Sun__25_Jul_2010_13_07_23_+1000_RD.pz8Eexz.QQVh=--

--===============2820525104410129385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2820525104410129385==--
