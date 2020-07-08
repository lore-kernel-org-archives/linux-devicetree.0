Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08426C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 17:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF779207D0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594227614;
	bh=Z9DgEq3OumaTes4V1hG+JINH/hbtnJhyzZpunoO5NFo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=GBXZLtwjU6aHqp8OCsg5bCyGtsSrqYlnyymRJQc9nIZgP9iSLHwlxYZXQpJufMtr/
	 Q7kXktxnOwSCypfm71UrLF7yLQPhtxXXtYcoVGL5Zj1hHzQx+Ya34ERrbYD7VYEQim
	 tSToWvNRJ2ueEJ4vjlORMNwyK2I7LWnozPbDYUj0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgGHRAO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 13:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgGHRAO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jul 2020 13:00:14 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66523206F6;
        Wed,  8 Jul 2020 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594227614;
        bh=Z9DgEq3OumaTes4V1hG+JINH/hbtnJhyzZpunoO5NFo=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=GV1WrsNDk1SRcL7vHjlpjNy2/KZPYLEEdru3NCYYeTT94vdMwrr6APK87YRjdrv0y
         lzsIhNAEh0MFzWk5VWTE+hpIy3PVzNMtDx1SLUMJgDh4tD5DIsMZp2VY+UGDsGv/dC
         luYzxe/daWNGwbKo19go8WuKpV285lmQ9nyiK7ts=
Date:   Wed, 08 Jul 2020 18:00:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
References: <20200708113233.3994206-1-tzungbi@google.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for rt1015
Message-Id: <159422758800.28431.1053466753613230176.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 8 Jul 2020 19:32:30 +0800, Tzung-Bi Shih wrote:
> This series tries to reuse mt8183-mt6358-ts3a227-max98357.c for supporting
> machine driver with rt1015 speaker amplifier.
> 
> The 1st patch is straightforward: re-order the header inclusions.
> 
> The 2nd patch adds document for the new proposed compatible string.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8183: sort header inclusions in alphabetical
      commit: 4dae01c2e5df7beb8dfd5deb9560e42f19d3cfb7
[2/3] ASoC: mt8183: add compatible string for using rt1015
      commit: ab1ba5252f611c0efabca5fca81f5717445da47b
[3/3] ASoC: mediatek: mt8183: support machine driver with rt1015
      commit: f4fb4fef49664e64f4f40e9e8db11f785fbc79a4

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
