Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B5EC3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 18:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 653F620661
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 18:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RA1GqZgt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgEDSsg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 14:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727910AbgEDSsg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 14:48:36 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11820C061A0F
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 11:48:36 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q8so14851414eja.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 11:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCEQjPC67dYv3CnpnkDC1IHcr6icFNy3P67sHSsxZbo=;
        b=RA1GqZgt6de20O5DgFDhzog+4Vz6PCSt6pEItZTtW0YoMo1m04eFXsB8Bxf2P1nJ+E
         tOiKLb3fMQBpCYyXw3pRHpDstbl/derppS+XwXA8+HXH8pviNjmvBla+L9PNmOQKe5eH
         6qXJPKcm19f24lGr1GgYLSZjBJuvk/R56e52+pkUi/BbDmOyi67ji7PNoxCBUcZrsKlN
         lA7M9eQVaRaQMbyJTgS0ngUxnp0pvD6bfAc2Y3Wf5fKKWfTUWHhG2VIEGm6yCQ1Qr3Sf
         jIT6Qbg4OY7WC7dOOFTO9IdizEtHn51qhCn8Gk5ltPr7sgTug743SRhN/k9eXszAoDhw
         OS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCEQjPC67dYv3CnpnkDC1IHcr6icFNy3P67sHSsxZbo=;
        b=CSUlj1TR4deCDKDSmsYn4B/khlvFO13mJBkJCeawEomCr3q4pEOOteap2zM3n5WmII
         5SWNlKe7DCDkXp598F3gdIRbQYcob/DwYsVJVVOhW8j1avLXibaGjhbOxhia0bAtCdJT
         v5+0OumbsGZyVBmjI2Xd2FRBGIyFkX3vYTdn7w1HSyQkctyK73KDB3yYURaJCs6XdKWU
         FnG4KlM7mOxnuWMo78Kmqw2bVThoeMemj6Hq8Yx5xBINR3/t/XzvAZPe6NzO272D2VAm
         CL0Si/xdI2NGLiDXGLLN/nSJpKYobayCo17TCG/g4Jmlk/7blI3wru+r2P4p8b/l5yHv
         I7FA==
X-Gm-Message-State: AGi0PuaJ4WlBlBSBM2607G9ho+aEb5DhmgirMq4+ffQ0x5u3lfugzpb0
        7WNSPPUhDBCU0gSlGy0r6Si6w2pDSXKQpF1yURh3XA==
X-Google-Smtp-Source: APiQypJYjHte4f1KJhlfkkExpm93glok0kGNLcxIMMpKeSKVxgfUOTNgRMC5iZWALcfVT1/9Q5QBJG6IJaQUDhN9vEI=
X-Received: by 2002:a17:906:37d0:: with SMTP id o16mr15393604ejc.368.1588618101626;
 Mon, 04 May 2020 11:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200502143555.543636-1-pasha.tatashin@soleen.com> <202005041112.F3C8117F67@keescook>
In-Reply-To: <202005041112.F3C8117F67@keescook>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 4 May 2020 14:47:45 -0400
Message-ID: <CA+CK2bBDzbXdH23aDxqGzMoxPppNcVmitrYJ00tJqympMBVJOg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] allow ramoops to collect all kmesg_dump events
To:     Kees Cook <keescook@chromium.org>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, anton@enomsg.org,
        ccross@android.com, Tony Luck <tony.luck@intel.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> > # reboot -f
> >
> > After VM is back:
> >
> > # mount -t pstore pstore /mnt
> > # head /mnt/dmesg-ramoops-0
> > Restart#1 Part1
>
> Is there a reason that using ramoops.console_size isn't sufficient for
> this?

Unfortunately, the console option is not working for us (Microsoft),
we have an embedded device with a serial console, and the baud rate
reduces the reboot performance, so we must keep the console quiet. We
also want to be able collect full shutdown logs from the field that
are collected during kexec based updates.

>
> I'm not strictly opposed to making these changes, but traditionally the
> granularity of dmesg output has been pretty easily "all or crashes"
> instead of a range within.

As of now, ramoops  allows collecting dmesg only for oops and panic,
but not for all types of events.

Thank you,
Pasha

On Mon, May 4, 2020 at 2:14 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Sat, May 02, 2020 at 10:35:52AM -0400, Pavel Tatashin wrote:
> > Currently, ramoops is capable to collect dmesg buffer only during
> > panic and oops events. However, it is desirable for shutdown performance
> > analysis reasons to optionally allow collecting dmesg buffers during other
> > events as well: reboot, kexec, emergency reboot etc.
> >
> > How to quickly test:
> >
> > virtme-run --mods=auto --kdir --mods=auto --kdir . \
> >       -a memmap=1G$8G -a ramoops.mem_address=0x200000000 \
> >       -a ramoops.mem_size=0x100000 -a ramoops.record_size=32768 \
> >       -a ramoops.dump_all=1 -a quiet --qemu-opts -m 8G
> > ..
> > # reboot -f
> >
> > After VM is back:
> >
> > # mount -t pstore pstore /mnt
> > # head /mnt/dmesg-ramoops-0
> > Restart#1 Part1
>
> Is there a reason that using ramoops.console_size isn't sufficient for
> this?
>
> I'm not strictly opposed to making these changes, but traditionally the
> granularity of dmesg output has been pretty easily "all or crashes"
> instead of a range within.
>
> --
> Kees Cook
