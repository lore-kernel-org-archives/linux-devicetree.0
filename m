Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A57C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 13:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C70F322522
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 13:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKbv5hop"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgATNie (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:38:34 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39341 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNie (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 08:38:34 -0500
Received: by mail-pf1-f194.google.com with SMTP id q10so15876009pfs.6;
        Mon, 20 Jan 2020 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2pttOwdfC/dADBrcJDiI0NHj3/FeUPR6VyWuxCBiU/8=;
        b=WKbv5hopk7D5k/569P1LHTLk/qvnOp/+Y4AoH6FlK4YBzMV+PjgroU3oNCo092xTSs
         Kd05y6KWgur8svEagrb87W2Dahymp0L8/EiuMWBrsSWaEiWzHOFRfembMpArcjXAiP4v
         rEfLWg6tkmEZtj7F/v6RwuaTXTS4PrehFdZuG77JueEewFeVblTx+SarQydbwApP7rTa
         sF2w2aS1Cl4w0gWfnmUM17mmgIhLgJa8W+9tThwp0gLLy7F6iBUE8MCjBCHYj/x0Losy
         D/4uLuvhWqPUrQE0SNEvJ37zFoETmy0zDD5dihR+xvB/SbMir1CpLGMopPQdDAwkro7W
         EPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2pttOwdfC/dADBrcJDiI0NHj3/FeUPR6VyWuxCBiU/8=;
        b=dXu9+XVa+3p1Q58lOnuT1GzMNGZmyhLUTk0Gu/NUdjLCYYBnMrv7OG/IFnf4dR4WFe
         n1pOT7uuvctlirskzNLtFOhvFpUK6+xDeTZMr4JpVFOIcCPdfpdHl8GBEA4yV9346M73
         3nJKa+buHDdx5PsFnO542k3xl8C91T3MhaTYYMcVsEKF2/lSwA9bPwTqfDC+4QeHchEV
         rfGoteHM9yU2wem3NV8J5hGShrTHXH35BSi/IFz4skSRCVRnYP1OdSQoO98XMLx/PFFO
         L7HobRuUjVydMbn3rWcxpSg5IaJbNsUn3Hg0LJju7Z7QBQ3Wj8jVKwEVoQNsN3s0E+qh
         QZCA==
X-Gm-Message-State: APjAAAWYYPAE4c0h7Fz40TVl5XEqICmU5Q3yFzCiRTw3e5c4+b1gyL8K
        bPvuNAw2TcN2DtMBzKmNHlE=
X-Google-Smtp-Source: APXvYqzMFes9HQOld2+PzYvHu7PDu9+P9ajIw8QZajI75moHBzGmZx1OomAacJmds3LWv8dGCQiygw==
X-Received: by 2002:a62:1a97:: with SMTP id a145mr17871202pfa.244.1579527513307;
        Mon, 20 Jan 2020 05:38:33 -0800 (PST)
Received: from localhost (187.100.30.125.dy.iij4u.or.jp. [125.30.100.187])
        by smtp.gmail.com with ESMTPSA id e2sm18105373pjs.25.2020.01.20.05.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 05:38:32 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Mon, 20 Jan 2020 22:38:29 +0900
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
Subject: Re: [PATCH v3 2/3] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX
Message-ID: <20200120133829.GB386200@jagdpanzerIV.localdomain>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
 <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On (20/01/20 19:38), lijiazi wrote:
[..]
> Changes in v3:
>  - fix incorrect multi-line comment style.
>  - split v2 to 3 patches.
> ---
>  include/linux/of.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index c669c0a..c5bbfa6 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -147,6 +147,13 @@ extern raw_spinlock_t devtree_lock;
>  #define OF_OVERLAY		5 /* allocated for an overlay */
>  #define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
>  
> +/*
> + * add OF_DEVICE_NODE_FLAG_MAX for %pOF related printk.
> + * if there is any change on these flags, please synchronize the change
> + * to device_node_string function in lib/vsprintf.c.

So maybe the flags can become enum then?

> + */
> +#define OF_DEVICE_NODE_FLAG_MAX 6 /* Maximum available flags */

	-ss
