Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C939C5DF62
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 12:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4619621848
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573042078;
	bh=QfG9VKYVm3uABcMyvzBKS82KRq/p1UCgZOMJNvPhTBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B+rCvhBWuomdbJAKtnsmtRNvIjrrFc3f9HlBx975/d8rNZGAh4xFe//F5MAmnawtC
	 pfskN0hwsAR5MdHs1CH19dpz2mhw+gEffAnZq1au3tncMtSYteEJRNxoIPio+Oajhb
	 tSi4WfbXLKcOPYDHFLWJvEpDvOjEfSddPxYm4T9Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbfKFMH6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 07:07:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:47168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728646AbfKFMH5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 Nov 2019 07:07:57 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67977214D8;
        Wed,  6 Nov 2019 12:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573042076;
        bh=QfG9VKYVm3uABcMyvzBKS82KRq/p1UCgZOMJNvPhTBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zhbAxfhYabDD5iG+dB1Qv3ho2CIj/DA04G8cxDeLXbMOpYWoLhu0kmtOTPiSQ/4VO
         B7ikXumsyENd7y/58YKxM4jb3OzD2EouNeBgA/BuyjJhCJFFjZDM+LRRinQ8NS05ab
         dfwWcS4Wu92ZJLH/+OATvrn4schgV1p+A91k6flw=
Date:   Wed, 6 Nov 2019 13:07:54 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Harald Geyer <harald@ccbib.org>,
        "Jared D . McNeill" <jmcneill@netbsd.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Emmanuel Vadot <manu@freebsd.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Re-add PMU node
Message-ID: <20191106120754.GC8617@gilmour.lan>
References: <20191105110651.217513-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline
In-Reply-To: <20191105110651.217513-1-andre.przywara@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Nov 05, 2019 at 11:06:51AM +0000, Andre Przywara wrote:
> As it was found recently, the Performance Monitoring Unit (PMU) on the
> Allwinner A64 SoC was not generating (the right) interrupts. With the
> SPI numbers from the manual the kernel did not receive any overflow
> interrupts, so perf was not happy at all.
> It turns out that the numbers were just off by 4, so the PMU interrupts
> are from 148 to 151, not from 152 to 155 as the manual describes.
>
> This was found by playing around with U-Boot, which typically does not
> use interrupts, so the GIC is fully available for experimentation:
> With *every* PPI and SPI enabled, an overflowing PMU cycle counter was
> found to set a bit in one of the GICD_ISPENDR registers, with careful
> counting this was determined to be number 148.
>
> Tested with perf record and perf top on a Pine64-LTS. Also tested with
> tasksetting to every core to confirm the assignment between IRQs and
> cores.
>
> This somewhat "revert-fixes" commit ed3e9406bcbc ("arm64: dts: allwinner:
> a64: Drop PMU node").
>
> Fixes: 34a97fcc71c2 ("arm64: dts: allwinner: a64: Add PMU node")
> Fixes: ed3e9406bcbc ("arm64: dts: allwinner: a64: Drop PMU node")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks for figuring this out!
Maxime

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcK3mgAKCRDj7w1vZxhR
xTd+APwKpOxpqefT67CJjNitd13UiHVtbg6+p06GY1iJTZ3LZQEA2lSDhu1e8qmi
bprwmvdut5IsfcdKSQ48CGx5Y/ba9gc=
=Ify8
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
