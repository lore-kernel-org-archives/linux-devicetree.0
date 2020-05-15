Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BBDC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD5F920709
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 19:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="forty7Li"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEOTsl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 15:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726179AbgEOTsk (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 15:48:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCBBC061A0C
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:48:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so1378494pjb.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WC37HJp5SKUKE1fd2XCJ1OzGQx44RrsCosnhUT+bw24=;
        b=forty7LiZ/iuk6SLOTVtqdV3e1Dkwj4LmlQwa/W2IUKQS7OAVsqEaMc14nCdJxqhn2
         BRcSTXihVPu98Jc8ZpogMyqu+lml0krFOcd7hnpsHQJDbsHp31uLOk9UyVuXSY550Etv
         /ybqYX8gctpAEa7DYWQuEbPBMOuKsDgbn/5f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WC37HJp5SKUKE1fd2XCJ1OzGQx44RrsCosnhUT+bw24=;
        b=nvfDhk6ad5BBwUZCPyXZEC8WvuNqY8rHVHrmOw3+GduvvzUxJFEwYjy/4GtGNFZ8Tc
         0KEztANx5duvvO61B99AUqDS7JCp2Dvp15ncyhelO0r8hDdS8bUCyYHK9aqq46CoNx9q
         qiXgq2tOd0sWHMjXIVZz8xN1SFnNdpK65rYTA7mIg0h9F8er5UuzT+5LrvEbCCPBtTGR
         7iFjL7T4SZZyT5gm50CcTVfFd/vf1yrcsrNkvC74U92XolKMT7AogXHcqbRWqXxvQGcU
         1vCEH4GIe6IH7PMfO/AkciYlnwUB32u9zxgdwmFTgIkbKFHAi1SAyW80E+7bM68U/NuQ
         +giQ==
X-Gm-Message-State: AOAM533t5Y5FGXFvkZD7ex42v23c1eoWtKOsGTAzrr/0mT3cc+J+MBuv
        t0qBsSA37YNSUZh58Pt6t7sJVA==
X-Google-Smtp-Source: ABdhPJyqeZfGlv2x9taPmcDJmvn+guwa5XPJm8zIoyr0Laky0NrXpoQAMT9zTkN2ddJABAL26BHU/g==
X-Received: by 2002:a17:90a:e016:: with SMTP id u22mr2811624pjy.28.1589572120319;
        Fri, 15 May 2020 12:48:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w73sm2646498pfd.113.2020.05.15.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 12:48:39 -0700 (PDT)
Date:   Fri, 15 May 2020 12:48:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
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
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert
 dump_oops
Message-ID: <202005151248.1A3E0EA8@keescook>
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-6-keescook@chromium.org>
 <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 15, 2020 at 03:30:27PM -0400, Pavel Tatashin wrote:
> >  #define parse_u32(name, field, default_value) {                                \
> >                 ret = ramoops_parse_dt_u32(pdev, name, default_value,   \
> 
> The series seems to be missing the patch where ramoops_parse_dt_size
> -> ramoops_parse_dt_u32 get renamed, and updated to handle default
> value.

Oops! Sorry, I cut the line in the wrong place for sending out the delta
on top of the pstore tree. :)

It's unchanged from:
https://lore.kernel.org/lkml/20200506211523.15077-4-keescook@chromium.org/

-- 
Kees Cook
