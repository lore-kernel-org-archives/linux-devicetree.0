From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 4/5] usb: phy: load usb phy earlier
Date: Tue, 10 Feb 2015 08:49:25 -0600
Message-ID: <20150210144925.GD16711@saruman.tx.rr.com>
References: <20150210070424.GC32709@shlinux2>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150210070424.GC32709@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2015 at 03:04:28PM +0800, Peter Chen wrote:
> This patch does not belong to phy, so, doesn't need to
> add phy in subject, meanwhile, please add GregKH as TO list,
> he is the right one to queue this patch.
>=20
> Reply-To:=20
> In-Reply-To: <1423554627-694-5-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> On Tue, Feb 10, 2015 at 03:50:26PM +0800, Zhangfei Gao wrote:
> > Since phy is definitely used in usb controller, load the phy
> > earlier to make boot time shorter.
> >=20
> > Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

NAK, make sure there are no such dependencies with your controller
driver. They should know how to defer probing if their resources aren't
available yet.

--=20
balbi

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU2hp1AAoJEIaOsuA1yqREqiIP/jpxzpaBjMcjIJcaJYrY3hMK
2BH5lT+JXL2qjF2GRvUA20oSTSwFC++UW5QJkLenJ92Dd+yj7sWG5PQCJDBHEGhd
P1Fm56dil/EEyLiuF+NVg0yu/klgSRn/KWYlxdds3mCwmBuMdFw/lPNGK5iPSoOf
qcx/IF0WRncJrUckx2MHu4Er1SGkfmGEFOzv/dcnd4NlBhBaVQjG4SCp5ZsFdrO4
6fek68zW8AW6F6n2TUmN1CGpM5AYPlKwPSWzkZYRRmOCjz209nmQgo72GV6h8anX
4nFcGIMyV5H790WjjZMhF2sS6xHcPsdrDSfxqVksjreDBvilqc7TUH2TjbrcamH8
taxI/pkLruXtePAFWyya8EfGa9aEJ3oLZKbYq0YSdTa0zuOaq1fNIYhxCg5eOOR2
99bpDEGBQsRLgRVXr8ADr/iATd6sxzy0ELxUykXZRTfLhMAPjm3x67IamYtc4FX2
d16tfTDD4EEnTzyAnJV0YJtPLv/tm2vYDj3Q81/RAbtI/CV2ZpFTQE2EY2lv2wgN
968DNXqKovnh2bm3J04K5C6JMIeyr7ipDuq8JwFoAB/+GF/X4CBI1b2zOs/c9Z6w
BlJ4J8UYcZbKqNZbdivu5HwJzBeIqjprJNXjkuTUHqTFtj0EkiKwmOVsO7CPlh4c
l11pUAGj8Jz1S8cOWuJE
=y7I7
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
