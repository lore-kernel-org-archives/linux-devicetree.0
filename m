Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647D6C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28CDC20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578499446;
	bh=GlCfqyySpJw/Yg2GpZ82R6+4QUJLHH/cQeS3qO5FAhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B2rZDHlkdQbx9ceb1IPTplbUkQm4heKK5cr1tCtJlkhtpprPdMdsJHNWWeS/M+Svg
	 pXPb5qb1Ee3+MTzzeDQcyruDD4TXizR41j/kdDPScKujSkbaoLU6gAgDv+u/iccjhN
	 yGLK84tYkvV7lY5srepig04G1wwX7JoSnLdzMVbc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgAHQEF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:04:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:44770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgAHQEF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jan 2020 11:04:05 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 976CA2070E;
        Wed,  8 Jan 2020 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578499445;
        bh=GlCfqyySpJw/Yg2GpZ82R6+4QUJLHH/cQeS3qO5FAhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJukIpmyM1pbBq48i7yegRvqVqK0MXi2sHAVWEk4t3RGKDVNK48wzTTGp/zRuxG5e
         0TkFFzjhb1iL8ynNLJh9Ww6MEh1hQKEMDOk/cJD+DeuTq0K33iyxfyRLzUN4E42aPM
         99gc1SyddQvIcmj8ic5XRmNURy+WNHrKbZxWjgyA=
Date:   Wed, 8 Jan 2020 17:04:02 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: allwinner: a64: Enable DVFS on A64
Message-ID: <20200108160402.u44odtfsuhiuytfl@gilmour.lan>
References: <20200108042018.571251-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="56arlx7x5vlcfzas"
Content-Disposition: inline
In-Reply-To: <20200108042018.571251-1-anarsoul@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--56arlx7x5vlcfzas
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jan 07, 2020 at 08:20:14PM -0800, Vasily Khoruzhick wrote:
> This series introduces new DTSI with operating points for A64,
> adds cooling maps and thermal tripping points and enables DVFS
> on all the supported A64-based boards

Thanks for that new series.

I'm not sure I've seen the answer, but how did you test that the OPPs
were stable?

So far, the only method that proved to be reliable was to run
https://github.com/ssvb/cpuburn-arm/blob/master/cpufreq-ljt-stress-test

Could you paste the result (one board should be enough) ?

Thanks
Maxime

--56arlx7x5vlcfzas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhX9cgAKCRDj7w1vZxhR
xYdAAQCD2eBEbQsMOmLn6QvePtBn+9ActC0b0QyoO9SE7cRp4AD9HV9OjxZAvMzi
hmLfolvy8IcSXadEK9djjiNh65goiAA=
=dYiD
-----END PGP SIGNATURE-----

--56arlx7x5vlcfzas--
