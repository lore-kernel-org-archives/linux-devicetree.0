Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D94C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D428420786
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597769990;
	bh=XwMbwS6E/T6es+7pPWexpipw53A2pwAgEeRJQNhrN4Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=vCnKc8z7bHwodVMHd0B/zkExsQ4XrCmIBW+abyaTo0KTssEMk4ej1K2tjkmKM8F/l
	 8K6CtDCazHjtQHZUOBifCt2S58BTCHZO6S9po2nj8Sx80yHWYlZeqOvcNJG3TBoWEr
	 rX7HOcUEqFI53pNTR3QT/ta0MCvqXOHwyyXXx+Us=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgHRQ7s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 12:59:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgHRQ5a (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Aug 2020 12:57:30 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8965920829;
        Tue, 18 Aug 2020 16:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597769850;
        bh=XwMbwS6E/T6es+7pPWexpipw53A2pwAgEeRJQNhrN4Q=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=WJKV1xF6KmWs46VgxZNR341Gyjci4Egs4cEywN7AAIl9fW9UuntljGuzDYb/QYHKJ
         WgTEmJQK0AnlLpMe2AWWZ3yji4HgMsaKLYfnOldwZxgn5qb+ZIz6QyTpJu94pq/Out
         ZH1Bv+Q1nuF3dgaV+9Mhjn0S835iPQ0HRpZXymXs=
Date:   Tue, 18 Aug 2020 17:56:59 +0100
From:   Mark Brown <broonie@kernel.org>
To:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20200809105938.6388-1-marex@denx.de>
References: <20200809105938.6388-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: Add DT bindings for RaspberryPi 7" display ATTINY88-based regulator/backlight controller
Message-Id: <159776976827.56451.3322395405929688936.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 9 Aug 2020 12:59:37 +0200, Marek Vasut wrote:
> Add DT bindings for RaspberryPi 7" display ATTINY88-based
> regulator/backlight controller, this one is used in the
> Raspberry Pi 7" touchscreen display unit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: Add DT bindings for RaspberryPi 7" display ATTINY88-based regulator/backlight controller
      commit: 9c535960891470eaec5664eed2a56dbb2b6a205b
[2/2] regulator: rpi-panel: Add regulator/backlight driver for RPi panel
      commit: 38573472278da49e2ab588062d88bc2f0c11a325

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
