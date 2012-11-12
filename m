From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add devicetree support to m25p80 driver
Date: Mon, 12 Nov 2012 17:32:20 +0200
Message-ID: <1352734340.2262.4.camel@sauron.fi.intel.com>
References: <5084241A.5050801@vanka.net>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1523519979274549718=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5084241A.5050801-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
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
To: Michal Vanka <mv-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mike-UTnDXsALFwNjMdQLN6DIHgC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1523519979274549718==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-AjjQkTjF1PIwWqKbFxQ4"


--=-AjjQkTjF1PIwWqKbFxQ4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-10-21 at 18:34 +0200, Michal Vanka wrote:
> The following patch adds support for devicetree to m25p80 driver.
> Note that for jedec chips the chip identification was simplified.
> The particular chip is identified by jedec_id only.
> Tested on custom Altera Nios2 system.
>=20
> Signed-off-by: Michal Vanka <mv-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>

This patch is wrapped and does not apply. I tried to fix the wrapping,
but it does not apply to the l2-mtd.git tree anyway. The l2 tree is
based on v3.7-rc4. Please, send a cleanly applicable version against the
l2-mtd.git tree:

http://git.infradead.org/users/dedekind/l2-mtd.git

--=20
Best Regards,
Artem Bityutskiy

--=-AjjQkTjF1PIwWqKbFxQ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRaEAAoJECmIfjd9wqK0rFgP/RUF1NHo6YfL8+eP2NoagUd+
QrTf8GlO8DLAuCPedj26b3XRV8q9wKHaKc7R9mVS3im68fxpr18EU04yNA6DHIAN
UDrU6AR0IoZzccFiSOfYmGCXastj3jDQ/X5zrdVk7kN+bI+6j/EF1pF3PXJpwoDB
mabFDZLNzgXkNxsRrJz4Wd0n++GS0u+IEE68JG98cpdKmo4wAKyaxncd76+IEB9o
DfVo0eAOSxQQdl6HPVk6WA4Uwoxow/Ls5YZx0fiSs1AQmfRIQecIQ+y51Yv6zZRY
L5tFW6yAFkoWl0Ub3V54hkrQYmUOcHgYTq4PoNOBnXKLJ2+u6nRmp+0JN6591Ds+
8kABewp20uBaR4i3Mb2siq/WK/0FBZo+UCDu764xX1TpHjDWuMw0bhcjmRqUrAaj
zr+VsGuSoODWyiGKohTUW+zgiWh/qdDVESEVWeCBLUKqPYtWtNGocb8vc3qNiTez
+6rcSRmdRWxfVzvtv76a8lnnHtOxz2yMfoBUnnrNeSD4nWeC4VEygGLO6hVpAaX9
wN5f4kdVtKrXeWyYqvty0U6RDkaHxNVJTthaibKfS8oFZ93CdOoUhputPE+sO7iM
b0mblLUdyYpZnsAM3lnveqPqOKxo23OmsVtA9dXrfFKNXmCfWoU36vU4D8SPPwgr
lpRGgi15wYT39wxsFPFM
=l3SC
-----END PGP SIGNATURE-----

--=-AjjQkTjF1PIwWqKbFxQ4--


--===============1523519979274549718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1523519979274549718==--
