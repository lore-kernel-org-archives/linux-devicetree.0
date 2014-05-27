From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8 3/3] ARM: sunxi: Add IR controller
 support in DT on A20
Date: Tue, 27 May 2014 11:13:37 +0200
Message-ID: <20140527091337.GJ4730@lukather>
References: <1401056805-2218-1-git-send-email-bay@hackerdom.ru>
 <1401056805-2218-4-git-send-email-bay@hackerdom.ru>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q59ABw34pTSIagmi"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHNPSGOAKGQEYGATTRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401056805-2218-4-git-send-email-bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Q59ABw34pTSIagmi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2014 at 04:26:45AM +0600, Alexander Bersenev wrote:
> This patch adds IR controller in A20 Device-Tree:
> - Two IR devices found in A20 user manual
> - Pins for two devices
> - One IR device physically found on Cubieboard 2
> - One IR device physically found on Cubietruck
>=20
> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-cubieboard2.dts |  6 ++++++
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts  |  6 ++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi            | 32 +++++++++++++++++++++++=
++++++

I told you numerous times already that I wanted this patch to be split
into at least three of them:
  - One to add the device to the DTSI.
  - One to add the pins
  - and one to enable the devices in the DTS.

Please address this comment.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Q59ABw34pTSIagmi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJThFdBAAoJEBx+YmzsjxAgVEQP/0SS2UMHhFf2Ma96RSvUCMja
IGjon+ErnFINm9OO7MD53SqSQikxg+wQv/gvJHo+ib2lHxJkj40MhzobSML1oE2+
hcJ3Wknbc3aPZHLJvYl+z0IcA603/CZcdbpH0WP0npB4tNGKpnONHtMBJdDjPmYp
vr01GEg/WMFW6359FY5nVusZbFBUR1aaXxA9fEUQveUGswbnXyIrT3m7j4QV0wqy
EJIflTVFpY2g+LaW8jOCAU1nC5zRB2nOUAWPhNXfmUDIwJS3elNBQ188hC6VlMNI
IyXV3yxa7qSVO38JdZ4vwInLdnNeQyuJpwS8e5VFjx6tJA7qpzo0zMArmpy44Lwg
RRgZYj6GWw8ABgLwxc8oSWOSaCPVwFFT7+poF7mRb9dLxvzzKGL7/hv3GloKiSEu
vB75kiu45oPH0rwbZlfGBVULTS4U+cyI1qq16RqRjM05+jlD0RX80nbHnw5k5CXx
jG7B6nPbS/YQcYntMIDvLrCLQHLGqY8NPR/TxB7CWMP4g6iu/1w+sgNaekiuv6/b
IQxHnyQytsxoeeBqg7Is6kvRM3p1CooJRoppJm3ZSepVgGOGvNpa0rHfS+DhzGHV
V+jLb6eiv5klWN2Z/12pF7MZPmlRVV1nQSYka3tKoMG2PVh/3AmuPU5Qhx8vRUvy
owDjGElsC1Zl7Uk/uRg/
=TAtz
-----END PGP SIGNATURE-----

--Q59ABw34pTSIagmi--
