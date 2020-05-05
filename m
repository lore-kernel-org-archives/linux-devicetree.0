Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D962C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 12:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED571206B8
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588681054;
	bh=nPpNqyu4Di9UIreq4Pdy4TMDsYb/AXsBsPRG4EpT+1Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=okQjoHOFw5AAUr6lJnW9CWG0+GSWXefYj+TzhM7Q0Pdy18mtb700tyHB7nq8ZEkwb
	 N35R/9WgyGtl3elAr8DrKwA+nkKKt7PKJay4pWDsD7ZSWh27VTiQs5RCjDUI+vhRDC
	 E30HxMejaDxZKh/kINn+TGpa4G1SyyR6eabS4iX0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgEEMRd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 08:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728180AbgEEMRd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 08:17:33 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 847E5206B9;
        Tue,  5 May 2020 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588681053;
        bh=nPpNqyu4Di9UIreq4Pdy4TMDsYb/AXsBsPRG4EpT+1Y=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=gvp4zhT5LkVvqxDPllq1uODFL/ATroY4PwAuB3S66S9ZL8upz2OjkO5N86L3Iyb1E
         8agCJb/tCthGCDzhKyQA+S9C3jQXs6YtwmmFQYlglasA3vKxcdJsZz24kxZ7UR9fDG
         lvwm3MNfoCtSvs76yb2UexZvvBZK4MP2/4ozwPuw=
Date:   Tue, 05 May 2020 13:17:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Kenneth Westfield <kwestfie@codeaurora.org>,
        alsa-devel@alsa-project.org, ~postmarketos/upstreaming@lists.sr.ht,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>
In-Reply-To: <20200425184657.121991-1-stephan@gerhold.net>
References: <20200425184657.121991-1-stephan@gerhold.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Message-Id: <158868105044.51563.15433748499783582656.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 25 Apr 2020 20:46:56 +0200, Stephan Gerhold wrote:
> The lpass-cpu driver now allows configuring the MI2S SD lines
> by defining subnodes for one of the DAIs.
> 
> Document this in the device tree bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
      commit: d5797ede0818b24252f79497e1c7e1245c328f6b
[2/2] ASoC: qcom: lpass-cpu: Make I2S SD lines configurable
      commit: 4ff028f6c1087bcaf1ee970d4ef43730ed0aaa8c

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
