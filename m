From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv3][ 1/5] fbdev: Add the lacking FB_SYNC_* for matching
 the DISPLAY_FLAGS_*
Date: Tue, 29 Oct 2013 12:35:11 +0200
Message-ID: <526F8F5F.6050905@ti.com>
References: <1382532229-32755-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1342703451068469403=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1382532229-32755-1-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis Carikli <denis@eukrea.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>, Shawn Guo <shawn.guo@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1342703451068469403==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="M3RuJJDxIdkQLEu14hjOVaGFbiHXvFtdf"

--M3RuJJDxIdkQLEu14hjOVaGFbiHXvFtdf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23/10/13 15:43, Denis Carikli wrote:
> Without that fix, drivers using the fb_videomode_from_videomode
>   function will not be able to get certain information because
>   some DISPLAY_FLAGS_* have no corresponding FB_SYNC_*.
>=20
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Eric B=C3=A9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
> ChangeLog v2->v3:
> - Added Jean-Christophe PLAGNIOL-VILLARD's ACK.
> ---
>  drivers/video/fbmon.c   |    4 ++++
>  include/uapi/linux/fb.h |    2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/video/fbmon.c b/drivers/video/fbmon.c
> index 6103fa6..29a9ed0 100644
> --- a/drivers/video/fbmon.c
> +++ b/drivers/video/fbmon.c
> @@ -1402,6 +1402,10 @@ int fb_videomode_from_videomode(const struct vid=
eomode *vm,
>  		fbmode->sync |=3D FB_SYNC_HOR_HIGH_ACT;
>  	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
>  		fbmode->sync |=3D FB_SYNC_VERT_HIGH_ACT;
> +	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
> +		fbmode->sync |=3D FB_SYNC_DE_HIGH_ACT;
> +	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
> +		fbmode->sync |=3D FB_SYNC_PIXDAT_HIGH_ACT;
>  	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
>  		fbmode->vmode |=3D FB_VMODE_INTERLACED;
>  	if (vm->flags & DISPLAY_FLAGS_DOUBLESCAN)
> diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
> index fb795c3..30487df 100644
> --- a/include/uapi/linux/fb.h
> +++ b/include/uapi/linux/fb.h
> @@ -215,6 +215,8 @@ struct fb_bitfield {
>  					/* vtotal =3D 144d/288n/576i =3D> PAL  */
>  					/* vtotal =3D 121d/242n/484i =3D> NTSC */
>  #define FB_SYNC_ON_GREEN	32	/* sync on green */
> +#define FB_SYNC_DE_HIGH_ACT	64	/* data enable high active */
> +#define FB_SYNC_PIXDAT_HIGH_ACT	64	/* data enable high active */

This can't be right. You map both flags to value 64. And the comment is
the same for both.

 Tomi



--M3RuJJDxIdkQLEu14hjOVaGFbiHXvFtdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJSb49fAAoJEPo9qoy8lh71VC4P/0ETdY/WE415nLejHuDs1uaO
za4wJvKfmlVdHr4k6ySvM6/WDROGoHs9D2WYUjrYPSJ15LHJMwv3whwti50voNoK
g/MSz4npsI6XhisWtwl201L1thAEW8S0i8lCaKulcDRMLvPkCRFIvJhtB+ImFv+V
1uVJARnkfo8I4VE9dGMHvuPl5bJFykZox0ZgJthNlL32Hsf8OHvIGrT3I6oCKXaS
26p75ZYgGWiDWWCeirJzGAEp/NPZ+xfdeKdamdoXw4lwAIPQinb5uASv1DMBrO23
45Zr2Zchv8AC18pIucYKRj4kaZvOyCvduFzJRUNdKtD6+rio2VJpnqt0XHIeHsLb
CBtuwtr3M8ujVHkmyWQYqDJKRRxZ86gVFIAhbynFlGUaIgi4Mp7aNfuzeBMRimJF
7K5ZIFPLDTuG9DA0uaxoTic7CUJz5E7TPokeAJNRI/pvxTJQ1DiPlXqzl5ey35Uy
6bNd/2flo3kFHI3jZvLTHo66fjW130HgHK0RD3ztMs1tDXv3IPUnktnFzzsq9LNq
Va+hfCy7K7QRDZzXwJGk8ErKfnjn3ywMS/FEkgtsEZog1foJGcgQRd4fKs8sGnfr
0BDcEz9Dcc3AODjRoUgFSZyTRM9aVT0AGnP37zcapZhkFGcFtNxsOnCPIbSEeP4t
IYw4j2YFwFLH1wsmqF/A
=gBk9
-----END PGP SIGNATURE-----

--M3RuJJDxIdkQLEu14hjOVaGFbiHXvFtdf--


--===============1342703451068469403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1342703451068469403==--
