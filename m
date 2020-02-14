Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F8AC2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 13:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 270AC2187F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 13:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="GusOwzis";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fokoz3H/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgBNN0t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 08:26:49 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35423 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgBNN0t (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 08:26:49 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id ECDC922012;
        Fri, 14 Feb 2020 08:26:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 08:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=kh6wFCbO/Y8gjrFw8l3UtrjY1zo
        YJuxaVqFqWxhcBBs=; b=GusOwzis/J+QHQ93MHkzhGOYfUM1cvKfYBsjN8Z8PIk
        Q12LhKpDMd77gkglS/Tq6xjFHpssG75cQgVUXOMFIV++yvKSn+bo3JkWRXGspI8z
        r/upJuHxTNJu8Xg9SipZqIbVDiTmiuG4tPIdtPptSuomVWUdTyBHUvYnjMHb6zMb
        IB5YZYeNoCJmJ1PQ4np60oeWLzPNPrN+JgAJQAbs6+in2Onolrh4z/NsV4t/wfeU
        PS9u4NPDbMWuouDaqfGDa2eEB/P8/0HtB8nz4u+Kt3Xli+cuYGqR7dFBdNxK8NTP
        K5vwrq3Ol6JJzLHaArI8ZCVsPg6yWg4dskPDF1D/r+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kh6wFC
        bO/Y8gjrFw8l3UtrjY1zoYJuxaVqFqWxhcBBs=; b=fokoz3H/Ypu9zHfbmTYa4U
        2it3H71NpCFHejVbuBdnkp/AC+8tXFJlqMjPqmbfX8SM0OlOj3+dLGrY/9A1LveB
        oSwnFmWqYla7rPyP097ZTxXSox3GmFNClU1wYGomd5mkG/KiJNN7j9Mmu4DbJV1M
        Whpq1B64Bugc4Ce1+ITR0ilVFZKHuT9PqcAs4+HtWJP2xxyBBdPb79/jfmS7xiJI
        yDFrkZJa0RFhE7GRCtZPNwtAC6nwd1/2coswSrR0t5nNLpB+IUCQufH1OwomKu42
        MM+BInvL1JyhTaO80pkWUtlZmUWAJzgmwaOgPkMs1X234GULjFCNJ9a7BQSUOFZA
        ==
X-ME-Sender: <xms:F6BGXh3CvVp6bUcuUhwR3o3GEIqFcTt-74MlcdwXfJ2T1kbxuMYg_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    eplhhinhhuthhrohhnihigrdguvgdpghhithhhuhgsrdgtohhmnecukfhppeeltddrkeel
    rdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:F6BGXic5ZCwNxYCsIb-KoqbSvd599aRsUHu7fvHi7Ntfp5HHzUX_Zg>
    <xmx:F6BGXiqbermX2sFrxz899t4mpA2LombW6Wsk2wc3icbxDiPk6i6WVw>
    <xmx:F6BGXsXf7YGYi99QDt46D1X--UxgFWZl7Vg3wbgftjgfI7e03IWS5Q>
    <xmx:F6BGXubWGiXCO1PbHslnPSsYXY-e7GYN39vZu9XzBrxx2AEKEmricw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3CF513060FDD;
        Fri, 14 Feb 2020 08:26:47 -0500 (EST)
Date:   Fri, 14 Feb 2020 14:26:45 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     bage@linutronix.de
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: [PATCH v2 3/3] ARM: dts: sun7i: Add Linutronix Testbox v2 board
Message-ID: <20200214132645.so2pu5qng4xehldu@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200214111003.11115-1-bage@linutronix.de>
 <20200214111003.11115-4-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5gmx6di2e3atvfwp"
Content-Disposition: inline
In-Reply-To: <20200214111003.11115-4-bage@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--5gmx6di2e3atvfwp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 12:10:03PM +0100, bage@linutronix.de wrote:
> From: Bastian Germann <bage@linutronix.de>
>
> The Testbox board is an open hardware enhancement for the Lamobo R1 router
> board.  The Testbox board is used in the CI-RT project to manage devices
> under test (https://ci-rt.linutronix.de).
>
> The hardware project is located at https://github.com/ci-rt/testbox-shield
>
> The Testbox v2 expands the Lamobo R1 router board with
> - a power supply,
> - a CAN bus PHY,
> - a power control,
> - a relay,
> - an I2C EEPROM,
> - a secure key storage (ATECC608a) and
> - two RS232 compliant serial ports.
>
> Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../dts/sun7i-a20-linutronix-testbox-v2.dts   | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-linutronix-testbox-v2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d6546d2676b9..e9ddca2946ce 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1086,6 +1086,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>  	sun7i-a20-i12-tvbox.dtb \
>  	sun7i-a20-icnova-swac.dtb \
>  	sun7i-a20-lamobo-r1.dtb \
> +	sun7i-a20-linutronix-testbox-v2.dtb \
>  	sun7i-a20-m3.dtb \
>  	sun7i-a20-mk808c.dtb \
>  	sun7i-a20-olimex-som-evb.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-linutronix-testbox-v2.dts b/arch/arm/boot/dts/sun7i-a20-linutronix-testbox-v2.dts
> new file mode 100644
> index 000000000000..685874d44e35
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-linutronix-testbox-v2.dts
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2020 Linutronix GmbH
> + * Author: Benedikt Spranger <b.spranger@linutronix.de>
> + */
> +
> +/dts-v1/;
> +#include "sun7i-a20-lamobo-r1.dts"
> +
> +/ {
> +	model = "Lamobo R1";
> +	compatible = "linutronix,testbox-v2", "lamobo,lamobo-r1", "allwinner,sun7i-a20";
> +
> +	leds {
> +		led-opto1 {
> +			label = "lamobo_r1:opto:powerswitch";
> +			gpios = <&pio 7 3 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-opto2 {
> +			label = "lamobo_r1:opto:relay";
> +			gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	eeprom: eeprom@50 {
> +		compatible = "atmel,24c08";
> +		reg = <0x50>;
> +		status = "okay";
> +	};
> +
> +	atecc508a@60 {
> +		compatible = "atmel,atecc508a";
> +		reg = <0x60>;
> +	};
> +};
> +
> +&pio {
> +	led_pins_lamobo_r1: led-pins {
> +		pins = "PH3", "PH5", "PH24";
> +		function = "gpio_out";
> +		drive-strength = <40>;
> +		bias-disable;
> +	};
> +};

That node was unused, so I removed it as well while applying, thanks!

Maxime

--5gmx6di2e3atvfwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkagFQAKCRDj7w1vZxhR
xQDhAP4t9Y+oklMTU6Nk53wRvkB3qoJl0CbjH+wY49pd8/WeuAD+JZjfbMmLGfb8
uyFZFB66JCUVa2StsZ7xkNyefpZ2aAk=
=7NOs
-----END PGP SIGNATURE-----

--5gmx6di2e3atvfwp--
