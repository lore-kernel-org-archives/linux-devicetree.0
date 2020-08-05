Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCACC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 20:33:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16DC622CE3
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596659592;
	bh=mHh1Cq5MAkcpTOCekHQeqlJ3JmplFxonYo4U25F4EB0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=mTRGSJwx98tdN7I4b8nAjnb4+cDG5wRPWuueoG7FCEphy93Y6JLw1f0bUEXA6qIru
	 IKicW3HX+miHlZtKG7Soasff+sNoGdnPpHRaANS7mjq8gADLZ0EDqh0fS+HXk/F4OL
	 0bG0cqPCcYne7lJ2OOWqscxnWk0o4SEClwR1oY2o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgHEUdL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Aug 2020 16:33:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgHEUdK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 5 Aug 2020 16:33:10 -0400
Subject: Re: [GIT PULL] Devicetree updates for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596659590;
        bh=mHh1Cq5MAkcpTOCekHQeqlJ3JmplFxonYo4U25F4EB0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=TZBTJsl304N6ShrAdtmjJ0VxPgz9M3CWxkhDPf9c3JfZB7GZpFZq0+nREBhOskeiH
         T8pOlNoLBv5wu8ogCbC+iWCKE2JzO0To/DdEhJ7vEP1lMtTsQRN4CJp5NXT41ocaU2
         FuWyJEmL2PZBR1Ue1fJ1ce2rbe8G4+den1X/6M7k=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200804222811.GA1222892@bogus>
References: <20200804222811.GA1222892@bogus>
X-PR-Tracked-List-Id: <devicetree.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200804222811.GA1222892@bogus>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-5.9
X-PR-Tracked-Commit-Id: 6f1188b4ac7577c29a4883d5618fa2231396fe9d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 441977979a78bffe51b13932d353919b1fb20c14
Message-Id: <159665958996.13939.5485961666927813325.pr-tracker-bot@kernel.org>
Date:   Wed, 05 Aug 2020 20:33:09 +0000
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The pull request you sent on Tue, 4 Aug 2020 16:28:11 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/441977979a78bffe51b13932d353919b1fb20c14

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
