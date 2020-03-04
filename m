Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2171C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 06:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A755215A4
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 06:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="nFbn1CVi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgCDGmc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 01:42:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgCDGmc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 4 Mar 2020 01:42:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 48XPSj5HhVz9sR4; Wed,  4 Mar 2020 17:42:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583304149;
        bh=5Tn+MXqcA8IMQp7yDG4OfRBIOmBQXGXZ2xvSoQSavU0=;
        h=Date:From:To:Subject:From;
        b=nFbn1CViPj1Pm/BbLOShPY3TPKSSpr4it4rhWfrMHlRRW1zhbD/qkB/pIGbilDFtU
         eagNpKZeNESH4WpL+ZjwkBsS6Y0GZIzHXUDjtlkbTVOJQyF+AGGon1BzQwBeGoQ3aS
         CwtIOSb2vntFJDo6Z8SMaDuJsrCxhxTIJySOdaMk=
Date:   Wed, 4 Mar 2020 17:42:20 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     devicetree@vger.kernel.org, devicetree-compiler@vger.kernel.org
Subject: DTC 1.6.0
Message-ID: <20200304064220.GD593957@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've just tagged and packaged v1.6.0 of the device tree compiler.

Git tree available at the usual place:
   git://git.kernel.org/pub/scm/utils/dtc/dtc.git
And tarballs available at:
   https://kernel.org/pub/software/utils/dtc/

DTC 1.6.0

Changes since v1.5.1. include:
 * Some provision for out of tree builds (useful with meson)
 * Some fixes for win32 builds
 * Some improvements for FreeBSD builds:
   * Work with byacc as well as bison
   * Fix some compilation failures with clang
   * Default to cc instead of gcc
   * Add FreeBSD testing via Cirrus CI
 * Add non-x86 testing on Travis
 * Add options to allow builds of libfdt which sacrifice safety on bad
   inputs for reduced size and improved speed.  This is important for
   some embedded cases.
 * Allow testsuite to be executed on an already-installed dtc/libfdt,
   rather than just the one built in the source tree
-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5fSlEACgkQbDjKyiDZ
s5LXoQ//bKkaXf/OpF7nMfCb1/vRKtR5FiL6D90bBnP3k1ROZNDfiCyNT3JMLaa4
QVVhY1tXOe4z15x+aJmE4ft8ak0y88JQEk+NWc+9MIUN4bBYTdxoQBBGdxW+atNz
ycldlwMxAD5im9jRvHnXKFnxKZDr7i/w5qn1YJ2iVFjdeJtx4FFUDKUkE56Jjged
MmPdkXvQ0MMAtEri2QT8O6R5eiAyko6jE0QYSrCLSIaFyt6V48GvevQnW1B3nQ+u
fy59TTSGduNVjXwZfoobGmRegZrN/4F6zHhyfbQYITkeVdBVn6SS5zYk1fAVvc4a
SV/IgzFsBCNG0tiNLlxnZn13OiFUf7toJ6Nd0C+ivo1UhzyUQ2g1EQrMXySwYaTD
lWA5hK7xNWob9q6EDbRpXg8Xbw4YppC/mtJ2YakDFezgAKprVfuNgTuk18szTuqH
XgDpyQHEaMfCtY8kwgOF7kB5dDfEn8kjy8xbV6+mHa7y2pK40ZDML45FYTjt94hT
S768b2oZQZ3H/NFQc7k3SMmUJCGfAsTPqr3fJOp/Eoa7i2CLRROoiJKwUqfGqKmo
HEv36PDyVPeoooUyKqTeyqxo6vkzhwV2sjxXuflG96pgF6pFQzD73eplc5agNszF
Sh2rWToVPO7AAooQv+uROUwD2oQOenMPZa7Fxs1gjYHOjTHk6RI=3D
=3DgOZC
-----END PGP SIGNATURE-----

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5fTcsACgkQbDjKyiDZ
s5IfDxAA0PpDqXH51AAmT85MFyC+olGEIWyzm6B/+0AfEyvazCeeIHlxxSQlgLKd
Zbe+XieaSKyRcMZMHfVTqBS2AAcM+dhC0ih1NiGV5KCrnN8uIPZyNAEHsuToTvYe
zthvHjI7v+1vK3YTRI2YIlBPTo4Y8mRigQ+e9ePkG1lvo7JGzD+0Fpres1usTMkj
BChwwbUiiVZoPiI9Joej5LrQZUCFhEoLHpdTT4c/f0FC11rcgc+2f3bPEJtMjkbQ
nr6VTlWhh9wdjSG40JQlV7iMVFIZ+heUJA2B7BhXAzy8/GL33f+u9oaEkg2Df3OA
TI/tldfy7eGVgPkA1/DCH97Eq/xFeIcieUqrDT2zWgQR6CFMiUIOuxzBqX3OApcS
pWgKBcLTdezE3ONvlIf7pFjNMVRlVJkPXpfn67FCe8oNgzBcxfqhlVkMjzAPI6EU
Aj6ohWLln2rgOWM5+GoZAL587roElMjPlnjsRj7OG1zm7MUVHYU9VkF5e+AftAFT
vM1wqJi9Imaf7cnA6AZDES9hYeEtXMNp9+PsdHNz1dCD2fB+E6TTzQpR6vMplM1Z
2NNihIUdcw6UQQmHvh6+/L9i8+oxwhQhfLoOP1V9N5VW5vj9EuWOem2HFyTKTDHH
iJJ2qvNT8gUVRWmR/7og8PbOLkUGjvrsj6SE33YSIsn9UcNyG5s=
=r10Q
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
