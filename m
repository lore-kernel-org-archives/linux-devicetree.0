Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AE0C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 13:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29D1422522
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 13:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h62FLWd/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgATNg5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:36:57 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36285 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNg5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 08:36:57 -0500
Received: by mail-pj1-f67.google.com with SMTP id n59so7214234pjb.1;
        Mon, 20 Jan 2020 05:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NneulMLB2heGrhq0MiBVjvqrwFXe46iFqp94Z+XbEJY=;
        b=h62FLWd/5Yl39f8qNI044PIw7abmufHtradfLDLXShKSf5M2fGzQGCq+Bgv5w/I+iS
         zBzGfjOomF60DBqNWwSnS8VpBxPoZCoXLxL0dih9/N33W0ehQ6wMweg3Q5tLduMLZyM9
         E6pYkdxB3wV0tmG/nM/bssLeWZBVYHXT2VudDaAy5GRwT8gdCaBs810L613d9PlP01yM
         pt50rul19ewxYPE6Iwji7EVTL5lY9qXXZyvMf73so4bQXCGUmq1dMcq+V/09I0AX/SeY
         ZHWfSjDNpMA+/cBDLaPrQVX6SiR3kurwFwflrmPkyk4NbNdrVHmFxYfFB8nY9P3MgGFA
         H15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NneulMLB2heGrhq0MiBVjvqrwFXe46iFqp94Z+XbEJY=;
        b=MhRDWkbSb0Ho8H+nNNuJYu1uBmp59LHjNqW8LxfdWjjngOezEVni+ORJL6Wt6Cybdt
         Z2SqjeQvMKADCuk6MVXWZ+QIFljIj4aFnD+B1jKKQ6tvBWjCaHoiiiTzS2IjfPEyPo+d
         Gv6RuxSxXTU2fQXkqefLH/SqaoezAqVxaoXsvhA8RT6eDWOpS5RDoZw42cX6uDX8PGm/
         1cLdU0SNaYNcoZiZnWonknOevai740QcNRntoPPo5U71CKhrzbh/jAXnwMEbvTLaZM7c
         wHSrEiw/dGUoCUVHCZAWljiDPZdMjF4whwNgH2R6r64s0C/3VbdrRIDzgcbWQB4lw7IB
         BafA==
X-Gm-Message-State: APjAAAWBjYkh06ASB2Mkr3sf0ANutjecnxSdpMMTRvn6SFVQF5aNzZJP
        mSl/HHDYF9ojMrmzcVFvKgI=
X-Google-Smtp-Source: APXvYqybq7q4zJctwXp1DGn1Y4j85AkYtBcCGU58kJYMIZDKT8YmZXaQQvZOLuLIpBAxn+lMIYsVbw==
X-Received: by 2002:a17:902:7c05:: with SMTP id x5mr15349272pll.236.1579527416525;
        Mon, 20 Jan 2020 05:36:56 -0800 (PST)
Received: from localhost (187.100.30.125.dy.iij4u.or.jp. [125.30.100.187])
        by smtp.gmail.com with ESMTPSA id n1sm41180468pfd.47.2020.01.20.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 05:36:55 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Mon, 20 Jan 2020 22:36:52 +0900
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: Re: [PATCH v3 1/3] lib/vsprintf: add two device node flags for %pOF
Message-ID: <20200120133652.GA386200@jagdpanzerIV.localdomain>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On (20/01/20 19:38), lijiazi wrote:
>  Documentation/core-api/printk-formats.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1..9271f20 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -441,6 +441,8 @@ Examples::
>  							d - detached
>  							P - Populated
>  							B - Populated bus
> +							O - Overlay
> +							F - Overlay free cset

I think these 3 can be just one patch. Patching Documentation and
vsprintf in separate steps might be a bit inconvenient.

	-ss
