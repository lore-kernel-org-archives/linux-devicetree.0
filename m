Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219FAC3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F22BB20705
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T5FiPtGv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgEDTau (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 15:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726291AbgEDTau (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 15:30:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3F1C061A0E
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 12:30:49 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t9so387879pjw.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 12:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GvLvZU44cktGvErQTqiBjoj1iPW+UBXunAz14YrNO9c=;
        b=T5FiPtGvZMFrbUZk/4iBuNfw+RFpSJl6HUKnfq+wHH1++wYlpZz4hqvvAePrDhQQ6s
         Vck1ldqrkjru5SeI1/td7byouT12Qkww1IE98DHrTD4UZ+NcWdPRHFGl5g+jqtH4C7CX
         545i33PZ2/G0mSQECOFrrV+P80qGRg5XCAqRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GvLvZU44cktGvErQTqiBjoj1iPW+UBXunAz14YrNO9c=;
        b=ePrCS5vsaH+CGtMs34BDd7j03iWpv2KAVl2BzyVrSs3+vO8OU3kjCBB/qwC829HpW+
         eIXXD9tI/l7IYIPN6bCvCNRWIG9VvfneJtRZ40FJ5xPFTYhGd6sZ10DGik49PheL5zaQ
         hYbQtH1uPfujqWYEy2dPEiFuSV1nfHMtgeIMSw2irXCaxmWLZ6M+nGx25AiZ/lOV61q8
         6bxvPAxU2al1Sc8aGfaQjYLcL+oW80YSsgRG+qvArEheRSBzyL5i8rME92qdQUHFt4X0
         f7oi+t1kZnF6aqKh6u0b7ununOdnEVZIsDHMjtYookAy6IsWr0E38e/J7zqMhdRpvxut
         +rGA==
X-Gm-Message-State: AGi0PuZOLRJgVmmmEk6wpZb5t8VMFdkV825EHtAX/JvVIAtVnlV5q1mI
        lu8wF2NXma7cckr87eItiICzyg==
X-Google-Smtp-Source: APiQypJkNruhH47ZJCVEHc7eoKaadBx0p15GdanZfiVN4hm+8f5QavcGQgO6r0fQPqFuGhCiYa49Kg==
X-Received: by 2002:a17:90b:b06:: with SMTP id bf6mr570061pjb.179.1588620649478;
        Mon, 04 May 2020 12:30:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i10sm9256813pfa.166.2020.05.04.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 12:30:48 -0700 (PDT)
Date:   Mon, 4 May 2020 12:30:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, anton@enomsg.org,
        ccross@android.com, Tony Luck <tony.luck@intel.com>,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/3] allow ramoops to collect all kmesg_dump events
Message-ID: <202005041230.806B1581D@keescook>
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
 <202005041112.F3C8117F67@keescook>
 <CA+CK2bBDzbXdH23aDxqGzMoxPppNcVmitrYJ00tJqympMBVJOg@mail.gmail.com>
 <202005041211.040A1C65C8@keescook>
 <CA+CK2bAJgKR+=Tby91gU-ZKy29Juv_oJinCTFAWRaKiiro2vkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bAJgKR+=Tby91gU-ZKy29Juv_oJinCTFAWRaKiiro2vkg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 04, 2020 at 03:17:40PM -0400, Pavel Tatashin wrote:
> On Mon, May 4, 2020 at 3:12 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, May 04, 2020 at 02:47:45PM -0400, Pavel Tatashin wrote:
> > > > > # reboot -f
> > > > >
> > > > > After VM is back:
> > > > >
> > > > > # mount -t pstore pstore /mnt
> > > > > # head /mnt/dmesg-ramoops-0
> > > > > Restart#1 Part1
> > > >
> > > > Is there a reason that using ramoops.console_size isn't sufficient for
> > > > this?
> > >
> > > Unfortunately, the console option is not working for us (Microsoft),
> > > we have an embedded device with a serial console, and the baud rate
> > > reduces the reboot performance, so we must keep the console quiet. We
> > > also want to be able collect full shutdown logs from the field that
> > > are collected during kexec based updates.
> >
> > I meant collecting console via pstore (i.e. /mnt/console-ramoops-0). Are
> > you saying that's still too large for your situation?
> 
> pstore /mnt/console-ramoops-0 outputs only messages below the console
> loglevel, and our console loglevel is set to 3 due to slowness of
> serial console. Which means only errors and worse types of messages
> are recorded. AFAIK, there is no way to have different log levels for
> different consoles.

Ah-ha! Okay, thanks. Please include this rationale in the v2 changelog.
That makes perfect sense; I just didn't see it and maybe others will
need the same clarity too. Thanks!

-Kees

-- 
Kees Cook
