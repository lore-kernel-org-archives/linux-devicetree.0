Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2955AC433E6
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 23:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDF31207FB
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594943869;
	bh=C/Qx8pMMcRCQhYA68QTgyRpiHd8vS4ViFujt9/YA2kA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=qUZLUsXEfWauYHNvI30b0GplaB1V4FJqvUoZLJiYqBj2u2xsqdiV+rQhf2weFFLyU
	 aG/rCABaRlvp0vYNmsR21Af8XxNwy2ZmWXiGVob74pIb/nJFW25shY7Wq9Fa9m4Pl5
	 2euuHTlpPydV65JcHIxUAXEj8izymL0Lx5kDb0/Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgGPX5s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 19:57:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgGPX5s (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 19:57:48 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76C112076D;
        Thu, 16 Jul 2020 23:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594943868;
        bh=C/Qx8pMMcRCQhYA68QTgyRpiHd8vS4ViFujt9/YA2kA=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=hUMBcEE8EGm/UJWaeuRIjeI59Sv3wu9tzwc89XJE5ScGMEBEwRWbGewCBbBJW4CXR
         3ffz2KU5AFbCpu14nYaNQJqBMVdwQSLNBC4iyAuGO29z9NiHjnKxKQSvIA1+uDxbi8
         6+OfTgmNFdNJzFoqkaeFm5pQDwe+T3Gv5jPHE73A=
Date:   Fri, 17 Jul 2020 00:57:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <87lfjwxlna.wl-kuninori.morimoto.gx@renesas.com>
References: <87lfjwxlna.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [resend] ASoC: dt-bindings: ak4642: switch to yaml base Documentation
Message-Id: <159494380522.42174.6099380177303248835.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 07 Jul 2020 08:35:38 +0900, Kuninori Morimoto wrote:
> This patch switches from .txt base to .yaml base Document.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ak4642: switch to yaml base Documentation
      commit: 0cee81b4fa402d31a5cbefaedba4973ba3f2aced

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
