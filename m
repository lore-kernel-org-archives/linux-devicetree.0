Return-Path: <SRS0=QVA0=AO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DF3C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 17:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B05920C56
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593795878;
	bh=usOdbcIq6yTMf4Y6DfGnSk+3DyfVbhVyQ01xiztsjMo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=Q/i4OHaPmEHh6XyruM+XAuer1GJmPIXSVrVUKO2mrydGhWdMZVigmx/jeqjFX4o2s
	 TETcq21MU9RNVFGlXqfzSKOIJDYkKvAs53NB3z30g7pzUkrjRpsg6HDzqW8VbNCA0A
	 9W2SpvPOrYZYmhaascuxp8TMaCwg6acI2KUi6msU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgGCREf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jul 2020 13:04:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbgGCREd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 3 Jul 2020 13:04:33 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EDA020C56;
        Fri,  3 Jul 2020 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593795873;
        bh=usOdbcIq6yTMf4Y6DfGnSk+3DyfVbhVyQ01xiztsjMo=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=EhO0kipVD2r329vp4wiT1gjO+t5ml7uwQLHXNEtP+ROuF12ZFTgYN6CHdO0DwWvxN
         NDGf56KKY+7ZPGhK6tWCKvNf9I/NB0j03qhIlq5Lmde5u5thKvjwebHL9LxxR91CtW
         AJKlyB7I9qAfjxBcj+6MJnIBVkgGvNlMLQnPYG9Q=
Date:   Fri, 03 Jul 2020 18:04:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Christoph Fritz <chf.fritz@googlemail.com>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20200630185203.22882-1-chf.fritz@googlemail.com>
References: <20200630185203.22882-1-chf.fritz@googlemail.com>
Subject: Re: [PATCH 0/2] regulator: Add FAN53880 support
Message-Id: <159379586603.55985.1133586906505065716.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 30 Jun 2020 20:52:01 +0200, Christoph Fritz wrote:
> This patchset adds a regulator driver with dt-bindings documentation in
> the new yaml format for a power management IC from Fairchild (now ON
> Semiconductor) named FAN53880.
> 
> The chip was found on a camera sensor board which will get a v4lsubdev
> driver in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: fan53880: Add initial support
      commit: e6dea51e2d41679d37a81d0b1247c039092af46b
[2/2] dt-bindings: regulator: Document bindings for fan53880
      commit: 643ddb618a5fd1819e790e86be85ae50c2c4abc4

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
