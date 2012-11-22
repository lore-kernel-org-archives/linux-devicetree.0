From: Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Thu, 22 Nov 2012 12:43:52 +0200
Message-ID: <1353581032.2701.34.camel@sauron.fi.intel.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
 <1352978534.2221.33.camel@sauron.fi.intel.com>
 <518397C60809E147AF5323E0420B992E3E9EC70D@DBDE01.ent.ti.com>
Reply-To: artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4252833752739991956=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <518397C60809E147AF5323E0420B992E3E9EC70D-Er742YJ7I/eIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
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
To: "Philip, Avinash" <avinashphilip-l0cyMroinI0@public.gmane.org>
Cc: "Mohammed, Afzal" <afzal-l0cyMroinI0@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hebbar,
 Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ivan.djelic-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org" <ivan.djelic-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============4252833752739991956==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-2MrpRPtoMgLrBm2h1KYK"


--=-2MrpRPtoMgLrBm2h1KYK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-21 at 07:01 +0000, Philip, Avinash wrote:
> > I am not sure how this dependency has to be handled for this series,
> > let me know whether you still want it to be made over l2-mtd?
>=20
> Artem,
>=20
> Is it possible for you to give ack for these patches so that these patche=
s
> can go in Tony's tree where Omap-gpmc changes are present?

I would prefer if people like Ivan could take a look at this first.

Also, I am not sure this is a good idea. Or at least we should agree on
some common strategy for bit-flips in the erased areas:

"+ * 1. If page is erased, check with standard ecc vector (ecc vector
+ * for erased page to find any bit flip). If check fails, bit flip
+ * is present in erased page. Count the bit flips in erased page and
+ * if it falls under correctable level, report page with 0xFF and
+ * update the correctable bit information."

Basically, you are working-around JFFS2 limitations.

Do you suggest we do this in all the drivers?

If we want to do this, may be we better do this in higher level, common
to all drivers?

--=20
Best Regards,
Artem Bityutskiy

--=-2MrpRPtoMgLrBm2h1KYK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrgHoAAoJECmIfjd9wqK07ukP/36SzpGO7EdRk3F81tMxDktZ
S4UvO+qgJI9Z/sk8/ZVoO3y5tRM2PG1GktHLnhhKRYhyR4J/47szPhEyIXJKO4Z4
w4mHI3aTvCDxbVhSq0wITel68w4Ka5Ap8E+ClDcbh18kj33rSaY+v2hXbjqZbQPB
CTW7eG4YiGnST46bCxm4CggMBT54pgyxbFAhMcIYGvga8inHj5aj2GwwFzLU4lRo
MGQnIfXezvIJ0+/KJQ19rqUe4uegijIOrUQQSI6BEk0z3Hd25pO3ObO93mn+hQ1n
QXEMldOPCA4xhTl0E6In+XuKtjE+Y/ioUOejklvWpu8K63gJoAwOwI+dFn2Ddp+T
WSu9MT0D46pzns5P5wV9reTJzDBKTPNk712v2901rHcmYcu1PA77kpntd2RwkYkV
UXFomLKU6eBCBoQpUz5f74cDDebG4JNGsyuEAWJC5Kg9SqOZTvEDs7v/clIJK1K0
8AkNQjqtudjHx2U9UrDVsabz8mcwTtFuQaEN4igFrlvyHve9YddgtP+NclzMO476
L4spCJwbwoDvBkb5P/uP+1cbjfTsDdBp0Rknl7pc+QYXA8OiFO9+xyMII0+0aOSO
9wX5Gw+iISFMDBZcrsTpn7wDmO8MJGqHFp7W7Cv9iPaLVQhNtOCe8PhZ4SH3QLGI
WodD7fIYlznWzHacA87B
=+xcw
-----END PGP SIGNATURE-----

--=-2MrpRPtoMgLrBm2h1KYK--


--===============4252833752739991956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4252833752739991956==--
