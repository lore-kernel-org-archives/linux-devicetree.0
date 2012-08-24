From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: physmap_of: Add "no-unaligned-direct-access" DT
 property
Date: Fri, 24 Aug 2012 18:08:44 +0300
Message-ID: <1345820924.2848.320.camel@sauron.fi.intel.com>
References: <1345209752-22938-1-git-send-email-sr@denx.de>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9003120099762644844=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345209752-22938-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
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
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephan Gatzka <Stephan.Gatzka-bZ2w1f/VHjk@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============9003120099762644844==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-SXi7hJe3oqhDPZFOVX6r"


--=-SXi7hJe3oqhDPZFOVX6r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-17 at 15:22 +0200, Stefan Roese wrote:
> On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause
> problems with JFFS2 usage, as the local bus (LPB) doesn't support
> unaligned accesses as implemented in the JFFS2 code via memcpy().
> By defining "no-unaligned-direct-access", the flash will not be
> exposed directly to the MTD users (e.g. JFFS2) any more.
>=20
> Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-SXi7hJe3oqhDPZFOVX6r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN5j8AAoJECmIfjd9wqK0mIIP+wZdIF3Yp0dnJcmuS7QabS4W
2ZvgAcU5azo9ZYtaVS6+DfsJcRMmfPqu0vfny7ScjgydzUqww2lbitn8OL3xW9Oo
Su1u+WuBSVagR++GVw1RyetwlcgPAMvxSArlyIqNNpfPxMB5+KsKi0JxnSD4mw0m
swpTN9Fcq+/QfyWn2wEruIJov99nvofCTLOVVT1FXxIlvxiSYxGjXUkd40NKzJBA
eLvB9SGFiVEdyeLgPXNGe5gnQbjdK8uI1NBLYoeSgzd/KuYG9ezqzJ5JEHGc4mwO
n+tBFrR160EF4clDNB//m5t8ltkCnvaHOoAOVo3SACiUSt9rrGHxFxObIsOeBV+U
Jw4k75y8r9bDedBMAM8F0J5jJxiw29Y7yPw5B03I/iTrjBKhaJqVTUldQibgle8H
XLwvTZ/9nlzcwgIZqijcmmn4hfOgZNwJwV2V2qD+TWEnzu9T0YY8b6+uY8EimAkl
zxAvz8pRHnltxIENxh9dJHn30LDRqDYEEGgLzHM0DhN6YzXSqr1fM8NlqgJ4LZbK
2FsxWeI0nZHFlVsMGrfTMx5wi3qdB/2bcZ+XLgm2Br8BR47dNv8VUvtp1Ojuzd+l
1EBSwGT+r14Y7af2wqJNuChKzhdBt+Ds3KIkq6TySLuA4l4UJTHm1fw3AYMLsRXe
da7WHb7oJfIQqiPVHXx5
=Lz4X
-----END PGP SIGNATURE-----

--=-SXi7hJe3oqhDPZFOVX6r--


--===============9003120099762644844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9003120099762644844==--
