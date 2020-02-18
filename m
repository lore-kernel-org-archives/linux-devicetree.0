Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2457EC34026
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 16:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0EC622B48
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 16:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iciCQ9Qq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgBRQMI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 11:12:08 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:45566 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgBRQMH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Feb 2020 11:12:07 -0500
Received: by mail-yb1-f196.google.com with SMTP id j78so7270575ybg.12
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 08:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjDK92cq6eueYtAH7lh5os8ugRjhacOoPfH4iUfb/4c=;
        b=iciCQ9QqVyKyT29Es3/zEUXbeqH7sVFp/T8Bf70f6myaGETTZCp0Riyn5h/qF2x5Bk
         9HX+J1h6gi3NORXV6Ti1E6Hmv2T1LZE1UsXHvPDXbqXHgx7c2jMS23WkE1T6tov02SIU
         ku9XpWWXYpCDNhKBeb2lWTbLlf+MBZ0y1JNzb5zESmv89F862j5JNNYHCeMVdYXq5ciH
         yHQ5OrG8BqFSdR3TBiYeLNKaEELlYXFLzVGz+JGSKweOb26z9dcPFlgyipxTBnYurPZt
         SRHfcpx3WLJYaRZYbRAVGmZGSk4QPxt3wg6RMmvROThi3BSc0Qk3MrvombrBu3n6cD79
         8wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjDK92cq6eueYtAH7lh5os8ugRjhacOoPfH4iUfb/4c=;
        b=Ns6i4y9nWps3KIk1//GRmsCMTq8ARMDHJEqL0AGpTy9fbbssDb/P83KL8H9pmToaX6
         ofjlJajvFx6y4csISqgQZ+s/R7ZPBNJJhM2gh1ZF+RPwFU56JKZK2aWkM2YG+xSJfZFZ
         Olxi73gc7wuzAegRo/0EcFe6iGG9l5iXnMdPk8DZ9Q40dxDuAy9Apy+67n4ZqcfP7aBh
         /NvwArdVmTDHo/59fNcijSOWXo/Z3wXzQkmpo8wLpBzrdRK3/IvnpJ0NlO7FkI7V5Xe5
         TtzIgNxsDI3VeRRM5uS14ysI53WohhBwb9Wj5RnlaNIUfSrCBrCawxOsLgaC326xgrpL
         QgfA==
X-Gm-Message-State: APjAAAV523fJKIWuXteKGoTN+zRLg5vM0S+fDTcO7urdpqZHZxj00vFM
        yUWkCewnRviJwTAHPGWnnKA=
X-Google-Smtp-Source: APXvYqxBuuafcDvxtlYQAT9h4mdYCHo/cJyYIWzkgOKac+b8G+0kEHOkLan2MUGAfDEiR/qHeELP+w==
X-Received: by 2002:a25:ba4b:: with SMTP id z11mr20898881ybj.261.1582042326851;
        Tue, 18 Feb 2020 08:12:06 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id a124sm1892643ywc.104.2020.02.18.08.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 08:12:06 -0800 (PST)
Subject: Re: [PATCH] of: kobj: fix unreasonable pr_warn() in safe_name()
To:     qiwuchen55@gmail.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
References: <1581822693-5308-1-git-send-email-qiwuchen55@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <12db90c7-f882-a381-3b56-a56888611cf9@gmail.com>
Date:   Tue, 18 Feb 2020 10:12:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1581822693-5308-1-git-send-email-qiwuchen55@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2/15/20 9:11 PM, qiwuchen55@gmail.com wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> safe_name() tries to find a non-existing name of kernfs_node
> by sysfs_get_dirent() no more than 16 times.
> 
> There are three possible results when while loop breaks:
> 1. i = 0, name = orig_name, name is safe to use.
> 2. i > 0 && i < 16, name != orig_name, name is safe to use.
> 3. i == 16, name != orig_name, name is unsafe to use.
> 
> However, the original code consider 2nd result as unsafe with
> a unnecessary warning message by pr_warn(). This patch can fix
> the problem.

No, the warning for case 2 is appropriate.

The result of the rename is that the contents of /proc/device-tree
are not equivalent to the devicetree.  It is valuable to know this
has occurred.

The only way I know of for the rename to occur is if a node contains
both a property and a node with the same name.  This should not occur
if the name conventions for properties and nodes are followed.

If anyone is aware of a scenario where variable i can be greater
than 1, please let me know.

-Frank

> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
>  drivers/of/kobj.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
> index c72eef9..b32cf55 100644
> --- a/drivers/of/kobj.c
> +++ b/drivers/of/kobj.c
> @@ -52,11 +52,14 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
>  	}
>  
>  	if (name == orig_name) {
> -		name = kstrdup(orig_name, GFP_KERNEL);
> -	} else {
> +		name = kstrdup_const(orig_name, GFP_KERNEL);
> +		return name;
> +	}
> +
> +	if (i == 16)
>  		pr_warn("Duplicate name in %s, renamed to \"%s\"\n",
>  			kobject_name(kobj), name);
> -	}
> +
>  	return name;
>  }
>  
> 

