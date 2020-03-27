Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90930C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 18:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D96620737
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585333517;
	bh=kphzszlwm1La47MdscXO3TtRShKr08jrCtW7lu0cN2w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=wFBwv52kmJc4bVd2dmpogkzikO/pXUGd5VmYnJmcSEeYmsC5uZR1PsWzj72UJSPVZ
	 rIaWkEAzMdM1GzMRH1qlm6pNxO4i6LZPCA5V6XhwOg/bGFtT/MktJElIonKyoTTya8
	 yrxT/+p5AIceGaHZ+YyjNKM8WKB/XUjrqA5jyrvQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgC0SZK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 14:25:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgC0SZI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 14:25:08 -0400
Subject: Re: [GIT PULL] Devicetree fix for v5.6, take 4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585333508;
        bh=kphzszlwm1La47MdscXO3TtRShKr08jrCtW7lu0cN2w=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Dl64cjkmOaBOAkav8OTe3XU5I43HQLRNwNKDo+t2tbMMYC0t9iZr5cPa/p9F5m55d
         gxNA6MhS4o04o3ZHtJNUP8KT4N6HzwqKn/ZONVdu4Q7La1AyHwbvT1ffmM6OszLxiA
         rlr9IvDT+iQaIVtnqXra3jdl8NQEaNR+TNCWYT5M=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200327143756.GA32333@bogus>
References: <20200327143756.GA32333@bogus>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200327143756.GA32333@bogus>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 tags/devicetree-fixes-for-5.6-4
X-PR-Tracked-Commit-Id: e33a814e772cdc36436c8c188d8c42d019fda639
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb36d37e29d4e355fdffb4cd932cbb60e25e7e02
Message-Id: <158533350842.5176.13671252955461676794.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Mar 2020 18:25:08 +0000
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The pull request you sent on Fri, 27 Mar 2020 08:37:56 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-5.6-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb36d37e29d4e355fdffb4cd932cbb60e25e7e02

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
