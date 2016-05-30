From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC v2 3/5] drm/mediatek: add *driver_data for different
 hardware settings
Date: Mon, 30 May 2016 12:45:53 +0200
Message-ID: <20160530104553.GB8388@ulmo.ba.sec>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
 <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
 <1463996582.30093.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0639353690=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463996582.30093.5.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, yt.shen@mediatek.com, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0639353690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2016 at 05:43:02PM +0800, CK Hu wrote:
> Hi, YT:
>=20
> One comment below.
>=20
> On Fri, 2016-05-20 at 23:05 +0800, yt.shen@mediatek.com wrote:
> > From: YT Shen <yt.shen@mediatek.com>
> >=20
> > There are some hardware settings changed, between MT8173 & MT2701:
> > DISP_OVL address offset changed, color format definition changed.
> > DISP_RDMA fifo size changed.
> > DISP_COLOR offset changed.
> >=20
> > Signed-off-by: YT Shen <yt.shen@mediatek.com>
> > ---
> > +
> > +static inline struct mtk_ddp_comp_driver_data *mtk_ovl_get_driver_data(
> > +	struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *of_id =3D
> > +		of_match_device(mtk_disp_ovl_driver_dt_match, &pdev->dev);
> > +
> > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > +}
> > +
> > +static inline struct mtk_ddp_comp_driver_data *mtk_rdma_get_driver_dat=
a(
> > +	struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *of_id =3D
> > +		of_match_device(mtk_disp_rdma_driver_dt_match, &pdev->dev);
> > +
> > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > +}
> > +
> > +static inline struct mtk_ddp_comp_driver_data *mtk_color_get_driver_da=
ta(
> > +	struct device_node *node)
> > +{
> > +	const struct of_device_id *of_id =3D
> > +		of_match_node(mtk_disp_color_driver_dt_match, node);
> > +
> > +	return (struct mtk_ddp_comp_driver_data *)of_id->data;
> > +}
> > +=20
>=20
> These three functions looks the same with different parameter:
> mtk_disp_ovl_driver_dt_match, mtk_disp_rdma_driver_dt_match, and
> mtk_disp_color_driver_dt_match. So merge them to prevent duplicated
> code.

I think what you really want is of_device_get_match_data().

Thierry

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXTBnhAAoJEN0jrNd/PrOhESwP/RAvu3FLDB1lvUOAwgbaENgT
T0gLGTOwrqZcznISJFmbiLfA0MBEfhQg01hPi+6BYwaaxvuD+UZD+Ycbinn4yr6E
D5xSKOrfgXauDlE+h7hEVNUs6VYKmsqzNib/sWuNYOjFLOC/f5oP4DBP3R8ZzyCN
Nvcol1tJQkj86vXv/NyWF4XYwGshAJ8OhpP+srs62SpZJkNh+Lnhz+bH1ayBZpri
uAfYKk4clQxGTDoiO5SoBzRWodCclo/szWkhv/ccS8JavR0ElMYHrO88vQTTUcal
+QhchzNrBXMZcOvy4klV530d/8kKfF0ai4kkzkNs7lwN+yawJE8Hy7YgXN+/GXfX
3YDUVus47NNXFSf7H6f/i+/GALN4oCRqMaTMQua6yuQrMr0G0uK/R5rG0ri17Dj9
PhOlNJGP9QqZKcW2xFfHoIoqQkNUi+axX7iu5tdkkKzywm9XNCpAmjxifE0X5r7C
c/yuW1FnmPfl8lgiaPlw0cd0La5LbxrSqilmZibydMCiwUTIOpbKywfl30NxHCxR
05f3ZjVllal+U1ZwP/wlODdJ/sUadDBVotNsuoD4NwRzTRTIB7S8H5zEpSWXNCzh
KUW5anxZvOcNwdCrCOVbGw+cxdQeJYm9V/TbSGIeYiTzfT22M3u8iqNO2MDlioVI
Q29xm5b1lvGBix7EyktY
=R/l1
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

--===============0639353690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0639353690==--
