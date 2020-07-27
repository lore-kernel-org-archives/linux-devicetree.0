Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2C1C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 13:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE44A20775
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595858209;
	bh=aXB8OuZKjJ99TwcQL9C/buv5PV0zEHUF7o6/ZjPRQKs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=sHrcITFygSCZLRBgSNd7Ri1j8eP0sU6opdRJq9oeiZXShyTi6e68DUo4bSAL2ViMM
	 G/XXROi3/8AOeuYPt1RaJLFgQfEWNfw2/v183pdMzcuX3c76wj2rSHLxxpAHu8rXlS
	 y6PHuRkefmaVDFTbv9cDU0lUzAqLSmSD6FgmyP6o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgG0N4t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 09:56:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgG0N4t (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 09:56:49 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63E842070B;
        Mon, 27 Jul 2020 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595858208;
        bh=aXB8OuZKjJ99TwcQL9C/buv5PV0zEHUF7o6/ZjPRQKs=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=mywIZv0SX1ZOQi/CgjmoXgbexBj7H+kdN23PM1EAXQfZtSqwC3YEqelyT3RFHjsjb
         K6WkE6qHikR8tn89kt3XJfRKKcSF6Zl6CT+9khxKQoOFsl+D0yDuSzX4shsMwavb1s
         L8IoSn9ApKWyNj/vQ0wWWyyOw3WMZdErNNlWjSZY=
Date:   Mon, 27 Jul 2020 14:56:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200727082502.2341-1-stephan@gerhold.net>
References: <20200727082502.2341-1-stephan@gerhold.net>
Subject: Re: [PATCH] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX, TX, RX} defines
Message-Id: <159585818664.22279.12867263399663815841.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jul 2020 10:25:02 +0200, Stephan Gerhold wrote:
> Right now the direction of a DAI has to be specified as a literal
> number in the device tree, e.g.:
> 
> 	dai@0 {
> 		reg = <0>;
> 		direction = <2>;
> 	};
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX, TX, RX} defines
      commit: 34facb04228b36006a37727fddee59cf069d95d4

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
