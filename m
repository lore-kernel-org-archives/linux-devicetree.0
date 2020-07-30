Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A406BC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 22:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D6AA20829
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 22:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596148110;
	bh=GvpWxvd9qk2+XrI06V1aIgtnRaagWK5auktIrnkn96g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=UNUIF8/dAxJq4oSbUZk9+odlkgpgUWkC8rJEs2op21GuzXFHL74DqJ3d/SQ6RnrmB
	 G9vpM0plbq/WlNubbKYiAOlNhWFpOduCNorkTwQgnuQ1yDfaKQX6fM+RveoCbPj1y1
	 8CPqiLVEAPCd1D0kJqNyd6e9jVHmZitW6m1NxRjE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730592AbgG3W2a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 18:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:40710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730478AbgG3W23 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jul 2020 18:28:29 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC1B42083B;
        Thu, 30 Jul 2020 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596148108;
        bh=GvpWxvd9qk2+XrI06V1aIgtnRaagWK5auktIrnkn96g=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=1/hQuHyl+Eu09HNOCnRkosMVMzTwmBsTYm3GcX5DIgKQehYEBLbB0x7BmpUYYnyZA
         fBIgHmXx7zsZ3uRLzJ4m2DUPg66lNm5pXo6NBCG2Ho5z1IV+wNYw3r2wuvYO77p5J6
         w30aeGCoOlrV4E4khuXpJlF+z23wN+kWgg+ttxeo=
Date:   Thu, 30 Jul 2020 23:28:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <873659bpbk.wl-kuninori.morimoto.gx@renesas.com>
References: <873659bpbk.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: ak4613: switch to yaml base Documentation
Message-Id: <159614804535.1473.7153174858928627488.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 30 Jul 2020 13:28:37 +0900, Kuninori Morimoto wrote:
> This patch switches from .txt base to .yaml base Document.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ak4613: switch to yaml base Documentation
      commit: 4d1976c79946cdf6ba3b53e26992ea0c0abf03da

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
