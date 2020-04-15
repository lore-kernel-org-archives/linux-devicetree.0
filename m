Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4898BC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:07:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F07F20768
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:07:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YmHRbXpc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406347AbgDOTHh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 15:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416874AbgDOSxZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 14:53:25 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D0BC061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 11:53:25 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id d7so9360808oif.9
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UkOE4fzYqNNS8DcHe5tiuu2r/QTt3uX1JrnwwjvsTZw=;
        b=YmHRbXpc73KSxhoWUxR6W/AaqMIg//dGM5lPLTN9hjVunPcI/kFvIlklmpc9nwPczn
         8Jsjcuzd37iOEzWZVX8kIh2tMJ5UFYZfcGi65RmxOd/T8ydV2MSu2g8wg8ECLxEhe56+
         e901uGL4qVyaSZR3lNcPWT8z9ul0G9xdG41TsPF+lVq+5kH701sMvNYVXX6Z7L+6RycV
         3VDhIARnp5mqG8t05Okzk3mhS15tZKy6NEas6GZEsGgiBeOtEGccHbptZ/MxrIjGEt7O
         acIz4dTFfx38KhfD9yfB7QQr4puxyN7Z/C3n5GSOkEqC20B7DAMa3LKW1cLZxeSQD781
         B9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UkOE4fzYqNNS8DcHe5tiuu2r/QTt3uX1JrnwwjvsTZw=;
        b=MZbI2+erJVIzQzr8Ry48iSEqV8UCrP/MiOBEw/BY6JcqABUhNXRhjWCQfGJ3im2x2o
         FfQ3hI9dTn8zqFuOTGPnx6U+tSrqgZusQ76+KTnUNLGcfPdN6Io5C416PImexgFpSNOk
         RMGmeGDrWMnlSOjfTRuaSEtiu4VwoqKay8/vE27wRujVNeKFwC5S2S6nAXd4b03RemTS
         zjPmJ0GWBWj0kKLPxl+41TrcXvS4yrmTLh2ZnAqDmliSm0SOwIFBQ3Jf/q59sLYNgvZG
         SzJhAokbXbShCmhhSpBBNjA4LfsE+NOHXoMHx9oqyA1zLTFi7X2+cxPUlS1caNld1gY/
         bIAw==
X-Gm-Message-State: AGi0PuZpdrGcKhYZDgMETGEY+qkk3cgbni5TLu4kD/d9JQKswIpHxXQg
        g6k1M7E7uU81LkyChnlqcpHLIAqkyRVYNxfGEFLlng==
X-Google-Smtp-Source: APiQypKiCyts7MzkefeWjujl3cV78NyXFHt3/B3o4x2h5rbo4Zq9+NvNxI+RB7I5CfmK4X8tACMgZbIABjB/7I7y328=
X-Received: by 2002:aca:682:: with SMTP id 124mr496722oig.69.1586976804536;
 Wed, 15 Apr 2020 11:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200415150550.28156-1-nsaenzjulienne@suse.de> <20200415150550.28156-5-nsaenzjulienne@suse.de>
In-Reply-To: <20200415150550.28156-5-nsaenzjulienne@suse.de>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 15 Apr 2020 11:52:48 -0700
Message-ID: <CAGETcx9ewwOq3TRWorDf26HQzfQSd0KbtUT9AcoNnKpBwfuu+g@mail.gmail.com>
Subject: Re: [PATCH 4/4] of: property: Avoid linking devices with circular dependencies
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 15, 2020 at 8:06 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> When creating a consumer/supplier relationship between devices it's
> essential to make sure they aren't supplying each other creating a
> circular dependency.

Kinda correct. But fw_devlink is not just about optimizing probing.
It's also about ensuring sync_state() callbacks work correctly when
drivers are built as modules. And for that to work, circular
"SYNC_STATE_ONLY" device links are allowed. I've explained it in a bit
more detail here [1].

> Introduce a new function to check if such circular dependency exists
> between two device nodes and use it in of_link_to_phandle().
>
> Fixes: a3e1d1a7f5fc ("of: property: Add functional dependency link from DT bindings")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>
> NOTE:
>  I feel of_link_is_circular() is a little dense, and could benefit from
>  some abstraction/refactoring. That said, I'd rather get some feedback,
>  before spending time on it.

Good call :)

>  drivers/of/property.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 2c7978ef22be1..74a5190408c3b 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1171,6 +1171,44 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>         {}
>  };
>
> +/**
> + * of_link_is_circular - Make sure potential link isn't circular
> + *
> + * @sup_np: Supplier device
> + * @con_np: Consumer device
> + *
> + * This function checks if @sup_np's properties contain a reference to @con_np.
> + *
> + * Will return true if there's a circular dependency and false otherwise.
> + */
> +static bool of_link_is_circular(struct device_node *sup_np,
> +                               struct device_node *con_np)
> +{
> +       const struct supplier_bindings *s = of_supplier_bindings;
> +       struct device_node *tmp;
> +       bool matched = false;
> +       struct property *p;
> +       int i = 0;
> +
> +       for_each_property_of_node(sup_np, p) {
> +               while (!matched && s->parse_prop) {
> +                       while ((tmp = s->parse_prop(sup_np, p->name, i))) {
> +                               matched = true;
> +                               i++;
> +
> +                               if (tmp == con_np)
> +                                       return true;
> +                       }
> +                       i = 0;
> +                       s++;
> +               }
> +               s = of_supplier_bindings;
> +               matched = false;
> +       }
> +
> +       return false;
> +}

This only catches circular links made out of 2 devices. If we really
needed such a function that worked correctly to catch bigger
"circles", you'd need to recurse and it'll get super wasteful and
ugly.

Thankfully, device_link_add() already checks for circular dependencies
when we need it and it's much cheaper because the links are at a
device level and not examined at a property level.

Is this a real problem you are hitting with the Raspberry Pi 4's? If
so can you give an example in its DT where you are hitting this?

I'll have to NACK this patch for reasons mentioned above and in [1].
However, I think I have a solution that should work for what I'm
guessing is your real problem. But let me see the description of the
real scenario before I claim to have a solution.

-Saravana

[1] - https://lore.kernel.org/lkml/20191028220027.251605-1-saravanak@google.com/
