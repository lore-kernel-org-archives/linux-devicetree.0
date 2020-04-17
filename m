Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5794C2D0EF
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 19:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83C2C2076D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587150925;
	bh=MQM53BbVC2OrZUMe236AuRXoO62cVGl+vSGKNZfke6o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=DP675pL6+0BIX4yMgwyA5ZqLywFBstZ+D7a+nyEmJKzDyHOXisa9LhPVvcLkXt5K5
	 ppbyUTXmBE4anoXJH5zpVDszt7PqkijEhwAHEWNxWe9vaIgDw+2YMU70p/x1J4soJb
	 KbArtkdIDEf7/Nk8OdD2qE8I3fj0EGl/GaVlbOmA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbgDQTPZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 15:15:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728151AbgDQTPW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Apr 2020 15:15:22 -0400
Subject: Re: [GIT PULL] Devicetree fixes for v5.7, take 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587150922;
        bh=MQM53BbVC2OrZUMe236AuRXoO62cVGl+vSGKNZfke6o=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=PrVnpEiRYoRbGJSQDzAfbqHAKabQn0JD9WUnZi3+yGw4E2K3ysmHg2kyc24uJuP8A
         yHJvxupNl80Qz9q9k3bn267tQVThkzlJhzWIq5eS0EUsTuYVBOD+PbJm/DqshMSMz0
         SYl9shtvH6MnAMQZUMEEr/hXbz231tKSwZB3fw7E=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200417161010.GA14296@bogus>
References: <20200417161010.GA14296@bogus>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200417161010.GA14296@bogus>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 tags/devicetree-fixes-for-5.7
X-PR-Tracked-Commit-Id: 0903060fe590105b7d31901c1ed67614c08cee08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fce9058ca8b1c784515e7986385f2b33927a44b
Message-Id: <158715092222.7925.15410358690654400876.pr-tracker-bot@kernel.org>
Date:   Fri, 17 Apr 2020 19:15:22 +0000
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The pull request you sent on Fri, 17 Apr 2020 11:10:10 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fce9058ca8b1c784515e7986385f2b33927a44b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
