From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4] mtd: m25p80: Make fast read configurable via DT
Date: Sat, 25 Aug 2012 15:59:11 +0300
Message-ID: <1345899551.1815.10.camel@kyv>
References: <1345729313-10831-1-git-send-email-marex@denx.de>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9193224329069826023=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345729313-10831-1-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
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
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============9193224329069826023==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-NIFaTN8RsQYwqnzWZC6I"


--=-NIFaTN8RsQYwqnzWZC6I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 15:41 +0200, Marek Vasut wrote:
> Add DT property "m25p,fast-read" that signalises the particular
> chip supports "fast read" opcode.
>=20
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Does not compile if (I think) OF is not enabled.

drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
drivers/mtd/devices/m25p80.c:920:2: error: implicit declaration of function=
 'of_property_read_bool' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[4]: *** [drivers/mtd/devices/m25p80.o] Error 1

--=20
Best Regards,
Artem Bityutskiy

--=-NIFaTN8RsQYwqnzWZC6I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOMwgAAoJECmIfjd9wqK0DpQP/RKNBx5i/Flns+aZhkZg5qK4
2iis9i6cIxu9HFlIczNIK/QgdvEGyOAHNpv9rwvY1qwQLkZ22NCHvsfBh/KqhXsg
sNyURLXDDRvm0UxMY13v6BpXCTIdMkQPE60TTd6OzeVo1CP2PoNHVllRjyVNm9ku
w9cUkyHXzP8CqRjIXwHK1B4bcmNOLeuSWWyeQsr8UH4CMLaVqULedZw+DjwgN8Ge
LloIyPC1ivfRKHKEzF8G4cCoIgVjstAibAXhFGyKoR53YVkjg0YUOdnzKm3iQ1fg
Ghtd8esv/fGCscYc+k375N7xJ3PYn0ry95bu0Ak2OrazLIrlKlZJxt6yA+U/0jCt
NivxsmIWzvo+ldT1kfqq/QPo26joarwpJasudw1s5n1FsVSaAOBqYiUaJY6eouqb
EcxhH1LJXCoty+OMwDlJH/7yeppGQU1uNxnqBlARx9/0iE/rtRcwEMq8THssESGf
svQeczUBM2HURXghN2HE55cmO578iAm0uvFbsNuovMS2Fzq+KwjTCEGN6r2dYBzk
gaLWZaMMP946iSE8RuEeLuG/F/a7WwQ5zrmtfA5d8XUTomPoQWzz+vxN09DveIq+
/VqgMyOTn3KjQO7LGxd+jeAOUVZcnm4Ggn9wWOzAiGzLbNgpa7YJtT0pwkpdNTzE
QfzSKuuNuQH4Q3AWMmX3
=HKud
-----END PGP SIGNATURE-----

--=-NIFaTN8RsQYwqnzWZC6I--


--===============9193224329069826023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9193224329069826023==--
