Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7052C33CB6
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 16:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD7902064C
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 16:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NOmecTv5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbgAQQCV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 11:02:21 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53592 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbgAQQCU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 11:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OjbJmxwKAWa3w2/tuvJJB4C9U2NBVS2pCi/NhRGG8W8=; b=NOmecTv5DGPRD24mcSye3aJIa
        MTyQjcwfOOsd6YKHolDJ3CkNKZbCM0DXnHq0WrpFv81AWMxjgfPNaLCfKItGt/kOuCGkVOykDsdhI
        MWJidvvsFvcRXr9kj1jRNj7Ed0L8ve/Jk8t7h+spL11tlUb520nJS82YB6zXHWrN86oO1aIgh5lDB
        X3BEglEY3tfCL4EAEw+CMZwXp5oPCiuo3kpq03rklgdh4sDE2qehIhsHJOZmF6D7I3Q1KgV7vbUSd
        XvZjES3FplVooDv7fMT5sv9v3NrHXaAMzWZxIvQexmoDvPMPcWgwfh7tefCXteukdatUsffiYAZpf
        bwuHl6ZJw==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1isU4e-0004Dk-93; Fri, 17 Jan 2020 16:02:16 +0000
Subject: Re: [PATCH v2] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX for
 %pOF
To:     lijiazi <jqqlijiazi@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     lijiazi <lijiazi@xiaomi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b28a5fd1-aa36-34c7-c82c-f8ed4a771ce0@infradead.org>
Date:   Fri, 17 Jan 2020 08:02:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 1/17/20 3:15 AM, lijiazi wrote:
> Introduce OF_DEVICE_NODE_FLAG_MAX for device node printk, if add
> new device node flag, please add the corresponding flag abbreviation
> to tbuf in device_node_string.
> 
> Signed-off-by: lijiazi <lijiazi@xiaomi.com>

Hi lijiazi,

A few small comments on this patch:

> ---
>  Documentation/core-api/printk-formats.rst |  2 ++
>  include/linux/of.h                        |  6 ++++++
>  lib/vsprintf.c                            | 14 +++++++-------
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1..c73ccad 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -441,6 +441,8 @@ Examples::
>  							d - detached
>  							P - Populated
>  							B - Populated bus
> +                                                        O - Overlay
> +                                                        F - Overlay free cset

Use tabs for indentation, like the preceding lines.

>  
>  Passed by reference.
>  
> diff --git a/include/linux/of.h b/include/linux/of.h
> index c669c0a..0453601 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -147,6 +147,12 @@ extern raw_spinlock_t devtree_lock;
>  #define OF_OVERLAY		5 /* allocated for an overlay */
>  #define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
>  
> +/* Add flag max for %pOF related printk, if add new flag, please
> + * increase following marco, and add abbreviations to tbuf in
> + * device_node_string function.
> + */

Incorrect multi-line comment style.

> +#define OF_DEVICE_NODE_FLAG_MAX 6 /* maximum available flags */
> +
>  #define OF_BAD_ADDR	((u64)-1)
>  
>  #ifdef CONFIG_OF


-- 
~Randy

