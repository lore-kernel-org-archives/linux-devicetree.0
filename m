Return-Path: <SRS0=1b9y=CE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439F9C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 12:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ECAB20B1F
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598446599;
	bh=iyBrGKIuWDpQ96yGsm/xxl/JNJCgYnxw0uCgCZMcfC0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=cElFwIKIjo2M/9Xel14VOccVll44yLSWp3DA3Mroq+I91pbQ/cewdsPMkVzOM5dxW
	 f38IFcAi9kaxa66HPXe2aLslseeh3C0jhoV2R6OLM9fJ3+5BV3iLDUZv0OQUFgC2my
	 k/QjUbRpCOpT126XrqojQJ1ZTkJODA2MkKG6GOjw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbgHZM4b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Aug 2020 08:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729944AbgHZM4b (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Aug 2020 08:56:31 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A0A6208E4;
        Wed, 26 Aug 2020 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598446591;
        bh=iyBrGKIuWDpQ96yGsm/xxl/JNJCgYnxw0uCgCZMcfC0=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=CXQKVjF0g0mpyijPuLzHX+j6jgFgwa5M/o3L1GFs4/Rjxe2l+Mw0sbsfgoPpJBG7c
         eiF9XZHyLemgXJxWxOPHMxz/7dibkFq1WgYaFF5o/NdA11hNUDRsVy5uiSPKVHn3lT
         2PFJpzP7uh6vXL6tuj1fBhg7tD+fox4JsDcP12hk=
Date:   Wed, 26 Aug 2020 13:55:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
        benjamin.chao@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, gene_chen@richtek.com,
        cy_huang@richtek.com, shufan_lee@richtek.com,
        Wilma.Wu@mediatek.com, devicetree@vger.kernel.org
In-Reply-To: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 0/2] regulator: mt6360: Add support for MT6360 regulator
Message-Id: <159844655479.37260.3133336814672440468.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 26 Aug 2020 18:49:16 +0800, Gene Chen wrote:
> This patch series add MT6360 regulator support contains driver and binding document
> 
> Gene Chen (2)
>   regulator: mt6360: Add support for MT6360 regulator
>   dt-bindings: regulator: mt6360: Add DT binding
> 
>  Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml |  113 ++
>  drivers/regulator/Kconfig                                         |    9
>  drivers/regulator/Makefile                                        |    1
>  drivers/regulator/mt6360-regulator.c                              |  459 ++++++++++
>  include/dt-bindings/regulator/mediatek,mt6360-regulator.h         |   16
>  5 files changed, 598 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: mt6360: Add support for MT6360 regulator
      commit: d321571d5e4c2d5511b75e6cf1a910e0a0c2a2e9
[2/2] dt-bindings: regulator: mt6360: Add DT binding documentation
      commit: 9b1d3422e16ffcd4dad7729459717b216490540d

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
