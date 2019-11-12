Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF395C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 09:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1AC520674
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 09:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKLJKf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 04:10:35 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:32887 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLJKf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 04:10:35 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iUSC1-0006o6-9f; Tue, 12 Nov 2019 10:10:33 +0100
Date:   Tue, 12 Nov 2019 10:10:32 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
Message-ID: <20191112091032.aa23wd24j4b324kw@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-11-11 21:35:35 [-0600], Rob Herring wrote:
> >    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
> >    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")
> 
> So to summarize, we changed mainline to fix RT which then broke RT. :)

correct, but we were good until v4.17-rc1 :)

> > I've been looking into making devtree_lock a spinlock_t which would
> > avoid this patch. I haven't seen an issue during boot on arm64 even
> > with hotplug.
> 
> Did you look into using RCU reader locks any more?

A little bit. The writers, which modify the node, would need to replace
the whole node. So this is where things got a little complicated.
Frank wasn't a big fan of it back then and he still wasn't a few weeks
back.
If you two agree to prefer RCU over this patch then I would look more
into adding RCU into the lookup path. The argument was that this isn't
time critical. I'm just trying to avoid to replace the locking for
nothing.
So, should I come up with a RCU patch?

> Rob

Sebastian
