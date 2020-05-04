Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43310C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21E6A206C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 19:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Si7dlb0A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgEDTMQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 15:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbgEDTMP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 15:12:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41960C061A0E
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 12:12:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id p25so5995797pfn.11
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DRRJVsf51l5t9Dm4TlhSU/EZbXOvcOE4YxM3FowxRF0=;
        b=Si7dlb0AnRhxMKmPOWWmPJJFBiUT4hTbUEZ13DYzEVOo2Il6yfzy/8I4eF85hIu4Kg
         JTsIF/Gth/JFANckJbrIiWa1vqiV+Kn8c9EHteuh/ReoJW0U5GlArClgOw2sVllSjRef
         3fe1eu6sfxWOOEXu+wxVB1GNh8zSo/xAskcUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DRRJVsf51l5t9Dm4TlhSU/EZbXOvcOE4YxM3FowxRF0=;
        b=OpTkxb93j9eFHsjJaInqGXtQCAeJB5gdanPJ/frTgFx9UkkLcBrQ0Yy/NDLkiZ9qGU
         dyFegOjNJJ2SoYebg/aF5sJXy5aGOdYrmkQWC/Ct0YvNmJMFnnQCV1tC+a0XdE9cu6ya
         p3pIn7u9lT0zh07FuRDkCqIkOrwva87FNKQ9YinY9KNok17SwCk+Gp552tsZi22nTibe
         bcGw6NZn4NH0LvjGkopTENoQaHVtp3lapoh6hOkPkOiBnRMxaVrhlokPMpK+KBox9P5p
         jCeaQzII5HZhaOXC+zU/opXn8g+18cUb6F4cfqyloICZLWCDKvXxWvlS6pUUFgSvwFH3
         ZbYg==
X-Gm-Message-State: AGi0PuaJv069s7A1g1K7529z5ha0guwZm8Q5WD/Tx7f/6muiRUxa0mRW
        OPBMr0EEV0xKC6oYSKZAVIpZaQ==
X-Google-Smtp-Source: APiQypK9UGDyEzyZDsYFS7KmpnuRRHd1CKSUuVF2CV0RkZbNly3BomdV876VP1jJ+iRSqqtxTefo9g==
X-Received: by 2002:a63:7e1b:: with SMTP id z27mr403821pgc.19.1588619533882;
        Mon, 04 May 2020 12:12:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s4sm1730400pgv.78.2020.05.04.12.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 12:12:13 -0700 (PDT)
Date:   Mon, 4 May 2020 12:12:12 -0700
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
Message-ID: <202005041211.040A1C65C8@keescook>
References: <20200502143555.543636-1-pasha.tatashin@soleen.com>
 <202005041112.F3C8117F67@keescook>
 <CA+CK2bBDzbXdH23aDxqGzMoxPppNcVmitrYJ00tJqympMBVJOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bBDzbXdH23aDxqGzMoxPppNcVmitrYJ00tJqympMBVJOg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 04, 2020 at 02:47:45PM -0400, Pavel Tatashin wrote:
> > > # reboot -f
> > >
> > > After VM is back:
> > >
> > > # mount -t pstore pstore /mnt
> > > # head /mnt/dmesg-ramoops-0
> > > Restart#1 Part1
> >
> > Is there a reason that using ramoops.console_size isn't sufficient for
> > this?
> 
> Unfortunately, the console option is not working for us (Microsoft),
> we have an embedded device with a serial console, and the baud rate
> reduces the reboot performance, so we must keep the console quiet. We
> also want to be able collect full shutdown logs from the field that
> are collected during kexec based updates.

I meant collecting console via pstore (i.e. /mnt/console-ramoops-0). Are
you saying that's still too large for your situation?

-- 
Kees Cook
