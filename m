Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257BEC2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 17:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC1702082E
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 17:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgBGRZN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 12:25:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:48986 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbgBGRZN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Feb 2020 12:25:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 5B9AAAF57;
        Fri,  7 Feb 2020 17:25:11 +0000 (UTC)
Message-ID: <9b0f8daeb12ad4e5be74ff93e64c38087af199cf.camel@suse.de>
Subject: Re: [PATCH] overlays: dwc2: Increase RX FIFO size
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Date:   Fri, 07 Feb 2020 18:25:09 +0100
In-Reply-To: <43db1d9c-6fa2-88bd-11df-6ae2f48a4ac9@ivitera.com>
References: <43db1d9c-6fa2-88bd-11df-6ae2f48a4ac9@ivitera.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-yTpRgBYomwJsP1mAJVk/"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--=-yTpRgBYomwJsP1mAJVk/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pavel,
Could you change the patch title to something like this (see other patches
changing the device-trees, you'll see it's the common pattern):

	ARM: dts: bcm283x: increase dwc2's RX FIFO size

On Fri, 2020-02-07 at 17:30 +0100, Pavel Hofman wrote:
> The previous version of the dwc2 overlay set the RX FIFO size to
> 256 4-byte words. This sounds large enough for a 1024 byte packet (the
> largest isochronous high speed packet allowed), but it doesn't take
> into account some extra space needed by the hardware.
>=20
> Minas Harutyunyan at Synopsys (the source of the DWC OTG design)
> came up with a more correct value, 301, but since there is spare packet
> RAM this can be increased to 558 to allow two packets per frame.

I suggest making a short summary of your github explanation[1] instead of j=
ust
citing Minas. On one hand Minas' memory might get fuzzy after some time (or=
 not
be able to access the documentation) and...

> See: https://github.com/raspberrypi/linux/issues/3447

...you're assuming this link will be always available. Which is unlikely. A=
fter
properly explaining the issue, you won't need the link anyway. Ultimately a
patch description should be as self-contained/self-explanatory as possible.

Other than that the patch looks good.
Thanks!
Nicolas

[1] https://github.com/raspberrypi/linux/issues/3447#issuecomment-581815066


--=-yTpRgBYomwJsP1mAJVk/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl49nXUACgkQlfZmHno8
x/64+Af9GVsNsm3NPhMpW0qCLhpsj/VtaeNiM9S+OrLw/5WVKaOalPDpGp+w7qrk
bZ5VPmFCpIxjJX0fY6lnJWuOPlrMAi7w9PL+h3WFtSqmhRDELUktdg3cnvLYxaxm
SykV6fdYnhB5u4YXRIky9Ox+Whz95P3LDg67IZE7PX/QQTbYm8+slwdkkTRWZSuZ
8eb1J4rSDxPcE7rY7uPLNJVvMsFL6kPZiEqX4VvdIbwZ+5kJiyELEs/FbBKQlxFK
dS8Xkc0VoS9UinK2i+M27haWJ39Z26Bgl7DWNEV4OSf4URECcLPwt/f9Lp5s4izo
RCM/CL9ocnu6cS1723xHouvaYbKnKw==
=nK9S
-----END PGP SIGNATURE-----

--=-yTpRgBYomwJsP1mAJVk/--

