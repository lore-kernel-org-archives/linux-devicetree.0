Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE42C3B187
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 18:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20CE5218AC
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 18:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgBLS5t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 13:57:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:37084 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbgBLS5s (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Feb 2020 13:57:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 518A5AC4B;
        Wed, 12 Feb 2020 18:57:46 +0000 (UTC)
Message-ID: <04e1c82b5cb08773ac9e8f0e1c33adc8cbc7c85d.camel@suse.de>
Subject: Re: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Date:   Wed, 12 Feb 2020 19:57:43 +0100
In-Reply-To: <22beb919-a3c6-33c0-8d3f-070061a6c853@ivitera.com>
References: <22beb919-a3c6-33c0-8d3f-070061a6c853@ivitera.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-BbFqBP9cWw8UjvP0rUr/"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--=-BbFqBP9cWw8UjvP0rUr/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

On Fri, 2020-02-07 at 22:12 +0100, Pavel Hofman wrote:
> The previous version of the dwc2 overlay set the RX FIFO size to
> 256 4-byte words. This is not enough for 1024 bytes of the largest
> isochronous high speed packet allowed, because it doesn't take into
> account extra space needed by dwc2.
>=20
> Below is a detailed calculation which arises from dwc2 documentation:
>=20
> * RAM for SETUP Packets: 4 * n + 6 locations in Scatter/Gather DMA mode
> and 5 * n+8 locations in Slave and Buffer DMA mode must be reserved in
> the RxFIFO to receive up to n SETUP packets on control endpoints, where n
> is the number of control endpoints the device controller supports.
>=20
> bcm283x: 5*n+8. The Broadcom core has 1 control EP (n=3D1), so 13 locatio=
ns
>=20
> * One location for Global OUT NAK
>=20
> bcm283x: 1 location
>=20
> * Status information is written to the FIFO along with each received
> packet. Therefore, a minimum space of (Largest Packet Size / 4) + 1 must
> be allotted to receive packets. If a high-bandwidth endpoint is enabled,
> or multiple isochronous endpoints are enabled, then at least two (Largest
> Packet Size / 4) + 1 spaces must be allotted to receive back-to-back
> packets. Typically, two (Largest Packet Size / 4) + 1 spaces are
> recommended so that when the previous packet is being transferred to AHB,
> the USB can receive the subsequent packet. If AHB latency is high, you
> must allocate enough space to receive multiple packets. This is critical
> to prevent dropping of any isochronous packets.
>=20
> bcm283x: (1024/4) +1 =3D 257 locations. For MC >1: 2 * 257 =3D 514 locati=
ons
>=20
> * Along with last packet of each endpoint, transfer complete status
> information is also pushed in to the FIFO.
>=20
> bcm283x: The core should have 5 IN and 5 OUT EP's.
> 1 location for each EP - 10 locations.
>=20
> It's for the case when all EPs are simultaneously completing transfers.
>=20
> * An additional location for EPDisable status for each endpoint is
> also required.
>=20
> bcm283x: 1 location for each EP - 10 EP's - 10 locations
> It's for case if EP simultaneously disabled.
>=20
> * Typically, two locations for each OUT endpoint is recommended.
>=20
> bcm283x: 5*2 =3D 10 locations
>=20
> Total: 13 + 1 + 257 + 10 +10 + 10 =3D 301 locations
>=20
> Safer is 301 + 257 (for MC>1) =3D 558 locations.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>

It'd be nice if you summarized a little. Halfway between this and the first
revision of this patch. For example:

[...]

RX FIFO's size is calculated based on the following (in 4byte words):
 - 13 location for SETUP packets
 - 1 location for Global OUT NAK
 - 2 * 257 locations for status information and the received packet. Note t=
hat
   typically two spaces are recommended so that when the previous packet is
   being transferred to AHB, the USB can receive the subsequent packet.
 - etc...

Also, what is MC in your description? If in doubt just drop it a stick with=
 the
explanation above.

Regards,
Nicolas

> ---
>  arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi        | 2 +-
>  arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> index e2fd961..20322de 100644
> --- a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> +++ b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  &usb {
>  	dr_mode =3D "otg";
> -	g-rx-fifo-size =3D <256>;
> +	g-rx-fifo-size =3D <558>;
>  	g-np-tx-fifo-size =3D <32>;
>  	/*
>  	 * According to dwc2 the sum of all device EP
> diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
> b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
> index 0ff0e9e..1409d1b 100644
> --- a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
> +++ b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  &usb {
>  	dr_mode =3D "peripheral";
> -	g-rx-fifo-size =3D <256>;
> +	g-rx-fifo-size =3D <558>;
>  	g-np-tx-fifo-size =3D <32>;
>  	g-tx-fifo-size =3D <256 256 512 512 512 768 768>;
>  };


--=-BbFqBP9cWw8UjvP0rUr/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5ESqcACgkQlfZmHno8
x/69BAf+IvcAygOJxISYiTuhVG7YF6DERXjwAEqqlaRj/g4Na1z/r48bPpgVXSRV
aoGaoXQ3iPoFfPIeirUN6n5DjAqkfSyIAy+Ldyw/ZnLLFMfHQ0olbXLOON/WH/0f
3Z0oVVDSYNI0DTa8qph2i08lJg1lbar+sCslVPyzwnVu87rjJjh0NOe5UqXrljwN
8mP68SaOzLzZKhHSEAU68bQGTvgbbCrI9MjxqKFB9Ac5XondPmuHkm8VwVdNlY1a
eCVEKAyZspAHEj6P4y3qLF2PGTK/Ltarfpp8xHeev3vqnC4fVNwB5HMgXuLfGw8H
Z1XySh+4RQG1sA2qcxxbRwNuJlvzmw==
=ts39
-----END PGP SIGNATURE-----

--=-BbFqBP9cWw8UjvP0rUr/--

