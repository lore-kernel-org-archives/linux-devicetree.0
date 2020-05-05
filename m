Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADC7C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00BA5206A5
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 15:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Oq+trMWw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgEEPPN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 11:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729301AbgEEPPN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 11:15:13 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AB6C061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 08:15:12 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id b20so1949145ejg.11
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWufS7yMnGxvl5RSk1ItG7NV5OTHa1yb6qJ33zBP+RA=;
        b=Oq+trMWwmRUQH1XRYdoPwFYO1xToUCD3uzdrhYOZCwM4+4LNwbpasHT0e59OHK/mkr
         2Nfm3lBFclmqXyCZwpdAk1aR/5dcLKZkOFJ+bCGwJ1Qr6eA/gWjW9I1aOvkSkd2vLvwB
         TL0zEjNn3bkbWfaWcuHOHbnBEG3LtlYkJunUJst8eJguY/WBHf+ZUeLBNTqY//Gh10ja
         7JE34vPk8mekT31mstA9BUGClZOwwpQ6BMEvH2RDsaKFM8EZZGEQJx2xAuaNYaWvgfUE
         vaYdAGNgNT+5W4xskiTiJE35MXj7GPrKePC56fVk2OH64Yex3Q61YmJdoCQ/UG8FlEu3
         xN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWufS7yMnGxvl5RSk1ItG7NV5OTHa1yb6qJ33zBP+RA=;
        b=eES46Tb+UExHqWTZ0w5TOkSyyeZgM/VWhNgbozyumHk267BvNHjrBqdh7q2OaE38n8
         YxEFq/tkDc+pcJ03rDXVMalE8jniCE0XH0FNPJP0zOd5i7OvtD4uxYmblRyb40LKFZYB
         2pfvnOtxXfElsCFkzj8NVpbAyOu64Nu/KZHPrlvH1uQaSFzhZzMEADHbnDS3fNLNxW7o
         I5dsnKv/BW7GldAib7SRTzp3NotDxRtNT0tGQKr8T98yWf+g4VqHIozpUoURqDlKS3sF
         6wobkxrxq801SOMhogN3JVp7bCDyIqu7lITJ7zFpg8Wgzrit449k7KL/v/+ZNFsFb1g1
         Q3BQ==
X-Gm-Message-State: AGi0PuYzLwsTT8u+sRyvz/kcWR2tjdTW9tkep1NXvwBWAwrLE+Ml8ujs
        16fRBM5AegB/g5p1K1nxzDSqQUrJT903rfts6X1YxQ==
X-Google-Smtp-Source: APiQypL+4aphyWXOO3H4lGHVtplHmTH5s5zeW7xNhk1CkBPsVbYgj5QGuKQWtFptEgVO6hOU9QoUkj9D9ZzM4UXjq6M=
X-Received: by 2002:a17:906:374b:: with SMTP id e11mr3245934ejc.283.1588691711197;
 Tue, 05 May 2020 08:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
 <20200502143555.543636-4-pasha.tatashin@soleen.com> <202005041229.D410FE0B1@keescook>
 <CA+CK2bB1=gwaDCcYLLi56oQFS6hdc8wzG-s14rz4q7PDCnLycg@mail.gmail.com>
In-Reply-To: <CA+CK2bB1=gwaDCcYLLi56oQFS6hdc8wzG-s14rz4q7PDCnLycg@mail.gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 5 May 2020 11:14:35 -0400
Message-ID: <CA+CK2bCT_19KgBoNMkJ6azriJgncrvzWUQq9yZ8MDB85q5FmHg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] ramoops: add dump_all optional field to ramoops DT node
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

Hi Kees,

According to Documentation/devicetree/bindings/submitting-patches.txt,
DT binding docs should be separate patches; checkpath.pl also
complaints about it. I will keep it as a separate patch in v2.

Pasha

On Mon, May 4, 2020 at 4:00 PM Pavel Tatashin <pasha.tatashin@soleen.com> wrote:
>
> On Mon, May 4, 2020 at 3:29 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Sat, May 02, 2020 at 10:35:55AM -0400, Pavel Tatashin wrote:
> > > Currently, it is possible to dump kmesges for panic, or oops.
> > > With dump_all it is possible to dump messages for kmesg_dump events,
> > > for example reboot, halt, shutdown, kexec.
> >
> > Please just collapse this into patch #2.
>
> Will do it.
>
> Thank you,
> Pasha
