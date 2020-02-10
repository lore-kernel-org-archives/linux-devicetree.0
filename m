Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2398BC352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 07:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D95B220733
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 07:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="bRqsLi7K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="irGQOy80"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgBJH4b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 02:56:31 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53373 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgBJH4b (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Feb 2020 02:56:31 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 2DBF8213F4;
        Mon, 10 Feb 2020 02:56:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 10 Feb 2020 02:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=mYJD4XgfNRDfSweONVY5gZLpJ83
        5x2VDcX8DOl08NCA=; b=bRqsLi7KIGldvt61yylHmvKd7xAAdY8mN5u0BzZvS+l
        RTuQT7/oQic3mRTjqxHnPN+vmaFFlI3SGMC+ERQpgf9oOWgRPCsL5sTE0CdRsq7+
        gJfRmxkDUZ5cTy+uGxbNn7/l8nVo8ZUmonj+VvPSEaB1LnPkl9yuvvupVw2Gk09N
        N8Q5X+X4kcdv1kyEpezFJxoiaPGEISXreDPAtitGK71nvYMoz2Uh75jUCAsx/aMR
        k77QAWD/1Jlz4VmWiameZx9T+Cw3EFR0lRyOSWISWPlKuW1SqscTQQljhQ0E3lwC
        cyQruyxlXaF89eluWjIgNRSupUPbnzF1vcP63o51JgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mYJD4X
        gfNRDfSweONVY5gZLpJ835x2VDcX8DOl08NCA=; b=irGQOy8051vLdm+fvF2YaP
        5B49iLtzhCOtecG/koFAd70qmhV5uAP0dAJlZxnRmVGoeXJK9ekHMOILhoLjntvM
        54LeVtwYtPvqhnFy+0sreBiFcexkRg+bnodzVCRZQ445ItXwmlhlz+yJ7mBpgDh1
        wJbbS1FViPi7R9Tc3pAXSSb+nJIeE3LCAtkEQpd5JU8omTG8DttqavyfLUHPnLkJ
        /BZrAyar+6xMGmdM1jiO4GAkin2bkPEt/w6Mi6KOkl1tcsOy3P0q6FRaRs4iufGs
        JRTN7CyIUJO2G8pukj752K8L27MKvnz2+xeiZACyIkfXYm9pNCgQSnWK7kaYKarg
        ==
X-ME-Sender: <xms:rQxBXgJjFd69NQgU7ZDhXPpIhCm9sRFOvadcjaRtMqbORu2mtggbsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedtgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    eplhhinhhuthhrohhnihigrdguvgdpghhithhhuhgsrdgtohhmnecukfhppeeltddrkeel
    rdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rQxBXgp7TUvT9ibOm5k5rNlIL8Fb52jcuk5snIuOncP4BBglLso10Q>
    <xmx:rQxBXiZJKN8xhXoNMmj0C-PINgYldntMWlmY54EzZpaqB6ZtG7Kg3g>
    <xmx:rQxBXox-iCslvHRr8rgj79b-j3XFJfpl5H47AwkLd7i5wbHGU7x6Yg>
    <xmx:rgxBXlVFh-zJfFSJSM9rU_ksOz51sX6G5P5YdggYIMg717xCXyIcmA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 780BC328005E;
        Mon, 10 Feb 2020 02:56:29 -0500 (EST)
Date:   Mon, 10 Feb 2020 08:56:28 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     bage@linutronix.de
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: [PATCH 5/5] ARM: dts: sun7i: Add Linutronix Testbox v2 board
Message-ID: <20200210075628.2oaa4xnvkwoxkpr6@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-6-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mnz3hqafl3jdmmee"
Content-Disposition: inline
In-Reply-To: <20200206113328.7296-6-bage@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--mnz3hqafl3jdmmee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2020 at 12:33:27PM +0100, bage@linutronix.de wrote:
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
> - a I2C EEPROM,
> - a secure key storage (ATECC608a) and
> - two RS232 compliant serial ports.
>
> Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                    |  1 +
>  arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts | 65 +++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 08011dc8c7a6..383541842695 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1069,6 +1069,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>  	sun7i-a20-i12-tvbox.dtb \
>  	sun7i-a20-icnova-swac.dtb \
>  	sun7i-a20-lamobo-r1.dtb \
> +	sun7i-a20-lx-testbox-v2.dtb \
>  	sun7i-a20-m3.dtb \
>  	sun7i-a20-mk808c.dtb \
>  	sun7i-a20-olimex-som-evb.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts b/arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts
> new file mode 100644
> index 000000000000..3b91fb026a92
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-lx-testbox-v2.dts
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

Using a double license would be great, otherwise other projects
licensed under something else than the GPL might not be able to use
it.

> +/*
> + * Copyright 2020 Linutronix GmbH
> + * Author: Benedikt Spranger <b.spranger@linutronix.de>
> + */
> +
> +/dts-v1/;
> +#include "sun7i-a20-lamobo-r1-common.dtsi"
> +
> +/ {
> +	model = "Lamobo R1";
> +	compatible = "lx,testbox-v2", "lamobo,lamobo-r1", "allwinner,sun7i-a20";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_pins_lamobo_r1>;

You don't need the pinctrl nodes at all for GPIOs

Maxime

--mnz3hqafl3jdmmee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkEMrAAKCRDj7w1vZxhR
xbtwAP9xriLCVy8pmhFPhhHX0OmVOBxNHw7HLIQw6Fg8n+jPBQEAyqpG1t9WOi4B
WX9nf2Y+4hOcfNF5hr54JhBvN5E3dQM=
=Sii/
-----END PGP SIGNATURE-----

--mnz3hqafl3jdmmee--
