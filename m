Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F84C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4A5D21925
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573560963;
	bh=PGMUsteCMC7dAWf+pA+tGpqOg+FC1KkakCiurKxYkCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YehO39GV9S2qadkfIblCtMfyYX4mSeiG69E1qjwnINajYKm6MgrRT3gRNGH9QvSJl
	 TtqqEBlvUvf0uwgtfmsAZjEULMeBwzhsdrZ6kaxUOM/WhGbUNOAT+Dy8Hxs3ktMn1E
	 uvxT/rY2GtKhbrvSTJhiLXGr2ZsRh3dS45sRFz3I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfKLMQD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 07:16:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:60990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbfKLMQD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 07:16:03 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57A3720818;
        Tue, 12 Nov 2019 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573560961;
        bh=PGMUsteCMC7dAWf+pA+tGpqOg+FC1KkakCiurKxYkCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0odtGpXaoRlMlnYBicS2ZNqOPYoblOV3MPf75FsEeu9gXZZO+H474mZTiSXRNCkGK
         MTz0p5Oa//qMDAcwqBX/kG12U8FLc2E0DaTOAeXlpNIxQJpqaU2j8DVCteA9QpnJW3
         OJlSySHpmO4yKEzLaZ4+bT/fnJ+YzCTEtmsZ7RXk=
Date:   Tue, 12 Nov 2019 13:15:58 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Georgii Staroselskii <georgii.staroselskii@emlid.com>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm: dts: sunxi: Add Neutis N5H3 support
Message-ID: <20191112121558.GZ4345@gilmour.lan>
References: <1573048998-8913-1-git-send-email-georgii.staroselskii@emlid.com>
 <1573048998-8913-3-git-send-email-georgii.staroselskii@emlid.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S4+Kf2w4CfEO117G"
Content-Disposition: inline
In-Reply-To: <1573048998-8913-3-git-send-email-georgii.staroselskii@emlid.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--S4+Kf2w4CfEO117G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Nov 06, 2019 at 05:03:18PM +0300, Georgii Staroselskii wrote:
> Emlid Neutis N5H3 is a version of Emlid Neutis SoM with H3 instead of H5
> inside.
>
> 6eeb4180d4b9 ("ARM: dts: sunxi: h3-h5: Add Bananapi M2+ v1.2 device")
> was used as reference.
>
> Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
> ---
>  arch/arm/boot/dts/Makefile                         |  1 +
>  .../dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts    | 61 ++++++++++++++++++++++
>  arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi  | 11 ++++
>  3 files changed, 73 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
>  create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3f13b88..c997b0c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1119,6 +1119,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-h3-orangepi-plus2e.dtb \
>  	sun8i-h3-orangepi-zero-plus2.dtb \
>  	sun8i-h3-rervision-dvk.dtb \
> +	sun8i-h3-emlid-neutis-n5h3-devboard.dtb \

There's no need to duplicate the H3 in the name, we can just call it

sun8i-h3-emlid-neutis-n5-devboard.dts

Unless you expect some other boards named in a similar matter?

>  	sun8i-r16-bananapi-m2m.dtb \
>  	sun8i-r16-nintendo-nes-classic.dtb \
>  	sun8i-r16-nintendo-super-nes-classic.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
> new file mode 100644
> index 00000000..3b68750
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * DTS for Emlid Neutis N5 Dev board.
> + *
> + * Copyright (C) 2019 Georgii Staroselskii <georgiii.staroselskii@emlid.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sun8i-h3-emlid-neutis-n5h3.dtsi"
> +
> +/ {
> +	model = "Emlid Neutis N5H3 Developer board";
> +	compatible = "emlid,neutis-n5h3-devboard",
> +		     "emlid,neutis-n5h3",
> +		     "allwinner,sun8i-h3";

Same remarks for the compatible, we have the h3 compatible here to
differentiate between the two.

You should also document this combination to
Documentation/devicetree/bindings/arm/sunxi.yaml.

> +
> +	vdd_cpux: gpio-regulator {
> +		compatible = "regulator-gpio";
> +		regulator-name = "vdd-cpux";
> +		regulator-type = "voltage";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1300000>;
> +		regulator-ramp-delay = <50>; /* 4ms */
> +		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> +		gpios-states = <0x1>;
> +		states = <1100000 0x0
> +			  1300000 0x1>;

While DTC outputs the same thing, and it works, you should make this
an array of 2 items of 2 cells, instead of a array of 1 item of 4
cells.

Like this: states = <1100000 0x0>, <1300000 0x1>;

While this doesn't change anything with DTC, other cases (like DT
validation) care about this.

Look good otherwise.
Maxime

--S4+Kf2w4CfEO117G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcqifgAKCRDj7w1vZxhR
xTJhAP49LjPXdh7Zbpwskihx63FPZvkalpokgo8b0SAu4hNfbwD/TMzFgq9ol9tZ
/H2mEYDlySZJBal4r3VClVq77VP+Dg8=
=0hUb
-----END PGP SIGNATURE-----

--S4+Kf2w4CfEO117G--
