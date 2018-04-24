From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 8/8] drm: connector: Remove DRM_BUS_FLAG_DATA_* flags
Date: Tue, 24 Apr 2018 09:22:33 +0200
Message-ID: <20180424072233.GF17088@w540>
References: <1524130269-32688-1-git-send-email-jacopo+renesas@jmondi.org>
 <1524130269-32688-9-git-send-email-jacopo+renesas@jmondi.org>
 <5371494.OmLzBJ8YyX@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1035914848=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5371494.OmLzBJ8YyX@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, peda@axentia.se, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1035914848==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline


--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Apr 24, 2018 at 12:03:04AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thursday, 19 April 2018 12:31:09 EEST Jacopo Mondi wrote:
> > DRM_BUS_FLAG_DATA_* flags, defined in drm_connector.h header file are
> > used to swap ordering of LVDS RGB format to accommodate DRM objects
> > that need to handle LVDS components ordering.
> >
> > Now that the only 2 users of DRM_BUS_FLAG_DATA_* flags have been ported
> > to use the newly introduced MEDIA_BUS_FMT_RGB888_1X7X*_LE media bus
> > formats, remove them.
>
> I'm not opposed to this (despite my review of patch 5/8), but I think the _LE
> suffix isn't the right name for the new formats. _BE and _LE relate to byte
> swapping, while here you really need to describe full mirroring. Maybe a
> _MIRROR variant would be more appropriate ?

As I anticipated in the cover letter, I agree the BE/LE distinction
does not apply well for LVDS formats. I chose to use _LE anyhow as
there are no other format variants defined in media-bus-format.h

I'm open to use either of those suffixes btw, what presses me is to
get rid of those flags only defined in drm_connector.h

thanks
   j

>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/drm/drm_connector.h | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 675cc3f..9e0d6d5 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -286,10 +286,6 @@ struct drm_display_info {
> >  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
> >  /* drive data on neg. edge */
> >  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
> > -/* data is transmitted MSB to LSB on the bus */
> > -#define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
> > -/* data is transmitted LSB to MSB on the bus */
> > -#define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
> >
> >  	/**
> >  	 * @bus_flags: Additional information (like pixel signal polarity) for
>
>
> --
> Regards,
>
> Laurent Pinchart
>
>
>

--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa3ts5AAoJEHI0Bo8WoVY8e6wP/i3mBdoLOwLGpDd7AVbkXrVD
HUOOShP69QB+Gy409hFucRoVkICR08o5FPiXn1EvcgCjaEuxDBG1q1dOl/BQz5QD
7GwZs3jTKhg+kaZjM+vUE3KnX6ZcXQsjLE5v0SBs1W314dzx/CIE9lGk3S/GycfP
4d0Yp2cv0fXJdwc0CeUlRjjmQuhShO4weztnkk78PpFo+dcxMpRSedjSLzfLasoV
/+94eh+6tmKu7jUE0LbWIGI6qh6vUEXBCZmY7alxlQrDZtQq9+WLTRyeLPQEdEiM
EjNA1454FSvxSL5oniOH5WRIL9otFjtxcCH8wpgH5NxKGeiUKy589POhpBpv+wBw
/r0r8WilKEmkxwRkq/WDcnyUMdeIo0FlUni1hM6uCrvn+OjrODQ1lAjhHj+iH/Q6
ROgoRYsa6VwE7ImPr2MS0qB1V+hnCOxgzbhdgMD/KvfBffKlJPUlGSXhaChITPXg
va9alUyeG5lh1kXeoOgEiVI89ytRTi17I3Kks728tjuuBhap25SE20jUJk0qS8IO
W7x4Y+Ds/rfSV9aENRiJqkA+bNL1kZyJ2cfKek5hBRG/ceyyiyPCoM4ra6eYDgNS
3zBhoEPpyhs5aXRpAzyuiFPap5JYEteg7UIj+3/zQ4oHQV3RpL1X/3Ly7ZiJD+aH
ilMDR29l1OSllarOxXQm
=gMHJ
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--

--===============1035914848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1035914848==--
