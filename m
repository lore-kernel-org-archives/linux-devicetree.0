Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69ACDC10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 11:18:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 317E32051A
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 11:18:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgCILSb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 07:18:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:47960 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCILSb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Mar 2020 07:18:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0B707B3E2;
        Mon,  9 Mar 2020 11:18:30 +0000 (UTC)
Message-ID: <99e5654910e803a2e006205541a18d3627efcdf0.camel@suse.de>
Subject: Re: [PATCH] define rpi0w sdhci pinctrl state
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Nick Hudson <nick.hudson@gmx.co.uk>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Mon, 09 Mar 2020 12:18:28 +0100
In-Reply-To: <c97f3704-a671-be70-4323-181f84d657f8@gmx.co.uk>
References: <c34db439-3539-88c0-99f1-308d75afd1aa@gmx.co.uk>
         <23a936db-fc89-6259-3991-5791fa88beb7@i2se.com>
         <bd4bd5dc-307f-d058-8f94-00b61a8b8c87@gmx.co.uk>
         <c97f3704-a671-be70-4323-181f84d657f8@gmx.co.uk>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-UsQZskaAVjNGWNkpDbQd"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--=-UsQZskaAVjNGWNkpDbQd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Wed, 2020-03-04 at 07:33 +0000, Nick Hudson wrote:
>=20
> On 28/02/2020 11:52, Nick Hudson wrote:
> >=20
> > On 27/02/2020 17:53, Stefan Wahren wrote:
> > > Hi Nick,
> > >=20
> > > Am 27.02.20 um 00:33 schrieb Nick Hudson:
> > > > I'm still not sure where I should be sending this, but here goes.
> > >=20
> > > the addresses are right. Please rebase your change against recent Lin=
ux
> > > git tree and generate a git patch, otherwise we cannot apply your it.
> > Oops, I see I sent the comletely the wrong diff... will fix.
> >=20
> > > I suggest the following subject:
> > >=20
> > > ARM: bcm2835-rpi-zero-w: Add missing pinctrl name
>=20
> So, I did this, but it's stuck pending ML moderator approval :(
> I sent it on Saturday.
>=20
> Do I need to try again?

I didn't receive anything myself, so I guess something went wrong.

I'd say try again :)

Regards,
Nicolas


--=-UsQZskaAVjNGWNkpDbQd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5mJgQACgkQlfZmHno8
x/4rxggAiznLXhBmqo8Bctu6MolT9RR0LtFBF7tpZlCwS8y9+jrOkrwkchGJfvf+
Z2Y9RHitWgCo6HEtK7GgrEbJw1WC5McWhUKBMuCPJVbyaLmpJDpGkOGd++QSMGzE
jl7Kr/WVMuIDDRDqGfT6wn8HuY2aqoFvTMGKceIjFKLt3Vi5v2brLGC+boD0FHEV
H8OUfi/JvEDgqcJMS2Ga9LecY3RjoEawyLiM7PoBPmU8FxOiUT4mKH9PkMPvL4OI
qNb9tLn6chYxkh/DxjzRvgQUoKm8gpnaoVEBxiIDfe3ULnEeYbMykKFux+raEOg0
Zuqz+O+4+6AJbgA0JduvmzWtuikFjw==
=REhm
-----END PGP SIGNATURE-----

--=-UsQZskaAVjNGWNkpDbQd--

