From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun5i-a13-empire-electronix-d709: Remove
 mmc2 node
Date: Fri, 11 Mar 2016 11:10:09 +0100
Message-ID: <20160311101009.GX8418@lukather>
References: <1457645884-10282-1-git-send-email-hdegoede@redhat.com>
 <1457645884-10282-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGW1X6pRZ+lkBpGQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457645884-10282-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qGW1X6pRZ+lkBpGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 10:38:03PM +0100, Hans de Goede wrote:
> The empire-electronix-d709 does not have an emmc, it uses nand, the
> mmc2 node in the dts comes from a copy and paste error from the
> inet98fv2 dts, remove it.
>=20
> While at it also do s/inet98fv2/d709/ to fix some other copy/paste
> leftovers.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Queued for 4.7, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qGW1X6pRZ+lkBpGQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW4pmBAAoJEBx+YmzsjxAg7NIQAKAHV+8COTtB6qUP/U3jDiSu
3zyh4Oqss9JTVTYs5oD9Twnru3C7cLu69kF/Z3XmQyVji5sHiQAJGF+oy6zDfYIT
+75tHY2zhImbVVUDcokfm1NDtfMsUzwzfx9tyKus6WnEx1wneoS7ohc8cu44rHfm
gziDqpG2mAJCXmM83wfrSBGPfBD8quG6kGoWrjT9tn5pY8yzfqCVB+92rqN0lGKJ
lXeU7KUN0a6GB0k0lIuOwctmp/jDmjj855fro7IHpQJb4HK/+qo6zxM9x0xgAxpf
Uk6ambxtCo2s4ewsJk8ADzcxwuq3wOAZ/WPtputYWFPOG6C57menHBOe7Mn9AMtP
VU7ezfKhGgP8rqcOJN19rYU/SjZE3/2S1PrlTaHZFRxZuNv6qJ9NyqeDUJeeTjcK
JgEEtCYB0KhyYn5Vn3+rwmmGj4MoGlkifofpoQ3xXfKbzmkQXVtdhNcS7Gpk5Vq7
erYaoLxNN/J2xrXl/FUKV8cMACdCNqT/0r9A3/LU6fy/PdvXJgn9mTLxY43YUaUy
tL3G7Dfk0SJXbfYhI5iXyoesPQmvomu+Wb8UQ3uXLMu+urXTXrRR1xKgpsqeWOB4
2zF4BH2vbrMoaeK8f0fyujSLnfqb0vLPqvYlJDW0xvHsxkSz5unpjzAWqqPNDVSg
hEVjo59ght1pjyv+0YpU
=pqie
-----END PGP SIGNATURE-----

--qGW1X6pRZ+lkBpGQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
