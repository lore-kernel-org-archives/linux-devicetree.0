From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v14 3/6] drm/panel: simple: Add support for NEC
 NL4827HC19-05B 480x272 panel
Date: Thu, 13 Aug 2015 14:17:48 +0200
Message-ID: <20150813121748.GB11095@ulmo>
References: <1438158605-28248-1-git-send-email-jianwei.wang.chn@gmail.com>
 <1438158605-28248-4-git-send-email-jianwei.wang.chn@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0246545394=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1438158605-28248-4-git-send-email-jianwei.wang.chn@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jianwei Wang <jianwei.wang.chn@gmail.com>
Cc: devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, daniel.vetter@ffwll.ch, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, scottwood@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0246545394==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 04:30:02PM +0800, Jianwei Wang wrote:
> This adds support for the NEC NL4827HC19-05B 480x272 panel to the DRM
> simple panel driver.
>=20
> Signed-off-by: Alison Wang <b18965@freescale.com>
> Signed-off-by: Xiubo Li <lixiubo@cmss.chinamobile.com>
> Signed-off-by: Jianwei Wang <jianwei.wang.chn@gmail.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  .../bindings/panel/nec,nl4827hc19_05b.txt          |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/nec,nl4827hc1=
9_05b.txt

Applied, thanks.

Thierry

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzIrrAAoJEN0jrNd/PrOhzmUP/Am5OR/U72hxzjFrd+6E9ins
SJtFZcHp5wlNxgOPL0fc93iUj7qjOqNXQqFZQDJlUMqDuNH6BZj0G5VGvTUzhbBY
nXDx2FcNCCIQyZjVfUPWxCXm0EJhPt+0pQTBLSRwjrUeiSAUD5X7k7xtZvIw0fFs
neFSLs5h2V/0hOb8kECwCxe8YNFq+yffKNAv18coFgnDxQGZa6g2aK2if0diMKNy
Ojd1UAfcXADdfJild+dos8efbvndHw0LpkYeLws02fx8zRAf1tH7r25M5mdOXo9C
8dRvHSuOmkmBw+gudRyw1AAb1t5PprH9UvWofse4svmc3//AP0nEoAKw8qViBiuE
a2Nrw/I08P4Ojmz/KLbH3vzItCEpIX2SgUnSzmXK4lVfWm3XUEaPBgSLe3XFTYyo
yXTJEJXI7tAIyzvLr5Um05P0VUJrbHjTzQGGfl2JZFilHTSF20p1yEaom4sy+BmC
0PcS9a5ccTyabDifca7lTp21dtMpV6UC3A0oOH+PPOla1HydIxIble5xZvsjiN/J
+EOgBdK9zIQqWs06dtE5MG7XUf1/dSaIyCoHT/+3L+XAlTX7c8HebW2jSTfpPXOe
wRKnbwI7ON7z0fc8sLuWCDhQmsWTyX4aliNh4CEx+TbN3AKrBFGKc4catqaLCXu5
1Qlq1x3LkTe0rZgU9Mni
=Lzhn
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

--===============0246545394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0246545394==--
