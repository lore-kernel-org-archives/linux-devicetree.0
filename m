Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92FEC43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 00:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EE7C222C6
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 00:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573606100;
	bh=lwz/MVaWpB1XvfrBrWvlGPXI5BnwXkCvlHE+WGQUQ0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=gzhq8QO810KgTpWipt816xll6lul8Ldhs1LL9UGUohpiskUi+w5KsHsOKavpsEYBw
	 88XHf3Wg/smeZ/Kb8FYxeilvE+jbwLuQ56OyroG0X0LmcNqKcGqR7lQUBI4SEsKZfQ
	 w+F0L74+nBzyTHMhukSeiN2mUgZP8nLGr1iUHkFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfKMAsU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 19:48:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:37156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbfKMAsT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 19:48:19 -0500
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4B6821A49
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573606099;
        bh=lwz/MVaWpB1XvfrBrWvlGPXI5BnwXkCvlHE+WGQUQ0g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hFpXGdtKQG6N8VhjR04pKLPAEuVWePO+64z4T5JmDpAVGLw2O2fknWYvumlEJXYn/
         Mgq/erle4NuHU5WH6h2eRed3KJJwbCDoUltf15jh/F1sHqvFLR7GFytevFjwmnmgAu
         lEyZw8WFwG1nm3itaQeSODdPmPBwFIrigwiwwXS4=
Received: by mail-qk1-f174.google.com with SMTP id z16so260020qkg.7
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 16:48:18 -0800 (PST)
X-Gm-Message-State: APjAAAWjekU2r+bSdqQOx70ue154NOwUSZ8BCnOv5ffyRxQRcXhSA09P
        vhe1RE3TzfUVKSR5U5C9gz3m6o2QwQmC2LCxrA==
X-Google-Smtp-Source: APXvYqyndn2EOssMhZQ8EVwQGtvwgLISRFKnIgtv/OcI++MlE0sKgYyheWHfdkpDNa/0AvS2+7rXmQQFjwybt+R0Yok=
X-Received: by 2002:ae9:dd83:: with SMTP id r125mr261188qkf.223.1573606098038;
 Tue, 12 Nov 2019 16:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
 <20191112091032.aa23wd24j4b324kw@linutronix.de> <CAL_Jsq+Rfguea+KO0kLKom=8t_oCnesT8cb833Y0fhsbu_a1Cg@mail.gmail.com>
 <c2c76ab9-9967-3cc3-fff2-5f791598c7e3@gmail.com>
In-Reply-To: <c2c76ab9-9967-3cc3-fff2-5f791598c7e3@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Nov 2019 18:48:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJODons-CL9epGj2QXSyiE17N_a6W-Cyzb=2KKaePT0QQ@mail.gmail.com>
Message-ID: <CAL_JsqJODons-CL9epGj2QXSyiE17N_a6W-Cyzb=2KKaePT0QQ@mail.gmail.com>
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the devtree_lock
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 12, 2019 at 5:46 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 11/12/19 9:55 AM, Rob Herring wrote:
> > On Tue, Nov 12, 2019 at 3:10 AM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> >>
> >> On 2019-11-11 21:35:35 [-0600], Rob Herring wrote:
> >>>>    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
> >>>>    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")
> >>>
> >>> So to summarize, we changed mainline to fix RT which then broke RT. :)
> >>
> >> correct, but we were good until v4.17-rc1 :)
> >>
> >>>> I've been looking into making devtree_lock a spinlock_t which would
> >>>> avoid this patch. I haven't seen an issue during boot on arm64 even
> >>>> with hotplug.
> >>>
> >>> Did you look into using RCU reader locks any more?
> >>
> >> A little bit. The writers, which modify the node, would need to replace
> >> the whole node. So this is where things got a little complicated.
> >
> > Why is that exactly? That's pretty much how node and property updates
> > work anyways though maybe not strictly enforced. The other updates are
> > atomic flags and ref counts which I assume are fine. The spinlock
> > protects traversing the tree of nodes and list of properties.
> > Traversing and updates would need to follow similar semantics as
> > rculist, right? BTW, there's been some thoughts to move node and
> > property lists to list_head. We may want to do that rather than trying
> > to roll our own RCU code.
> >
> >> Frank wasn't a big fan of it back then and he still wasn't a few weeks
> >> back.
> >
> > I guess you spoke at ELCE. RCU seems like the right locking to me as
> > we're almost entirely reads and I haven't seen another proposal.
> >
> >> If you two agree to prefer RCU over this patch then I would look more
> >> into adding RCU into the lookup path. The argument was that this isn't
> >> time critical. I'm just trying to avoid to replace the locking for
> >> nothing.
> >> So, should I come up with a RCU patch?
> >
> > Lets see what Frank says first.
>
> RCU is good for adding list entries, deleting list entries, and updating
> the value(s) of a list element.
>
> RCU is not good for excluding readers of a data structure while multiple
> entries are being added, deleted, and/or modified, such that the readers
> only see the state of the data structure either (1) before any changes
> or (2) after all changes occur.  Overlay application and removal require
> multiple modifications, with readers seeing either the before state of
> the after state.

Do we ensure that currently? The of_mutex provides what you describe,
but most or all the reader paths don't take the mutex. Even the
changeset API takes the spinlock a single node or property at a time.

Rob
