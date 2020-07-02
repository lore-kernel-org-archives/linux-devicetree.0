Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E15C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 15:46:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63D0A2088E
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593704804;
	bh=sNB0otr3YXbGQdp8LUGPooYFhKBdpdTWobuGYek895E=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=nzHS2cmMIRt1KF0Kw2s/qjMqsvrhD2LHtfCKxALVxLYqM2MeBUp+Jo+aVzzNSKyLH
	 7pDihBsR0PhwEzkNe8S4zuaWevZSYuiLGLWjobcmInMBBqGMJ7z0DXR0W2cZozcnIr
	 HB52E4+nIII0sIpGl0t19fDQtBnkUTeJYlC8f03s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgGBPqo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 11:46:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgGBPqn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Jul 2020 11:46:43 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CEE220885;
        Thu,  2 Jul 2020 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593704803;
        bh=sNB0otr3YXbGQdp8LUGPooYFhKBdpdTWobuGYek895E=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=AGo7RUqtz2XsmL//2NL5IQlvHgy30k9r6m2tFm6qwHxWQPpilr4A36QAhfsOjOkpE
         9Hqa/40SxXqxV/1GsfRs8j1i1DM4BjSPudx9toXTAD7X1w+woYzcVI7wKwpSu7F7R2
         xv+Dt6kK9i7oxlcUO5FYAW5WO+M1JXirzmgFEWnQ=
Date:   Thu, 02 Jul 2020 16:46:40 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com
In-Reply-To: <20200630223020.25546-1-festevam@gmail.com>
References: <20200630223020.25546-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check' warnings
Message-Id: <159370480067.5443.4442289678532780201.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 30 Jun 2020 19:30:20 -0300, Fabio Estevam wrote:
> The following build warnings are seen with 'make dt_binding_check':
> 
> Documentation/devicetree/bindings/sound/simple-card.example.dts:209.46-211.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:213.37-215.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:250.42-261.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:263.42-288.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:270.32-272.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:273.23-275.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:276.23-278.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@2: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:279.23-281.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@3: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/simple-card.example.dts:290.42-303.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check' warnings
      commit: 88ba5f4a642e4fb6ab7058254967f55375ca068d

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
