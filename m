Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB64C43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 00:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05F3220675
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585874433;
	bh=Iyo6dqhgT4dVTZfghbFmr9HaRavOVy4cCRKknwlfDt0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=nVAdi1EUW5h8einCWggz+XRFGum3i3RotOpYn1xRRXfJsKy1O97wt+ZA6g84rCRhN
	 ThjSgRYDhtqM3xVfSnlX+VDAtD+f20uw2/DmvY1P+O6/PuPwIcqLHsxHR/ftz1xYhf
	 6z8HhBCoyBQb6QxtpkYs55ptQYhmQeY4e3PTTnzQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390493AbgDCAk3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 20:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390480AbgDCAkZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Apr 2020 20:40:25 -0400
Subject: Re: [GIT PULL] Devicetree updates for v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585874424;
        bh=Iyo6dqhgT4dVTZfghbFmr9HaRavOVy4cCRKknwlfDt0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=MeQG5SifQqn3MpZ+X/7kt5zKEqScXfnHuoOpu0EuH/Qghm5GCbvFd+qtZZVi/0mvS
         M4QYKftLL1EnpPzro4sqq3CHDqv0G2gCPoPLH2bTrnL+wTgysCgcp8wQp1onRuiiBi
         3o4wrBYpNcmxQmC3FcVCIpQdEpkFqj1M4jWCIet8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200402205457.GA7121@bogus>
References: <20200402205457.GA7121@bogus>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200402205457.GA7121@bogus>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 tags/devicetree-for-5.7
X-PR-Tracked-Commit-Id: 8967918e7cee84d8b781feec38286c7d3c1c05da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bef7b2a7be28638770972ab2709adf11d601c11a
Message-Id: <158587442483.31624.6303363271349210811.pr-tracker-bot@kernel.org>
Date:   Fri, 03 Apr 2020 00:40:24 +0000
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The pull request you sent on Thu, 2 Apr 2020 14:54:57 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bef7b2a7be28638770972ab2709adf11d601c11a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
