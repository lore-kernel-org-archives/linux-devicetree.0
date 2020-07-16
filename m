Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615AEC433E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 23:57:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 353E2207CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 23:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594943859;
	bh=5mhLBJ7h6ElkX/0AxOdJ2+cHlZaRzaXjArcjaCDUEQE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=Sg0xrCgp2BomYAr9aFgPBT5e0Q/51emexo4K+0jBQHIoY4W4dYTQ5pO00mWdRSFJD
	 z9Bf5hWDe5MIXJ0Xk7rzOj8yEvMwZhQOTQiWdRIgRjyRQMviqQvzGYqWWieeGWrxfZ
	 ljcnT+d+2vOKvWeI6Pjg1oz/IzhkLRFDCPp426cY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgGPX5i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 19:57:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgGPX5i (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 19:57:38 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 704F4207BC;
        Thu, 16 Jul 2020 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594943858;
        bh=5mhLBJ7h6ElkX/0AxOdJ2+cHlZaRzaXjArcjaCDUEQE=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=cJnwPT3X2FH6FCM6jcYgB3hpoARd40Qv3iu7c0nfDjwEDgBgGe61Qip+68Yb39Ud5
         YhIohsWJYKHLJZ26Fig4h4IZt3QJz133+eMrfsNUkVF90NfgYQUGvBAxgBGWdn19iC
         9bmF8yHwcBnlFBpcKg6MmnhQ9mWee+6E0CN+OAt8=
Date:   Fri, 17 Jul 2020 00:57:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
        robh+dt@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
        festevam@gmail.com, timur@kernel.org, nicoleotsuka@gmail.com,
        devicetree@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
        lgirdwood@gmail.com
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: fsl-asoc-card: Support hp and mic detection
Message-Id: <159494380522.42174.2922411454169889285.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Jul 2020 22:09:36 +0800, Shengjiu Wang wrote:
> Support hp and mic detection.
> Add a parameter for asoc_simple_init_jack.
> 
> Shengjiu Wang (3):
>   ASoC: simple-card-utils: Support configure pin_name for
>     asoc_simple_init_jack
>   ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
>   ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: simple-card-utils: Support configure pin_name for asoc_simple_init_jack
      commit: 764aafdb985b182bce0c91503e9233cb97a2f0d7
[2/3] ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
      commit: c3c058aba4032a0f88a2f203472d7b5076a926b4
[3/3] ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
      commit: 3b171194493c5f7b2aa9b76deb402a8e98ab510f

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
