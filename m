Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0244C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 15:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4461207DD
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594395605;
	bh=31SRA1ojL9GpcKLyUiLwLpHPGG0dcpgvSQatvym/bPs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=C0OfzHsGWTP7+JtExwdGk2YuRor9WQLFLA7aSGQEig5K7CJauqG+gaEuXmiSdwwOb
	 511eWmaE5hZO4IkiktqxEAZGqkDA2sPYhUxV97PUfrbPxYeYHW7QLE5FPcTJYJvu2i
	 KJVKSCh5WRZz2mxBYFfzbzpK45l54dPtbSNBFwgY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgGJPkF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 11:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726872AbgGJPkF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 10 Jul 2020 11:40:05 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F80C207BB;
        Fri, 10 Jul 2020 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594395604;
        bh=31SRA1ojL9GpcKLyUiLwLpHPGG0dcpgvSQatvym/bPs=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=LZMhp4bX0rgy7ASmfQ8w6c5qwZi78zTA53J/RT7BpqPcGjen1sXLzA1Aou9pff3wT
         ECKaLD/lzBs3Wn5/zzrSlOTYRQDPX2/4Qa4CVJfoGvkTZtm4sbJeSQ0mGjNBwGQ/3f
         OEPXq9ouCjLqHgNvdka7TPnZ7xWZFuTCwODcsYYg=
Date:   Fri, 10 Jul 2020 16:39:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
References: <20200710052505.3664118-1-tzungbi@google.com>
Subject: Re: [PATCH 0/6] ASoC: mediatek: mt8183: support DP audio
Message-Id: <159439557864.48910.15353677231173679587.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jul 2020 13:24:59 +0800, Tzung-Bi Shih wrote:
> This series is a follow up for a long time ago series
> (https://patchwork.kernel.org/cover/11204303/).
> 
> The old series bound too much on the patches of DRM bridge and ASoC
> machine driver.  And unluckily, the dependencies
> (https://lore.kernel.org/patchwork/patch/1126819/) have not applied.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: mt8183: add a property "mediatek, hdmi-codec"
      commit: cc07e14b149e4260075093c06b371bcb31574ccc
[2/6] ASoC: mediatek: mt8183: use hdmi-codec
      commit: f2024dc55fcb743469238aa11f9967e0752ac600
[3/6] ASoC: mediatek: mt8183: support HDMI jack reporting
      commit: 88abbf627a56efcd7f24aa119f07069d3d10bd0b
[4/6] ASoC: dt-bindings: mt8183-da7219: add a property "mediatek, hdmi-codec"
      commit: 5653841d1e6bace7897a0b5ca681fa37945fa11b
[5/6] ASoC: mediatek: mt8183-da7219: use hdmi-codec
      commit: 5bdbe977117741a6bf4958c8dfdcb6b9263e9f1c
[6/6] ASoC: mediatek: mt8183-da7219: support HDMI jack reporting
      commit: e25f8afd8869bd97a4d0baea5d8da730913c8541

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
