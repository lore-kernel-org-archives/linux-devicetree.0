Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7CBC433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D1DF20786
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597769999;
	bh=BWBBTN7rTGTLtp33vxw316/R9Nel85083V49L7dQbD0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=yreBgqpuHffJu1W4Tc2Gm7SJigJRhV2xcEx9cdYk2skAoxpYOB9UYUWReLYYUqjID
	 e7q8KME50j3Ks5T70mty8QD0YheeYwHe0oRlfZ5k6+UHxrkZPo+jNtXL87mpkROsfD
	 cLRXLqmhw7M88xb9Q4FyE65gKIrLIiDO2kdAQx1o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgHRQ7w (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 12:59:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:39880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728540AbgHRQ47 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Aug 2020 12:56:59 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9B06207D3;
        Tue, 18 Aug 2020 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597769819;
        bh=BWBBTN7rTGTLtp33vxw316/R9Nel85083V49L7dQbD0=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=1szPJUCLS4sVpwHO0f1/OU8Roip4O4e0yrLCdCnPKChDBZcAEz9y2dvAnwdcNPOP3
         6g2p0w6Q+du42uYgO4vtcZn0S78P4WAakFGEx0QfHJIjdKEAfjLyBRpuYtpS1Xx0Xm
         pkvDfWsm3j3OV9trXNLiy14AzfhyRKnGZGBFhAI8=
Date:   Tue, 18 Aug 2020 17:56:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, yibin.gong@nxp.com
Cc:     Linux-imx@nxp.com
In-Reply-To: <1596421439-19591-1-git-send-email-Anson.Huang@nxp.com>
References: <1596421439-19591-1-git-send-email-Anson.Huang@nxp.com>
Subject: Re: [PATCH] dt-bindings: regulator: Convert pfuze100 to json-schema
Message-Id: <159776976827.56451.8318882621000296228.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 3 Aug 2020 10:23:59 +0800, Anson Huang wrote:
> Convert the pfuze100 regulator binding to DT schema format using
> json-schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Convert pfuze100 to json-schema
      commit: b2ad0be5087470f4a5ba29129e611df00cd183a7

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
