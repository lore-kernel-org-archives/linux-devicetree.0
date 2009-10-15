From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [RFC PATCH 00/12] Merge common OpenFirmware device tree code
Date: Thu, 15 Oct 2009 12:00:07 +1100
Message-ID: <20091015120007.3780c59b.sfr@canb.auug.org.au>
References: <20091007041007.16890.62194.stgit@angua>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0957449617306263186=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091007041007.16890.62194.stgit@angua>
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

--===============0957449617306263186==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_Oct_2009_12_00_07_+1100_F.cmwanLGW4bt_y7"

--Signature=_Thu__15_Oct_2009_12_00_07_+1100_F.cmwanLGW4bt_y7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Tue, 06 Oct 2009 22:29:57 -0600 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> Well, I've got to start somewhere...
>=20
> So here goes.  I've begun the work to merge and clean up the OF device
> tree handling code and this is my first set of patches.  Not fully
> tested yet, but I'm getting them out to the lists so that I can start
> responding to comments and collecting acks.  This first batch isn't
> anything exciting, just a merge of common code

This all looks OK to me.  One thing:  I started in this as well some time
ago and in my attempt I was hoping to avoid the ARCH ifdefs in linux/of.h
by creating asm/of.h and moving the differing bits in there ...

I'll send out the two patches I did just to show what I mean (these are
from before microblaze was using the OF stuff).

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_Oct_2009_12_00_07_+1100_F.cmwanLGW4bt_y7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrWdBcACgkQjjKRsyhoI8w26gCgrC6aXsKjJZJN+rq7j8hhiiDb
ZK0AnRqc0bw0h1mbhMJ1vnCTuvoej99J
=ZMeC
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Oct_2009_12_00_07_+1100_F.cmwanLGW4bt_y7--

--===============0957449617306263186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0957449617306263186==--
