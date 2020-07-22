Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984EAC433E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 00:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A8BE2176B
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 00:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595379438;
	bh=riS8bMs892HGteqg2+0T2hRaNKMd6XV6TpU0/EGhfIg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=G40SkuYGs49E6w/jGT9TY8pgW3JVx1HXK6/xWy9ZZI8T33b9aRkqQNvcFYnaQI5Q7
	 8+5jycnR9Mtn3Loo/t+fNUaDWd0KYbk8UCivU8lALFlv6PHbYccvdp2qOFcP1gE/GK
	 iTKjBrCft0ei9rnIFn9iXlBloKW0XZtzToK7Zdf0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731600AbgGVA5S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 20:57:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731599AbgGVA5R (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 20:57:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9088208E4;
        Wed, 22 Jul 2020 00:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595379437;
        bh=riS8bMs892HGteqg2+0T2hRaNKMd6XV6TpU0/EGhfIg=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=dzOHzGLHSeUIJy5drw5i19eUV72jDThgW8NRwVEUiqXR2i43WuJBnmQ6hNdyKb0z8
         9v4FVqeko9e7+2ESsir/SsIDktaD9vWMQEyFtcXsMWvp3J93SZC1dgNDVw9mDRmEEj
         ILWzTuDF5YeLjfbuJkbLzlSnh2wLW7tLO/iHnD1Y=
Date:   Wed, 22 Jul 2020 01:57:04 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org
In-Reply-To: <20200608174658.1315325-1-thierry.reding@gmail.com>
References: <20200608174658.1315325-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: sgtl5000: Convert to json-schema
Message-Id: <159537940423.49432.17540517625529265309.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 8 Jun 2020 19:46:58 +0200, Thierry Reding wrote:
> Convert the Freescale SGTL5000 device tree bindings from free-form text
> format to json-schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sgtl5000: Convert to json-schema
      commit: c3061bc73fd7073e6ea9a780a99bbb15587f8abe

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
