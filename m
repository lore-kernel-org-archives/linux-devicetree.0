Return-Path: <SRS0=HAag=NQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:41481 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbeKEW2c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Nov 2018 17:28:32 -0500
Date: Mon, 5 Nov 2018 14:08:45 +0100
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Message-ID: <20181105130845.GL20885@w540>
References: <1541418561-21977-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUXVnQtJKCmzBx1Rk0OzZQ4McPqDLtRk2XNb3qaCs8mTA@mail.gmail.com>
 <20181105124602.GK20885@w540>
 <CAMuHMdWQyDRTOSnYTqG3r8nXqE7v=OtX0Jv7h-Wu0aOPD4GGsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AQYPrgrEUc/1pSX1"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWQyDRTOSnYTqG3r8nXqE7v=OtX0Jv7h-Wu0aOPD4GGsQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>


--AQYPrgrEUc/1pSX1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Mon, Nov 05, 2018 at 01:57:07PM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Mon, Nov 5, 2018 at 1:46 PM jacopo mondi <jacopo@jmondi.org> wrote:
> > On Mon, Nov 05, 2018 at 01:07:58PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Nov 5, 2018 at 12:49 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > > The VIN driver bindings dictates fixed numbering for VIN endpoints connected
> > > > to CSI-2 endpoints, even when a single endpoint exists.
> > > >
> > > > Without proper endpoint numbering the VIN driver fails to probe.
> > > >
> > > > Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
> > > > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > >
> > > Was this patch authored by you or by Matsuoka-san?
> >
> > The original patch didn't apply
> >
> > $git am index.html\?id\=1b1b73f7558d867d72e198901b84bec1e6ef1405
> > Applying: arm64: dts: r8a77990: Fix csi2 endpoint number in VIN node
> > error: patch failed: arch/arm64/boot/dts/renesas/r8a77990.dtsi:811
> > error: arch/arm64/boot/dts/renesas/r8a77990.dtsi: patch does not apply
>
> Right, the BSP had the unit address and reg property, while upstream hadn't.
>
> So don't you need to re-add:
>
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>
> else dtc complains:
>
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (reg_format): /soc/video@e6ef4000/ports/port@1/endpoint@2:reg:
> property has invalid length (4 bytes) (#address-cells == 2,
> #size-cells == 1)
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (pci_device_bus_num): Failed prerequisite 'reg_format'
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (simple_bus_reg): Failed prerequisite 'reg_format'
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (i2c_bus_reg): Failed prerequisite 'reg_format'
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (spi_bus_reg): Failed prerequisite 'reg_format'
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (avoid_default_addr_size):
> /soc/video@e6ef4000/ports/port@1/endpoint@2: Relying on default
> #address-cells value
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (avoid_default_addr_size):
> /soc/video@e6ef4000/ports/port@1/endpoint@2: Relying on default
> #size-cells value
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (graph_endpoint): /soc/video@e6ef4000/ports/port@1/endpoint@2: graph
> node '#address-cells' is -1, must be 1
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: Warning
> (graph_endpoint): /soc/video@e6ef4000/ports/port@1/endpoint@2: graph
> node '#size-cells' is -1, must be 0

Oh, sorry I didn't notice. I assumed the partent's ones were used.

I have now fixed that and will send v2.

Thanks
   j

>
> > So I made a new one, changing the commit message and adding the Fixes
> > tag.
> >
> > I can change author if you want to.
>
> In such a case, I usually add "based on a patch in the BSP by ...", instead of
> the original SoB-chain.
>
> > > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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

--AQYPrgrEUc/1pSX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb4EDdAAoJEHI0Bo8WoVY8g1gQAL9vAeUTaPoMLLmOt/0FL44C
T3FI/N0NFMGVyXnMis5v8Y+S4kZ3tV4frnc9OOCg56bCgB3sBMtMcl3rL8od5deW
BeD/RgPlE5vjLXeYpHOf6ln3Ny+pVeLIP1RMOoJLJ3c7fzyLA9NTofVnCBXFr7vM
X4qXsa+3E+jTB8gRF8xolR4CeTI3iA35bBmqKREkbhFYA1jjIYyxoVS9Gi3HKtKT
b/vFC8qxsu3cfIxhdmKzMO+IanABCJTWbzE8Toobu8C5yjHGUbcH4IYAqc3cQWJP
s1GDRPp4NGYWkrx+Z283ed7kzazP+r6gxPaVLsssZUl10gKML4Tzkso0OxRbo8Pn
tElgwjj0BSCoWYjy0ny1sk963W7B/XcuJDLQ41gJNPiB1dznIlbMuql9W2c6oY5t
sbb4HwwlJpxf/lJBwvJPtKLjzOFf0LKMOMsGd6cn/VQh0EjH2jJ2ovIXoUTI8tN1
CmEvxnERZOHM181nYkxMsa0O0kwxD9ntmzETuKokTF2pszj2O6nwcLSoy9joGDKx
0gWTSWxPm72EZ8uy6A5Cxal46keudEzOnan/B5qyo6Z20nlVFyqp2ecNEWyUP5Ni
UxbDceojJ/L0VunFqE4NGy4WRh0WoUkCzJC2rQ5TchWWqgbihp2jmoV5TL6hJ3Ob
WjMBpGGj57JblbD0uWt8
=FMoh
-----END PGP SIGNATURE-----

--AQYPrgrEUc/1pSX1--
