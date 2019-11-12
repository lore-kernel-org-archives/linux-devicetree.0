Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9785EC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 15:56:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66CA12067B
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573574169;
	bh=8F20L3QJFTsavDdGfHLvf78nXRQXyUPKzvqP5z0wscM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=G++EYI6HEIv0j29dA4bdNqTG0vgM81Au6mAmvdoXz/YB9pek2/ZB2G6SuiC0gU0nh
	 ACi1UQQDNo0cRWn+HY1wuV+J2AcxdKotq+wULd5ELTbQjODZhNr9okZydMOBU1k203
	 F8V4/LbdM/dwocDLUv3K562Ki6F4RmXJdjJ5vQ/M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKLP4I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 10:56:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:51814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfKLP4I (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 10:56:08 -0500
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40B05214E0
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573574167;
        bh=8F20L3QJFTsavDdGfHLvf78nXRQXyUPKzvqP5z0wscM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ir7JfamXGWDwLcVwZaOeQl+axECHrhKvs3+rqFimfuBJmPmA/EMvy7fIzy28YVq8o
         yA8E8jQxqqqE5VSvoXI8NhteN7yWgTkPpq2nLu98wHhVoFk8WA6FQdAvWQH0gIeVgh
         nMjH3AqVzN5vd+9KCYaYillS42qoaBy3XKQGjbNI=
Received: by mail-qk1-f170.google.com with SMTP id q70so14831759qke.12
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 07:56:07 -0800 (PST)
X-Gm-Message-State: APjAAAX89BiF0zAiwgaiazGgE5oVhTrd9H/Z+lZMOWjujYAkS/WzGzxC
        E+ZJXBUm4Sju6xKoPpv1NCJB+IpA51Gd67ClHg==
X-Google-Smtp-Source: APXvYqzGPcXQTYDIwyrSGjxgXO8rgauszeUH/CJr2fC6c0UiXAiS67QLfaU4dKl5UZQ3hQyytHW1whhELOX88nJCzps=
X-Received: by 2002:a05:620a:226:: with SMTP id u6mr6231925qkm.393.1573574166389;
 Tue, 12 Nov 2019 07:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com> <20191112091032.aa23wd24j4b324kw@linutronix.de>
In-Reply-To: <20191112091032.aa23wd24j4b324kw@linutronix.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Nov 2019 09:55:55 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Rfguea+KO0kLKom=8t_oCnesT8cb833Y0fhsbu_a1Cg@mail.gmail.com>
Message-ID: <CAL_Jsq+Rfguea+KO0kLKom=8t_oCnesT8cb833Y0fhsbu_a1Cg@mail.gmail.com>
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the devtree_lock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 12, 2019 at 3:10 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2019-11-11 21:35:35 [-0600], Rob Herring wrote:
> > >    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
> > >    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")
> >
> > So to summarize, we changed mainline to fix RT which then broke RT. :)
>
> correct, but we were good until v4.17-rc1 :)
>
> > > I've been looking into making devtree_lock a spinlock_t which would
> > > avoid this patch. I haven't seen an issue during boot on arm64 even
> > > with hotplug.
> >
> > Did you look into using RCU reader locks any more?
>
> A little bit. The writers, which modify the node, would need to replace
> the whole node. So this is where things got a little complicated.

Why is that exactly? That's pretty much how node and property updates
work anyways though maybe not strictly enforced. The other updates are
atomic flags and ref counts which I assume are fine. The spinlock
protects traversing the tree of nodes and list of properties.
Traversing and updates would need to follow similar semantics as
rculist, right? BTW, there's been some thoughts to move node and
property lists to list_head. We may want to do that rather than trying
to roll our own RCU code.

> Frank wasn't a big fan of it back then and he still wasn't a few weeks
> back.

I guess you spoke at ELCE. RCU seems like the right locking to me as
we're almost entirely reads and I haven't seen another proposal.

> If you two agree to prefer RCU over this patch then I would look more
> into adding RCU into the lookup path. The argument was that this isn't
> time critical. I'm just trying to avoid to replace the locking for
> nothing.
> So, should I come up with a RCU patch?

Lets see what Frank says first.

While this patch is a bit of a band-aid, I don't think it complicates
the situation at all to prevent coming up with a better solution. The
other option is get rid of the memory allocation altogether. My
preference for the cache was a simpler solution that was truly a cache
(i.e. a fixed size that could miss). The performance wasn't quite as
good though.

Rob
