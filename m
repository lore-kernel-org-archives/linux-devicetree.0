Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DE4C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 15:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11760206DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575647263;
	bh=XU4KzAffhiVHpNEe4/1pdiuPJO9W/DiMeS6NkVUi/r0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=1GP6pzc+rNd27kHg7CrFu6JJtXCyYqpRG7KBD0e1qmQXY1vEy6YyaF4xTjhiizlCS
	 FrApRvx/WNVvx6C47k+VTkSq7CrRJ/6BQwMiyfILQ7AEPrKqeojQzee11swaprI/LD
	 8ue3as5f+KKCCxnz6RkPLFZwQGC0VIq6vLVhdXdc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfLFPrm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 10:47:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:52902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfLFPrm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Dec 2019 10:47:42 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BBEE206DF
        for <devicetree@vger.kernel.org>; Fri,  6 Dec 2019 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575647261;
        bh=XU4KzAffhiVHpNEe4/1pdiuPJO9W/DiMeS6NkVUi/r0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c7iu67z+LrSf350mbV7RDu4fl92aou0+HBXLZHPoFUUbexNBVScqI5NFIyEQzIHrh
         KVL1Z6FEJ2oo54bH5WVwLIlOMvVAlED5gO+UO/YHoq9gMIYcozGeL4trRzOwteFX3I
         FyqjLTJZCk4MnmQ9dwnQMlAKqplsQWEVU3i3Tsq0=
Received: by mail-qt1-f176.google.com with SMTP id 38so7484972qtb.13
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 07:47:41 -0800 (PST)
X-Gm-Message-State: APjAAAWAGc0W6RG8qsmhHcKNSPoYsMcMxWxoSWcfWPBsj0HXbX7RVUFC
        UcDQusGYUsfiDTCLpZ/s99HKlkCSbN3PvOm50w==
X-Google-Smtp-Source: APXvYqyeSom6mLENE9BcvQUDnH0vB4y24fx8zVOglyIjwjuSLgFIcolTe8ZmUrklSMAw/rsuJYze6eLV3P6APmMsULk=
X-Received: by 2002:ac8:2cd0:: with SMTP id 16mr13466853qtx.136.1575647260809;
 Fri, 06 Dec 2019 07:47:40 -0800 (PST)
MIME-Version: 1.0
References: <02bf81614fd5806fbdb8e58760f424adeee3fdc6.1575611847.git.lijiazi@xiaomi.com>
In-Reply-To: <02bf81614fd5806fbdb8e58760f424adeee3fdc6.1575611847.git.lijiazi@xiaomi.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 6 Dec 2019 09:47:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rgS5oJGYP4WvE_uRc9RR+19MZMVe-gpu1nJUmqgdYNA@mail.gmail.com>
Message-ID: <CAL_Jsq+rgS5oJGYP4WvE_uRc9RR+19MZMVe-gpu1nJUmqgdYNA@mail.gmail.com>
Subject: Re: [PATCH] of: increase readability when reading prop through sysfs
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        lijiazi <lijiazi@xiaomi.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 6, 2019 at 6:15 AM lijiazi <jqqlijiazi@gmail.com> wrote:
>
> Replace '\0' with '\n', output will display on a single line.

That would be nice, but that breaks the ABI. For example, dtc can read
this filesystem tree and convert to dts or dtb.

Even if we ignored that or could fix all the users (we can't), your
implementation is just broken in all cases. If the value is a string
(you could guess, but you really don't know), then you are removing
the null termination. If the value is a number, then you are changing
the value when the last byte is 0.

> Signed-off-by: lijiazi <lijiazi@xiaomi.com>
> ---
>  drivers/of/kobj.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
> index c72eef9..c776610 100644
> --- a/drivers/of/kobj.c
> +++ b/drivers/of/kobj.c
> @@ -32,8 +32,18 @@ static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
>                                 struct bin_attribute *bin_attr, char *buf,
>                                 loff_t offset, size_t count)
>  {
> +       ssize_t pos = 0;
>         struct property *pp = container_of(bin_attr, struct property, attr);
> -       return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
> +       pos = memory_read_from_buffer(buf, count, &offset,
> +                       pp->value, pp->length);
> +       /*
> +        * value is ends with '\0', so if read prop value through sysfs, the
> +        * output will be displayed on the same line as the shell prompt.
> +        * Replace '\0' with '\n', increase readability of output.
> +        */
> +       if (pos >= 1)
> +               buf[pos-1] = '\n';
> +       return pos;
>  }
>
>  /* always return newly allocated name, caller must free after use */
> --
> 2.7.4
>
