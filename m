Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE58C282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 16:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22F3B20721
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578587597;
	bh=4WvK/Vwr0t6fsucuKLCWVDS1adVfhfWQioHJ5iOeZRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WOUfwFAT6NA8bui4fhXvB536F8ql24VvXcMcbUJ5sbIp7v3wYdAVlRGyPf88CsHvs
	 G/+TN8GKOqkWZX7OJx8BlQASFzkIaj4ZtGnJMqieC0+Q6ZzSfr2YzOUQy+n2odyHCp
	 ftCwVtBoBg2By2uaSf+zPIFeLChJ000+gZVSVI90=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387675AbgAIQdQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 11:33:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:36736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729746AbgAIQdQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jan 2020 11:33:16 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77D4B2067D;
        Thu,  9 Jan 2020 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578587596;
        bh=4WvK/Vwr0t6fsucuKLCWVDS1adVfhfWQioHJ5iOeZRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ydf7n9Fblw0iNZ7Arj3yiZSJiFz2NDxehhoAbru69iCdNO66RvhNsnfvoS8WDSNqs
         rAqX4tcjxr+8u8wFi1CgBA48Tic44A4o6BODfLxU6I/XNwcXLTCa3dfZVt+CUXJWCc
         RZeqKAIzAI5Hf5CruQW2y4qEvlZ7FUwa0ZqORn1Y=
Date:   Thu, 9 Jan 2020 17:33:13 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: allwinner: a64: Enable DVFS on A64
Message-ID: <20200109163313.wrotyymf5hgiazki@gilmour.lan>
References: <20200108042018.571251-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="63v3ohpo2ubteem4"
Content-Disposition: inline
In-Reply-To: <20200108042018.571251-1-anarsoul@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--63v3ohpo2ubteem4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2020 at 08:20:14PM -0800, Vasily Khoruzhick wrote:
> This series introduces new DTSI with operating points for A64,
> adds cooling maps and thermal tripping points and enables DVFS
> on all the supported A64-based boards
>
> v2: - drop two commits that were merged
>     - mention where tripping points and OPP were taken from
>     - add new line after each node in OPP table
>     - split adding CPU clock and OPP into separate commits
>     - put operating points into their own dtsi

Applied, thanks!
Maxime

--63v3ohpo2ubteem4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhdVyQAKCRDj7w1vZxhR
xYoLAQDaU8aVVWmJIe8ePJZeGdrN601c8Zsful46WQo20L/sTQEA9e+OUlu72vXf
e/JDVRzPVUXp3lH5nVT6lcbUGhiErAU=
=0Q1E
-----END PGP SIGNATURE-----

--63v3ohpo2ubteem4--
