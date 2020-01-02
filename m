Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2461AC2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 09:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEF9D21835
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577957535;
	bh=EfkiR40ecIKtIaHQGSgzrVNTtjwUChSeOvmRTEf0NeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=F0sBKUoQ9MHIhiNVyAU1GAP7yQH/yl2dGQxMdx2IHqhD75SRiChy+j3AVxcF6fZbq
	 7WEvRGJy9W2xHuCwbSVfGwI+SFnT2i2P5bf878N6Ypsj1W7IH5OwBkUtkPWwwtSH2/
	 okHWblFOAo8RhQ9cK7VS7hFseYzgCveV9VTDaFWk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgABJcO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 04:32:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:58182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727924AbgABJcO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Jan 2020 04:32:14 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A110217F4;
        Thu,  2 Jan 2020 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577957533;
        bh=EfkiR40ecIKtIaHQGSgzrVNTtjwUChSeOvmRTEf0NeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HY9ns/JRiSI20ujcRIjz049nfsi+nGX20z/SLvMYK98tBMEh+6dKrYBV8/sdCexJv
         QRB7WT9E35kPwPZv3Ar+bzFJoys0dNyha0HF0uFNgi/CtWaz0gjHOwJMsxnnA6g4xn
         zrs+DZzAbg8pWKePnvTqX5uE9phS80yW1SHsNmhU=
Date:   Thu, 2 Jan 2020 10:32:11 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: R40: Add PMU node
Message-ID: <20200102093211.a5hl7hxfqpkvdg6g@gilmour.lan>
References: <20200102012657.9278-1-andre.przywara@arm.com>
 <20200102012657.9278-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="khktdkfc5ltuwnt7"
Content-Disposition: inline
In-Reply-To: <20200102012657.9278-3-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--khktdkfc5ltuwnt7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 02, 2020 at 01:26:56AM +0000, Andre Przywara wrote:
> The ARM Cortex-A7 cores used in the Allwinner R40 SoC have their usual
> Performance Monitoring Unit (PMU), which allows perf to use hardware
> events.
> The SoC integrator just needs to connect each per-core interrupt line
> to the GIC. The R40 manual does not really mention those IRQ lines, but
> experimentation in U-Boot shows that interrupts 152-155 are connected to
> the four cores (similar to the A20).
>
> Tested on a Bananapi M2 Berry, with perf and taskset to confirm the
> association between cores and interrupts.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks!
Maxime

--khktdkfc5ltuwnt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg24mwAKCRDj7w1vZxhR
xRyVAQDskdeVCrnBIz+PwfM7pnDyrbP6Vfz5kuMGp2f0HtsgTAEAhwv93dTAojGe
94XhPjpzKTIrq1CbJAo0V+RhqKohFQg=
=Fa3V
-----END PGP SIGNATURE-----

--khktdkfc5ltuwnt7--
