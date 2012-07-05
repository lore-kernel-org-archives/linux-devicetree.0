From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: add DT tree to linux-next
Date: Fri, 6 Jul 2012 08:45:46 +1000
Message-ID: <20120706084546.c93b3767c4d58ccf48b12b9c@canb.auug.org.au>
References: <4FF5BD9B.2030902@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6717122333960985568=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF5BD9B.2030902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6717122333960985568==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__6_Jul_2012_08_45_46_+1000_e=SMTv/aypZyDMQT"

--Signature=_Fri__6_Jul_2012_08_45_46_+1000_e=SMTv/aypZyDMQT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 05 Jul 2012 11:15:23 -0500 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>
> Can you please add this tree to linux-next. Normally, DT has gone thru
> Grant, but he is mostly offline for next few months.
>=20
> git://sources.calxeda.com/kernel/linux.git for-next

I have added this tree from today.  I called it dt-rh and have you listed
as the contact.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Fri__6_Jul_2012_08_45_46_+1000_e=SMTv/aypZyDMQT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP9hkaAAoJEECxmPOUX5FEy6gQAJjh7b6bPkMXeQ8BDR2N2RiJ
GXosLo3RKwgbvEsaz8MkmJg1B39pJeQbSq+h2ht3X6Ng6mEJdlFxpvXJjxjvmkX9
oFgt9jrON4EdTqRxLZVgM7zt/3HFvg8lp528IdwbM3SnV9B8eCdgbBNPqwXFDmpO
Hg17vUPQ197x0sFOpqqmBBZzMaf8M5ErKUGNaXHVt/HXPny+rlp9TpS2W+KAPOPr
TYve2LnivcUxvI6uBlCOfWD8VSsNV3ZdYvJ8o2tEUMeLAxcCkfp4wvOEz5JyIlwK
TZWCBDCki4ir2gyMjigmWtmfGHzIsqBci3vOj4DypXiftmJloUQszbBo2AP7MNjr
LjnkXEunaB4RISRHf7kbF7u+mzc8T0tUbF4epGI7xHLgk1QeoXHYZQIDuRagNOUS
YFIZfKXVLER8tx+sHKnXKFm5YoeCsYOR+ZVCoblW9VCsJNv5aPnmAZZwkUkRkt6/
6RzU7aCzzMAzwKDQgTNZ2jbF0/HHFBs8ioX6lEWRYxAcNOqGushOvlsfgwY05vzX
fw/+rLdZQncmKc5shaSezUhnIoUujpu8bg+uTjyvuWQkPLSTZvw8b3gm/I6ioB4b
ILtTj16vaQ3h7r4o1EJkug5U24tWR9rVR0KvXWQv/EGt2ff9ZLtrZ58wH7U3/lJF
XDTwNw+wkFIGmUG0F4gP
=4DA5
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Jul_2012_08_45_46_+1000_e=SMTv/aypZyDMQT--

--===============6717122333960985568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6717122333960985568==--
