Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE89EC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 09:50:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E67F2467D
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 09:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgCJJuk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 05:50:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:58282 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgCJJuj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Mar 2020 05:50:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2A65FAC37;
        Tue, 10 Mar 2020 09:50:38 +0000 (UTC)
Message-ID: <2f4f739422ba70e9578d020aa5c578588b0a54d6.camel@suse.de>
Subject: Re: ARM: bcm2835-rpi-zero-w: Add missing pinctrl name
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Nick Hudson <nick.hudson@gmx.co.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Nick Hudson <skrll@netbsd.org>
Date:   Tue, 10 Mar 2020 10:50:37 +0100
In-Reply-To: <b9b15470-deb0-6434-8e42-6482ea4bec9d@gmx.co.uk>
References: <20200309164842.8184-1-nick.hudson@gmx.co.uk>
         <8609efe72001a183452c4bd4f1f1a827eb789406.camel@suse.de>
         <47bc256f-d8f2-6f42-1421-12e19c09d0ce@gmail.com>
         <b9b15470-deb0-6434-8e42-6482ea4bec9d@gmx.co.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-mHkaeGvwgsTfYPjnj29j"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--=-mHkaeGvwgsTfYPjnj29j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Tue, 2020-03-10 at 06:46 +0000, Nick Hudson wrote:
>=20
> On 09/03/2020 20:51, Florian Fainelli wrote:
> > On 3/9/20 1:15 PM, Nicolas Saenz Julienne wrote:
> > > Hi Nick,
> > >=20
> > > On Mon, 2020-03-09 at 16:48 +0000, nick.hudson@gmx.co.uk wrote:
> > > > From: Nick Hudson <nick.hudson@gmx.co.uk>
> > > >=20
> > > > Define the sdhci pinctrl state as "default" so it gets applied
> > > > correctly and to match all other RPis.
> > > >=20
> > > > Signed-off-by: Nick Hudson <skrll@netbsd.org>
> > > > ---
> > >=20
> > > you should add the [PATCH] prefix in your subject when submitting pat=
ches.
> > > Also
> > > make sure you CC everyone listed by ./sripts/get_maintainer.pl, so th=
ey
> > > can
> > > properly review the patch.
> >=20
> > It would also be nice to get a Fixes: tag such that this could be
> > backported to stable kernels. Thank you.
>=20
> If you haven't already guessed... I have no idea what I'm doing here so s=
ome
> guidance would be nice.

No worries, we're happy to guide you :)

> I guess it's been wrong from day one and so I should have something like
>=20
> Fixes: 2c7c040c73e9 ("ARM: dts: bcm2835: Add Raspberry Pi Zero W")

Yes that's perfect.

Regards,
Nicolas


--=-mHkaeGvwgsTfYPjnj29j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5nYu0ACgkQlfZmHno8
x/64UQf/RNsxZ7PyQ4lGZTSVTRgV+qs1m5fhYeQnZV0WkEex3ig5tRbckO8N2RXb
s6uHOtVAlwo4VlNcjZMtMijMOwthBNxpCIBDVvLcpooBx3ur8XjpQ1WaMa/KNYm/
ZfaCRMipmOQHS2we7eUSyyUJr4PO5YMDxV9OhSkb8JKFRNLbI6z84NbXnxjMVzL7
458oZLg6jWSSRw/BoRELRA8MhjfgnOylG1SiDIWSpWtRis3vyJTsS/iX2z0IK9zH
vPoDpMw0VGbeEPMj1yWYe4X/4VI4VNqpVEb9GW2svdhW7cAkffkucf/3xoYsy6N1
de19UCwTGwl8LrGj7KBc6ztUY4wzxw==
=VQBn
-----END PGP SIGNATURE-----

--=-mHkaeGvwgsTfYPjnj29j--

