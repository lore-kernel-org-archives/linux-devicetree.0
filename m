From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH 2/2] of/flattree: Make unflatten_device_tree() safe to
	call from any arch
Date: Tue, 23 Feb 2010 10:25:14 +1100
Message-ID: <20100223102514.46369a42.sfr@canb.auug.org.au>
References: <20100222154816.3604.67114.stgit@angua>
	<20100222155059.3604.39718.stgit@angua>
	<20100223095118.bed93bac.sfr@canb.auug.org.au>
	<fa686aa41002221511r67c79534od562bef934c4d7a7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5836659523058924184=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41002221511r67c79534od562bef934c4d7a7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============5836659523058924184==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Feb_2010_10_25_14_+1100_QPBSvCtdVpTrOG+F"

--Signature=_Tue__23_Feb_2010_10_25_14_+1100_QPBSvCtdVpTrOG+F
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Mon, 22 Feb 2010 16:11:48 -0700 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> No reason, just wasn't thinking of that.  I've changed this.

Thanks.  Andrew Morton says that (unless there is a good reason) we
should program the kernel in C not CPP.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Feb_2010_10_25_14_+1100_QPBSvCtdVpTrOG+F
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuDEloACgkQjjKRsyhoI8zHQwCfYX3qluTEv1ODD/poMg+QSsu0
38IAn2mdbz08wt9A7bzvyFQmoB7M0/H4
=c+un
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Feb_2010_10_25_14_+1100_QPBSvCtdVpTrOG+F--

--===============5836659523058924184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5836659523058924184==--
