From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mtd: physmap_of: allow to specify the mtd name for
 retro compatiblity
Date: Fri, 16 Nov 2012 11:02:00 +0200
Message-ID: <1353056520.20111.9.camel@sauron.fi.intel.com>
References: <20121107153216.GF4576@game.jcrosoft.org>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2920275971327524303=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121107153216.GF4576-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============2920275971327524303==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-+UwNshY8rJBEoNpARE1b"


--=-+UwNshY8rJBEoNpARE1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-07 at 16:32 +0100, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> linux,mtd-name allow to specify the mtd name for retro capability with
> physmap-flash drivers as boot loader pass the mtd partition via the old
> device name physmap-flash.
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-+UwNshY8rJBEoNpARE1b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpgEIAAoJECmIfjd9wqK06+oQAJkP7xk8jWbnCPhz+Nini4ai
Zp5fF9JccxCinMPFRf3b+CzgyQMMHmclE7kvtntYHKNweONBbZBE7lSS0OknKgsi
WXGqBus//El5yJCEDvv3jXwNORLz19Y27odEx6Z483OCvOsuOLt2a6OyZpQu1tzF
lzhcU+bvEmXuwLjXMxufSsXzrY2xQY97YT2gsU+Me0DhRI4BBDmUAiHJpQt6vV9W
9qFARy9zEOy+7XOjzgeH9b7wYo84bZcy9MCZA3HCVwvoueigkMoCE/TT1asoP6+e
5/TK4UhOUWddKs2HapZ2UxCbP/mED7qfwvrXVC6YPPmXI8ez8K02qYb3tWNyTrJP
7tWDoHUZXocbDBS4YUNQRVB4WAVXTtg0h2xslcBVNyDyZUoDkCFJRB/on8wpBx5e
xBSUE7DAkt15uSdiP8kM7T/nr/MyCueJy7xMzR+fZUsOEVrS/OeCAojNGpEc/+O7
CSe0Hxw8RlWKakDCtBsI2apPpSntBHMMe1xWWbsiyoYnzGNBEZoBGKyZW9MnKOiq
7LLoRzVBiebEJO25B33jTMtSVHz+1arCPfI/RrfREIEj6pC3OYO3D9YNXGnRe+SG
PVDb0GubbmhOD7t3Frbh5oUyFABuBYAc/dCN6Bvvlh0ecFWsPNKzdWX6IycxxvOy
ZxC3T+dMMxaCbwdgyVdc
=MJ43
-----END PGP SIGNATURE-----

--=-+UwNshY8rJBEoNpARE1b--


--===============2920275971327524303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2920275971327524303==--
