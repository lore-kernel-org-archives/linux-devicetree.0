Return-Path: <SRS0=HAag=NQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51929 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbeKEWFm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Nov 2018 17:05:42 -0500
Date: Mon, 5 Nov 2018 13:46:02 +0100
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Message-ID: <20181105124602.GK20885@w540>
References: <1541418561-21977-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUXVnQtJKCmzBx1Rk0OzZQ4McPqDLtRk2XNb3qaCs8mTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xjamM5M9kpPM/bcu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXVnQtJKCmzBx1Rk0OzZQ4McPqDLtRk2XNb3qaCs8mTA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>


--xjamM5M9kpPM/bcu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Mon, Nov 05, 2018 at 01:07:58PM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> Thanks for your patch!
>
> On Mon, Nov 5, 2018 at 12:49 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > The VIN driver bindings dictates fixed numbering for VIN endpoints connected
> > to CSI-2 endpoints, even when a single endpoint exists.
> >
> > Without proper endpoint numbering the VIN driver fails to probe.
> >
> > Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Was this patch authored by you or by Matsuoka-san?

The original patch didn't apply

$git am index.html\?id\=1b1b73f7558d867d72e198901b84bec1e6ef1405
Applying: arm64: dts: r8a77990: Fix csi2 endpoint number in VIN node
error: patch failed: arch/arm64/boot/dts/renesas/r8a77990.dtsi:811
error: arch/arm64/boot/dts/renesas/r8a77990.dtsi: patch does not apply

So I made a new one, changing the commit message and adding the Fixes
tag.

I can change author if you want to.

>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--xjamM5M9kpPM/bcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb4DuKAAoJEHI0Bo8WoVY8eKYP/ifTLBrgoN1UTA+pjyLBUj1W
xf/zrbNs6GSwgQOy8wEzW0+MdLC65sY7LSrO6KdUSlfS7lwmBlIfj25SOFofEkgv
+XaeKM/ZBEpVsS7kTiFBnG1NL/o6Yv7Jk/BKZP+JMwYf2hlXlRuHzr70NL6OshZh
qWW6sSHmgofaSLrMUHV2jDxPPZXicSOUEw5XxsIUeW97NSXJM1ehROfELrE2kNMY
L3kqdEVHhYELyVTRn1dqc79pW7HnorNUlqnv86/Qk5SC+GsGZb80LnKIZIhMg/h3
VlNwWmy2PIGs7nuzm8JA+qsy4nGkLiAOjJ7azcLsGsOOhAomL9nsLR4Dc+QyLE6/
d1DgoHEZ8MkJgbhZk3i6Ix5suPP0Yxv/k8mytkreBQNu/RAQ27CYF/sMWjYg5URu
N8UTU+E9e1yJztsLGDHzfoxM93wmV463M4KlbqNbHQEbr3GtEcTJK/57WybBg9hB
Q//MbhjkgBaAh6qkCKvSY/gnpfIvVucEnt5xPu9adRbt5mHsQjgiX46VJ6+CNy0O
cDEfKIBw2zgCrdkQYfnb85igG6lau7ziAkhvZe7taQ3CGEGSG+3d6ohGbHwkibVy
Ug25WYJfnxXX5Pbr44gxZBQz853z/VwwB+UgYq+Yu5s0yNVn0h2xPCsl+JyKjMLT
c9+KmMOa1sKWQiRlb4VS
=SDRl
-----END PGP SIGNATURE-----

--xjamM5M9kpPM/bcu--
