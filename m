Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57122C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 18:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32CF22063A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 18:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mvyOT1Ef"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgEGSEl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 14:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728324AbgEGSEg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 14:04:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D3BC05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 11:04:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w65so3354689pfc.12
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oPdDzYdT7lq792vB2W2IICBi0aPxUsQi5JdgRLaM8DE=;
        b=mvyOT1EfMtTIMiyqWwuFA04fPAW6A3fhyPcQYaNMProcOmtHYJb+m3xgi4wA3jLajJ
         0/+FxWryJeRpZO6qoIDw8HCGDcluMT5vD6KSyflLwL4sWR4NWkx/CTjAMPrjcD9Qo+LL
         yXfNX0vri2Wv4UK70vKw8jXT4Kx/RlaYek7TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oPdDzYdT7lq792vB2W2IICBi0aPxUsQi5JdgRLaM8DE=;
        b=l6+HXycFaoH0VB4axJvc5pXGYU2TzyKFKXiKD46wdq4m048r8qk3n/G5c2YgpYAijM
         mnBSh7M0iZTkHgF8Ibx07aFLEEOXTt5so7gf3FWijGJGp/oIj2n/1Xo2hqwCJoSthk7Z
         ogatNRnyGdBF6gO5KYAcXcROacQ9pYg90hmKt7ko0MP012brz1FixeNnwNo31G2/VIw0
         LfzZTnYkhfZGxScmJL2ad9mM7bt9WErv19IGaTM0UH2chTQTLWRPG0jJNZT3HQ2kXN/m
         QaxIomzSOKg+XunENbELzPbZrdF3l4fMa9vU1xs7z+R88Mj3v3AzX0oLgL0EETA7jaMx
         P3fA==
X-Gm-Message-State: AGi0PuYIt4Zolw7LfHMrknDh7RuBcRkSQDHxneDlnkQbJld2UWH56esm
        p9cYsKMMYf3lzCTdzKl5rSpaQw==
X-Google-Smtp-Source: APiQypKvA1tcaT6o5w99vrDSSQJendwU+OBaqZIhGVGhaS/hGCH2qmFU6zieh7bYSXERa2QoSC5VMA==
X-Received: by 2002:a62:b514:: with SMTP id y20mr14582234pfe.49.1588874674588;
        Thu, 07 May 2020 11:04:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q21sm5547240pfg.131.2020.05.07.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 11:04:33 -0700 (PDT)
Date:   Thu, 7 May 2020 11:04:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/6] pstore/ram: Refactor DT size parsing
Message-ID: <202005071103.EDD880257@keescook>
References: <20200506211523.15077-1-keescook@chromium.org>
 <20200506211523.15077-4-keescook@chromium.org>
 <CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 07, 2020 at 08:57:50AM -0400, Pavel Tatashin wrote:
> On Wed, May 6, 2020 at 5:15 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Refactor device tree size parsing routines to be able to pass a non-zero
> > default value for providing a configurable default for the coming
> > "max_reason" field.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> ramoops_parse_dt_size
> parse_size
> 
> Are used to parse flags, and max-reason properties, so the "size" in
> their names become outdated. How about:
> ramoops_parse_dt_prop
> parse_prop

Yeah, I struggled with that thought too.

> Otherwise it looks good.

Okay, great, I'll find a better name and apply this series. Thanks!

-- 
Kees Cook
