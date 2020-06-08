Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F964C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 12:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B9C82076C
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591620406;
	bh=Wq/+Uk6aoGGFVXLgFp6Ufm0w+dLdqZNzS0VJAWWMN3Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=iYs9E0R6X5K9HHA9t5EaB9HttI/T1pCgt12XEwKk0Jq2tDkmAiSNMJmzipTCeazAl
	 Zd2XHayKFf5oR8y658AekPvA941C92sldrmJernIzHGu6v6HgqDjgX9zD/s5gCBxgK
	 ORhLi7BAWWBUeJX5YBc2Upz9IHIiDXifVDZhB9P4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgFHMq3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 08:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:54040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728973AbgFHMqR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Jun 2020 08:46:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FE0F2076A;
        Mon,  8 Jun 2020 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591620376;
        bh=Wq/+Uk6aoGGFVXLgFp6Ufm0w+dLdqZNzS0VJAWWMN3Y=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=WCW74dpurI56Y4x3OmKY7vQ1f3D2C8gnCUyKS/OTbs60t0+NSFYD4cQatOH+NKeBq
         im94IQRdb2unFosKEp64Fz+drKc/tttF5ukguidxXG9UFyqV5RexGgsiaMRjnhugtE
         yylDilt/pkIflLMdPPZVQG40Axi7ZLV8TaES3flg=
Date:   Mon, 08 Jun 2020 13:46:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com, tiwai@suse.com, Dan Murphy <dmurphy@ti.com>,
        perex@perex.cz
Cc:     linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20200602193524.30309-1-dmurphy@ti.com>
References: <20200602193524.30309-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: ASoc: Fix tdm-slot documentation spelling error
Message-Id: <159162036934.23368.11280508141452953751.b4-ty@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2 Jun 2020 14:35:23 -0500, Dan Murphy wrote:
> Fix the spelling of 'specified'.  Also fix grammarical issue with the
> use of 'a' over 'an'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: ASoc: Fix tdm-slot documentation spelling error
      commit: 8a9144c1cf523221b37dd3393827253c91fcbf54

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
