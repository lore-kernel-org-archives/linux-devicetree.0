Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFEEC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 17:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A08D206EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576516120;
	bh=QXjZ3NUYOTcRGYoFgeBkUlOrcelwhDJ23ou7b18ZyKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OIsNT9ufJqQcHMG6wg2vwufaoTtr37vivTOUAThHm/z4eLq3NbqUv4x7DXAlkBn0p
	 bJ0zcTJjmpEZIaL7HGNU1JIIXL1bKB53ARgwKkZkc52GpLCiUOWuJTGvKthE5CejGt
	 ZpDE9pApTZI/R5Zco2/szgCVJCto+e5kp9+VECUg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfLPRIj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 12:08:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:44510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726795AbfLPRId (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Dec 2019 12:08:33 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44F2C206EC;
        Mon, 16 Dec 2019 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576516112;
        bh=QXjZ3NUYOTcRGYoFgeBkUlOrcelwhDJ23ou7b18ZyKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zsdLiGBIeBF8PChIX3V4KiCUO47SxnGY6Zut2ucgG76ai2dOrnn9RlXaqtd0FvD52
         PY5QytrdGzCuUcqZfP4xJMC4tFpYRX2FqjHXyMgW0Ygs8eOxOUZuGpR3E6daVi+qaI
         feDaBlzvSpq7qrbYTLhK7XPKcYj3WX81LSjDDaUM=
Date:   Mon, 16 Dec 2019 18:08:30 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: clocks: Convert Allwinner A80 DE clocks
 to a schema
Message-ID: <20191216170830.sw2svgszlebb7cfu@gilmour.lan>
References: <20191209093558.50940-1-maxime@cerno.tech>
 <20191209093558.50940-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jfxwmnq66iyhmoim"
Content-Disposition: inline
In-Reply-To: <20191209093558.50940-3-maxime@cerno.tech>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--jfxwmnq66iyhmoim
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2019 at 10:35:58AM +0100, Maxime Ripard wrote:
> The Allwinner A80 SoC has a display clocks controller that is supported in
> Linux, with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied all three.

Maxime

--jfxwmnq66iyhmoim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfe6DgAKCRDj7w1vZxhR
xfX7AP9Z+s6gPPC1reoTZSt7GAPc/TEDd7kUms0QWUcLZnu9NAEAyLHUh87Tow0u
/b0eA5xrrvHPxmsK7y+/Pw/uqXoQXAk=
=6iZL
-----END PGP SIGNATURE-----

--jfxwmnq66iyhmoim--
