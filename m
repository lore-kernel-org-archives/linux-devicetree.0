From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3,2/5] dt-bindings: mt8173-mtu3: add devicetree bindings
Date: Fri, 10 Jun 2016 12:21:33 +0300
Message-ID: <878tyd761u.fsf@linux.intel.com>
References: <1465543962-11678-1-git-send-email-chunfeng.yun@mediatek.com> <1465543962-11678-3-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465543962-11678-3-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> + - enable-manual-drd : supports manual dual-role switch via sysfs; only =
used
> +	when receptacle is TYPE-A and also wants to support dual-role mode.

sorry, but this manual-drd can't be accepted. You should rely on a DT
property for this and you shouldn't expose it to sysfs. Use DebugFS for
that.


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXWoadAAoJEIaOsuA1yqREbN4P/3KBKT4Tx5OYwi7vf4VcqrBR
KcBALX/2hzUGzgJBUwvxrSpLfQbUoyHoninp780gLG8/8hZvFQ9TUQybTigkFQcP
QtLJzndtIrqzlf3DMCFIa5C7xFtgsJrZyz4//2DQKa2MpJR9/+1d9+L7S4AOSeC7
55rvVu0uTQcL8jAr3FlNcMES7ZMDaoL5fpEo1O/rSvW3ZWZ+h7Ws43USr/xQ2M3L
T1hU0Q5z10FlawWlhpVow/7Figtk/+9gywdiUPyrcHGQgpGFzlg4Rqyr12EvH4Vi
zg2+QZsgV9Dfmhgr76quG2wdhNi/6IwooKSDaiEbz8DZHGXEnPkNsFY1a8ls+SBG
TmEkIWRaV+/b0qd2wcNz8mdo9ULVr0m9Zka/2ABXZse2xFXQAdrTezYvGZ37neEP
XgiWCD5ozWsdHJE3UqtHw9wUy0J+Xxw41UMMgkTX5Y2xophXovA5E7LiqCXvzDFW
rPNW0mrabBpGiCw28ykt7chkDogDjYy94L1DMV+7TI1pPke80m9H5JTZBlEJIito
XfAgfEVuhh0Jx35l9boQPxeuQgOD+3FjdJRQ+6KeQ+7nDU+ACuP7IN6Pb1PRPArj
+lX6iF6FXoYqg66r6JCekt5ASBlUZzA/KUKXgdqxguWALCc9Z3UUbumf3vfajFbd
uZKWnHRmRgLguvO3j19b
=pQfN
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
