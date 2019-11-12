Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAF9C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 03:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FBB021872
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 03:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573529749;
	bh=MBjIKddWJnEGT0EwgCgJrPhNdg8wv+HpcN6GGStfkaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=DMq/MAx5fP0mE8vrmg0aonNRryXXAr8ggvg57jriqczxcNJmpIzADpvcsoC+JWA5m
	 MUxR04S+pArTu0i2y3aIVQvXOcH0NeiRv3PTWRThyaFgMC1OdmaQXTK4fWABqPWzsV
	 fLMFr+Ps/hI3KZXkgBcmPxgLO7RAZX6ey4TF9Hh0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfKLDfs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 22:35:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbfKLDfs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Nov 2019 22:35:48 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90A8221872
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 03:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573529747;
        bh=MBjIKddWJnEGT0EwgCgJrPhNdg8wv+HpcN6GGStfkaw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QWdJo6C+6xfWgTKy8rwvDcnMfyR5eL0tVo18iGIOHO1YldYw8rvq8SyLh5C8BRyvU
         BZHp+EA5dCHpOgy5lX0T46ffXlYKdmFiXQITV28MviGZ+xbrtQbNjNazqnlqsak7jL
         4IchcMX3borvVQ0mOQn3Cp/gqbBcqANmziy8OGqM=
Received: by mail-qv1-f48.google.com with SMTP id d3so4244820qvs.11
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 19:35:47 -0800 (PST)
X-Gm-Message-State: APjAAAVIe/6AxvEQNpZpwLwCyeJCD69b7AN24qn9mDiGKzkpTjt/Eko/
        SnRfUi3m9KV0vgf9JEt3FCLOtT1anw7iqa+5JQ==
X-Google-Smtp-Source: APXvYqwwASr53bdwWTXBeydLq9Y1YBhxlcVmIy3CIsKkhjC7od4G02vGkjS3cC5RGtXAT9X3PIWz4EZJgwn+JahqeYk=
X-Received: by 2002:a0c:d2b4:: with SMTP id q49mr26088561qvh.135.1573529746621;
 Mon, 11 Nov 2019 19:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
In-Reply-To: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 Nov 2019 21:35:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
Message-ID: <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the devtree_lock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 11, 2019 at 11:21 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> The phandle cache code allocates memory while holding devtree_lock which
> is a raw_spinlock_t. Memory allocation (and free()) is not possible on
> RT while a raw_spinlock_t is held.
> Invoke the kfree() and kcalloc() while the lock is dropped.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>
> This is a repost of:
>         https://lore.kernel.org/linux-devicetree/20180910154227.xsbbqvw3cayro4gg@linutronix.de/
>
> I mentioned this patch (briefly) to Frank, let me summarize:
>
> of_populate_phandle_cache() triggers a warning during boot on arm64 with
> RT enabled. By moving memory allocation/free outside of the locked
> section (which really disables interrupts on -RT) everything is fine
> again.
>
> The lock has been made a raw_spinlock_t in RT as part pSeries bring up.
> It then made its way upstream as:
>    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
>    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")

So to summarize, we changed mainline to fix RT which then broke RT. :)


> I've been looking into making devtree_lock a spinlock_t which would
> avoid this patch. I haven't seen an issue during boot on arm64 even
> with hotplug.

Did you look into using RCU reader locks any more?

Rob
