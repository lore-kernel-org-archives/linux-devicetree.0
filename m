Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC289C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 11:16:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 847DD2071A
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 11:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390063AbgEYLQY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 07:16:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44168 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389897AbgEYLQX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 07:16:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2F0BA1C02C4; Mon, 25 May 2020 13:16:22 +0200 (CEST)
Date:   Mon, 25 May 2020 13:16:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, tfiga@google.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 02/13] dt-bindings: video-interface: Replace
 'rotation' description
Message-ID: <20200525111621.GE27989@amd>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
 <20200509090456.3496481-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline
In-Reply-To: <20200509090456.3496481-3-jacopo@jmondi.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-05-09 11:04:45, Jacopo Mondi wrote:
> Replace the 'rotation' property description by providing a definition
> relative to the camera sensor pixel array coordinate system and the
> captured scene.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../bindings/media/video-interfaces.txt       | 359 +++++++++++++++++-
>  1 file changed, 356 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt=
 b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index b1ff492c7da7a..3920f25a91235 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -85,9 +85,362 @@ Optional properties
>=20
>  - lens-focus: A phandle to the node of the focus lens controller.
>=20
> -- rotation: The device, typically an image sensor, is not mounted uprigh=
t,
> -  but a number of degrees counter clockwise. Typical values are 0 and 180
> -  (upside down).
> +- rotation: The camera rotation is expressed as the angular difference in
> +  degrees between two reference systems, one relative to the camera modu=
le, and
> +  one defined on the external world scene to be captured when projected =
on the
> +  image sensor pixel array.

So.. how is this supposed to work. There's a phone, with its main
camera. It is designed to be used in both portrait and landscape
modes, internal accelerometr can tell between the two.

Plus you have phone with a keyboard. Common usage is portrait with
keyboard closed, and landscape with keyboard open...

And yes, there's linux with v4l2 working on Nokia N900.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7LqQUACgkQMOfwapXb+vIaMwCfUfK0NB+oJcwe+8349bTgOT7+
SE4AmgKPNdcqvahEQnuXH22WAUBVSNg5
=RDoI
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
