Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD083C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6ABE20727
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Dyhz804e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgEOTOM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 15:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726198AbgEOTOD (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 15:14:03 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7F9C061A0C
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:14:02 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id h16so3123875eds.5
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rEcYbavgX8JtqJsaFfda+512xKGwZ/fm/kUZY43XBic=;
        b=Dyhz804eVJkifn7MrOk3lXA2cYeO07Wo2pl7mf5YjMFBNH39vMrrhMJ/rIJJabb4dV
         guEH+JGaq2EM2INQSVaVgsuHj0/xRby9hVLII3mauZmrrfgywAQhkpHYiGp/aL59oUW3
         ZskkLFWhScXljJGuVqfdxvI3oQqIPrVtmrQns7kskcjtHK7z8vgsq0bQogumhdMa6aae
         VX9ngNS7wwbyJGWrDeaoO3gxjUUHkHB6XPPl+bx8d3H83IGpB6xBxF5RiluqLnlDU4P1
         jpMhUqIxQYqRBHzlxVjqr6F/k7yqBDkIivvA7gyYKw7NnCA9p0M/HzdhEyOFmn9up+6j
         g+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEcYbavgX8JtqJsaFfda+512xKGwZ/fm/kUZY43XBic=;
        b=EOYwgS6YV9do0rKp2AGVO7JVbDsoN8BaScjr5rPE9ahXVW6/gVSL1+pz/uswIMIV2D
         d3SY6spdcfMLpiKNoeqUvBfObqynzH7yl0C9tyWppwE16+OUUg1F3zOSdDS+nc01akva
         te+m0pPAvNYXBqTKXysmZbhaO99mHT29bIfDWtyawMT1r4omNNCO8kJ84akhWfJoxJzc
         5+ATH8BdJgfE0yJcOT5bhibZwFOopUXcaI+SHy3FOeX97sWefAwxGPypulovD01vd4TD
         tl0UDqbDIkD2oMWkUGxcri0Pzy1YcotzcfyAO9H+iMznVoS+PfQVpghdOkNh3yAc84c8
         Qnyw==
X-Gm-Message-State: AOAM530TMKkW88DIijV9TMtkz91oQQI4smq04vypiOyJAVB+cerv6RLU
        Xrh961GIJRtoYfaLuu5zjpLsg5qJ4SXjGzJ+lcA4CQ==
X-Google-Smtp-Source: ABdhPJzRuccajda0lvZX2w/+DdXmexWrUFl/B2OFA4hS4ryIA7/8/FI38g9Sc/H55qlMNSQAqFa8Wmrf7GbHja6mIt4=
X-Received: by 2002:a05:6402:31b1:: with SMTP id dj17mr4444751edb.142.1589570040580;
 Fri, 15 May 2020 12:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 15 May 2020 15:13:24 -0400
Message-ID: <CA+CK2bAo163NzFn=t+MXBYcTEHPqkptFw6K0d_yMbhwROdGy2A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] allow ramoops to collect all kmesg_dump events
To:     Kees Cook <keescook@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>, Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 15, 2020 at 2:44 PM Kees Cook <keescook@chromium.org> wrote:
>
> Hello!
>
> I wanted to get the pstore tree nailed down, so here's the v4 of
> Pavel's series, tweaked for the feedback during v3 review.

Hi Kees,

Thank you, I was planning to send a new version of this series later
today. Let me quickly review it.

Pasha

>
> -Kees
>
> v4:
> - rebase on pstore tree
> - collapse shutdown types into a single dump reason
>   https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/
> - fix dump_oops vs max_reason module params
>   https://lore.kernel.org/lkml/20200512233504.GA118720@sequoia/
> - typos
>   https://lore.kernel.org/lkml/4cdeaa2af2fe0d6cc2ca8ce3a37608340799df8a.camel@perches.com/
> - rename DT parsing routines ..._size -> ..._u32
>   https://lore.kernel.org/lkml/CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com/
> v3: https://lore.kernel.org/lkml/20200506211523.15077-1-keescook@chromium.org/
> v2: https://lore.kernel.org/lkml/20200505154510.93506-1-pasha.tatashin@soleen.com
> v1: https://lore.kernel.org/lkml/20200502143555.543636-1-pasha.tatashin@soleen.com
>
> Kees Cook (3):
>   printk: Collapse shutdown types into a single dump reason
>   printk: Introduce kmsg_dump_reason_str()
>   pstore/ram: Introduce max_reason and convert dump_oops
>
> Pavel Tatashin (3):
>   printk: honor the max_reason field in kmsg_dumper
>   pstore/platform: Pass max_reason to kmesg dump
>   ramoops: Add max_reason optional field to ramoops DT node
>
>  Documentation/admin-guide/ramoops.rst         | 14 +++--
>  .../bindings/reserved-memory/ramoops.txt      | 13 ++++-
>  arch/powerpc/kernel/nvram_64.c                |  4 +-
>  drivers/platform/chrome/chromeos_pstore.c     |  2 +-
>  fs/pstore/platform.c                          | 26 ++-------
>  fs/pstore/ram.c                               | 58 +++++++++++++------
>  include/linux/kmsg_dump.h                     | 12 +++-
>  include/linux/pstore.h                        |  7 +++
>  include/linux/pstore_ram.h                    |  2 +-
>  kernel/printk/printk.c                        | 32 ++++++++--
>  kernel/reboot.c                               |  6 +-
>  11 files changed, 114 insertions(+), 62 deletions(-)
>
> --
> 2.20.1
>
