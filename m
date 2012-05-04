From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: Add generic DT parsing for regulators
Date: Fri, 4 May 2012 13:26:20 +0100
Message-ID: <20120504122619.GH14230@opensource.wolfsonmicro.com>
References: <1335451941-26333-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5742232448860281520=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335451941-26333-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5742232448860281520==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D6IIOQQv2Iwyp54J"
Content-Disposition: inline


--D6IIOQQv2Iwyp54J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 26, 2012 at 04:52:20PM +0200, Thierry Reding wrote:
> Looking up init data for regulators found on chips is a common operation
> that can be handled in a generic way. The new helper function introduced
> by this patch looks up the children of a given node by names specified
> in a match table and fills that match table with information parsed from
> the DT.

Applied both, thanks.

--D6IIOQQv2Iwyp54J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPo8rJAAoJEBus8iNuMP3d0dIP/19waUA6qLnG7Eu8vuxCGzeA
v9JJO7bnz5cCnrJIR29tk+JaoQVm5t4yUzDYG5Mw3ObMh7EIZmdvj1Lj4CqD9NqG
HA47GDKIeIED41ITmEce7KYsxLaXULjoujYCteGE+yReW7T0CbpuRAu7fcchEJML
8rfQbmDIm28m3AhQ+UxR8W6vkNn4H+/Kxsa7PjnihjqvtkF8LK6Zpyb13QB7bzty
KJ55H+8URDD11lykfW0TK2nDI1lMZgA+YlmV2tEOLYyUjphkyB3oiuQq9Xt7aYv8
w1eAiuFPJzb9ws5ctivfYg+K9qSL7iCSz0BLbDrDBcbsNwlxWOQAUsnx3d8ObE7b
PlhnLzCvlD5CqW11rsHVgOzpTgCm6PE5QvGNxQbcu81tlksyff0itnj/Wh6khxCJ
UwafkEFT/Jt5JjZoaGO/hFUtXJNkPOqZIVkQQQJV/W/kb7dT8zFApVG9b0h5A2A1
/ci8+2gyUAtVoocArXZ5j5eoisVoG/JrxDFTA2XM/0ix8v5FwsKEfUdZD7PHaEoK
4NISspQ3baRDGX+VNAFocu92rQaFSO3bG5jjfSkrGxDdIH14a1ZlF5KF98GIkSyD
Yk6+9NLfNDdlQB1BjKhvffYA6D/mpVwrGBTRAPhxf1ieUvuyX85AYJ11SmzE5zTv
2CmiWnTdYliemcYtV8jc
=uqnD
-----END PGP SIGNATURE-----

--D6IIOQQv2Iwyp54J--

--===============5742232448860281520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5742232448860281520==--
