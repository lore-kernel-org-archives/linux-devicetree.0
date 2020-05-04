Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50F4C47247
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 20:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7011205ED
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 20:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="HiS3C7pV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgEDUbb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 16:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgEDUba (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 16:31:30 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3F0C061A0F
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 13:31:30 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id x1so15104516ejd.8
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iD+7rCv19A+JVwng0cwm3/xzNCTcSEjwlIiYKk9uiJc=;
        b=HiS3C7pVeSXcrkb235oy8Rnf/oLD0dVimUKrLc0zeeW/8XaSu203SAaOKchrWyKAxB
         Z9MjsQPaSAO2yPuBjYFgCll5xe7kHNJ66BXwMCPOffizsuBNB4WoiJGbKqr5FhwcTWL7
         epoa3TmJlDVEJqejcAW8n4Y+bHuwSpRaBkCJvukLd7/UaCkLY284LPMrm4Zi12c1pzhr
         NaT85hv/kpIrmtLG5IGEUpvfHioRj+H3SlIznGgpN3pbXQJHmyiQC9brFJZ5pojQ1BO5
         t38dnwRBT5lNXIzdfhUd7Cjwjgfq3tsYfJfii92eTR/RTHyoxrcmjRtQwuTpRc5Lr46K
         c6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iD+7rCv19A+JVwng0cwm3/xzNCTcSEjwlIiYKk9uiJc=;
        b=ffC9lfjGrFM3O7NWp6sw/Sd6I6bRZCOuJ6viAcifoOjRlHt42hSQRr6UfHUq9JPSUG
         pl/ip7nic7OtCBomH5Jw0q52XF5RQDfrJO7TfIJn8LGWTHjA128rLEbCfEWFLQMYKKZr
         S0CAcDaE43GVdg5toVFgW1Z15u3L2aBh37pI/bQMYNvbMSHLcR8k4zgaacV00okHZmwc
         uZUSvcJFtNvWvjyOmBkv4VcvOCpXdrjfgbpLR+esWQxmcIBCtjBYdlckM1qeB+9UXe+G
         rRIpTQODkeKJpZYM77YSfPkHyk87enB/LKCJmnpk/D8JNHXyGU+xLaHlEfjTZOlb9sYE
         QQqQ==
X-Gm-Message-State: AGi0PublXO11QfXVj4jJEUNoyqPHra4/wV8yA0uybb88J1TjvahumQNb
        DNRiMqGUQFTKp9ga86mctIXSvci/NRHXj/mz+YSPXA==
X-Google-Smtp-Source: APiQypLjLLzJYSGQHmzKy9PL7/vfCx8HEa61JRW6aeMlPHl9r7osDVCErguI8BiMvjtked5EcSIjQgppbgkYxYAopd4=
X-Received: by 2002:a17:906:49c7:: with SMTP id w7mr16855566ejv.29.1588624288649;
 Mon, 04 May 2020 13:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
 <20200502143555.543636-3-pasha.tatashin@soleen.com> <202005041222.4A870DFEC@keescook>
In-Reply-To: <202005041222.4A870DFEC@keescook>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 4 May 2020 16:30:52 -0400
Message-ID: <CA+CK2bDyi-vncYc0_sSZZ9Wb4O7oNUYH-6SN=-XKkeEamB8W8A@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] pstore/ram: allow to dump kmesg during regular reboot
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

> > -static void pstore_register_kmsg(void)
> > +static void pstore_register_kmsg(int dmesg_all)
> >  {
> > +     if (dmesg_all)
> > +             pstore_dumper.max_reason = KMSG_DUMP_MAX;
>
> So, I'd like to avoid any new arguments in the API and instead add a new
> field to struct pstore_info, which will be valid when PSTORE_FLAGS_DMESG
> is set, and the max kdump reason can be set there by the pstore backends.

Hi Kees,

I am trying to verify that I understand the request correctly:

1. pstore_register_kmsg() -> remove argument.
2. pstore_info -> add a new field  max_kmsg_reason: contains the
actual reason value
3. Modify: pstore_register() to set this field in pstore_dumper prior
to calling pstore_register_kmsg().
4. remove ramoops.dump_all boolean parameter
5. add a new parameter ramoops.max_reason integer variable, which will
be set in pstore_register_kmsg
6. Modify other users of pstore_register() to provide the correct
max_kmsg_reason.

Is this correct?

Thank you,
Pasha
