Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C87C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 21:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8D482084D
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 21:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VFaWU9eg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfKTVa1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 16:30:27 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41741 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfKTVa1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 16:30:27 -0500
Received: by mail-ot1-f67.google.com with SMTP id 94so954188oty.8
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 13:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nUDu8pQZs8u4Dn19/rZi/JgFr5hx8f/ET+blpc5+y7Y=;
        b=VFaWU9egorIKHZTBFjI5Fwdj0smrWgFszEVzB7Ip0fjbadB9C0CyXHESHz1qSsZVOz
         F+0J1zvICdKoskSyLaOzB4f/6y05Zaf3boy2QfRyMQmqugTghGWVoZD0pTv0qeEy1x5R
         7YaKDC6RVWnKR8CbISJvBNRSlUEE+9fgdUYmDIZ02pAoqGP/01eTysTN3C4bczgnpStI
         um+mxvQso3f2pn9Bs8WwOFgNiAbRZKwT8PtDbNEFC2MaD1pA1gIMdRyNU7whc1JWzr5y
         i0hKDRzZ741z+p4EY+PhwOJnHkfXE3Nryq/vaTPTFOsQwXoRdkAWAOvKHlAtNxFxO9ti
         v1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nUDu8pQZs8u4Dn19/rZi/JgFr5hx8f/ET+blpc5+y7Y=;
        b=A2HKJUrUsrdAqAIIYxCrhOqJUCJH14G7XtBeggGwtyWTmX6xUWIEOz+7MURdLG/iKz
         jNsAqPHHSBkKXSF7ZmaLKDTUrk9RRjuKTTLcjulrqgK0tn5z0dHMMbYQo9ebDrIiu4jS
         Q5h0VuziOZB2PHAtX5dpwv1d0qVbOXZ0Ts+KBxZTPuWCmNbGX0RGp9La2yPwZH9BwFCh
         qkYr+kTRJi6wJXYbwcL0w7wxA3poEU90gQzlZOmjGsn/iYSNCt2YiQWCs8d9H7gzhFkl
         ZO/scwGK77K4dJgqRo1aYOSZfs1joCNWFJxA7O2dJL/4ZKJFIZur8wi8bJtDVbPF0kZD
         udgg==
X-Gm-Message-State: APjAAAW2sKoiqoDIumHggbangJDGWns9+lU0bnBYGuyniNveW4UJrhud
        bUS0BY1WyCCTxJnntFJFy9is8+ASI9ClyPlk19pmp7RnSWU=
X-Google-Smtp-Source: APXvYqygFo11WYxCVP+Ff0HIEHLO15X3S5vxH+0fAs3zZpM3s/nSMwLje5GuocvH+GT3Ivkku9sYRuYHvwwpTD5ONKc=
X-Received: by 2002:a9d:648f:: with SMTP id g15mr3780959otl.195.1574285425773;
 Wed, 20 Nov 2019 13:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20191120190028.4722-1-will@kernel.org>
In-Reply-To: <20191120190028.4722-1-will@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 20 Nov 2019 13:29:49 -0800
Message-ID: <CAGETcx-b+cyzPwfJVKkPzaaDrYNy+gjTTcMZ0MBxBPC2EsVVzQ@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for "iommu-map"
To:     Will Deacon <will@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, iommu@lists.linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 20, 2019 at 11:00 AM Will Deacon <will@kernel.org> wrote:
>
> Commit 8e12257dead7 ("of: property: Add device link support for iommus,
> mboxes and io-channels") added device link support for IOMMU linkages
> described using the "iommus" property. For PCI devices, this property
> is not present and instead the "iommu-map" property is used on the host
> bridge node to map the endpoint RequesterIDs to their corresponding
> IOMMU instance.
>
> Add support for "iommu-map" to the device link supplier bindings so that
> probing of PCI devices can be deferred until after the IOMMU is
> available.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>
> Applies against driver-core/driver-core-next.
> Tested on AMD Seattle (arm64).
>
>  drivers/of/property.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 0fa04692e3cc..37e0d408430d 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1190,10 +1190,20 @@ DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
>  DEFINE_SIMPLE_PROP(io_channels, "io-channel", "#io-channel-cells")
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>
> +static struct device_node *parse_iommu_maps(struct device_node *np,
> +                                           const char *prop_name, int index)
> +{
> +       if (strcmp(prop_name, "iommu-map"))
> +               return NULL;
> +
> +       return of_parse_phandle(np, prop_name, (index * 4) + 1);
> +}
> +
>  static const struct supplier_bindings of_supplier_bindings[] = {
>         { .parse_prop = parse_clocks, },
>         { .parse_prop = parse_interconnects, },
>         { .parse_prop = parse_iommus, },
> +       { .parse_prop = parse_iommu_maps, },
>         { .parse_prop = parse_mboxes, },
>         { .parse_prop = parse_io_channels, },
>         { .parse_prop = parse_regulators, },

Heh... a lot smaller than I thought this would be.

Acked-by: Saravana Kannan <saravanak@google.com>

-Saravana
