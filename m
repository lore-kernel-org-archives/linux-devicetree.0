Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0474FC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 18:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D356B20771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 18:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bcz9vjeh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441539AbgDOSbE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 14:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2441537AbgDOSbC (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 14:31:02 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2405FC061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 11:31:02 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id w12so820230otm.13
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZCiUgJFvPYQffrkq2hLqqmw10BzmnNA9GscyWbcJnvg=;
        b=Bcz9vjehVkpc7YfuPVUBPSsKuX/Me5oeBVM060ehehGuLdK2wh7e6RMdlyzKSWrJL2
         5Mz+JzaZIgvuC7e78i8lm5VwYMbi5Z6IUD7z9GiG1lWS6PkiLCL4DwJz/zj3lNc+t9oQ
         vBm/BcBbmeiDHvrOusFuAV6to5xgTBzRQBoXiFmdjfwLJLj4P09C26c42PodCciQElC+
         C2oXhESD+JZGtJke0MB41yZOeUzM+QnGMF3JSgCOFRn9nXU5GMDRrnrkc0JAl8veEvgK
         nuQTAInNNEKjYU8F6rQqRYQXTeAC8HEoD3qBRn0e85MqyDqFgFOxMhHGB22iCcR5x8Q+
         2LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCiUgJFvPYQffrkq2hLqqmw10BzmnNA9GscyWbcJnvg=;
        b=D6c3FxIpLa0U7UOkfkFHsvuSBW1Cxi26GI41qxXb+o0HQTK5fNATuoBoJE4kr5l5fw
         hO6sdBITVuIiLweYfnEHgMD6xsCA2GPppERaau0TJK9lD2BZ8zjRD9qstFoyFmPainRi
         HcMtUcrEtrfuVR3itw5twPeaJC9YP3WXy4QOI25IUU6AcbPz1QEUNau2AqSwRelkf5u3
         rzTVpI2/9sBjKEqVYwBlsi9waC+ek07Buumv0zBYyM5NP1frQL7OHGxYiiFahojmUnBO
         WWO/6iHitGmryDCQl5jeNWs4oYliCmWXONjj/9wNOBXG23OYIlwcI2W9yiikaisHIMQB
         JnTw==
X-Gm-Message-State: AGi0PuYzXpelQ0E7eV1ejt+eCU66wzEhCjGa/z41ErU1+3qL2G40SZXy
        6z4XfU+ISyraeoKDdCoPJ2OAwmzaK1UB0WvkF+JpRQ==
X-Google-Smtp-Source: APiQypJvtPcCx/tBD9gI9PtOPP0YfPcYip9gdx/22xEr/CHgbeh0BbuoMJjCQI76YGgSOFVNtpHekGMVyBNYEruPGYM=
X-Received: by 2002:a9d:4c91:: with SMTP id m17mr17986511otf.139.1586975461007;
 Wed, 15 Apr 2020 11:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200415150550.28156-1-nsaenzjulienne@suse.de> <20200415150550.28156-3-nsaenzjulienne@suse.de>
In-Reply-To: <20200415150550.28156-3-nsaenzjulienne@suse.de>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 15 Apr 2020 11:30:25 -0700
Message-ID: <CAGETcx_7cTp0zx2hfGX0X=NpudkAjER8YeLMmRxTEtoqxc0pFw@mail.gmail.com>
Subject: Re: [PATCH 2/4] of: property: Do not link to disabled devices
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
> When creating a consumer/supplier relationship between two devices, make
> sure the supplier node is actually active. Otherwise this will create a
> device link that will never be fulfilled. This, in the worst case
> scenario, will hang the system during boot.
>
> Note that, in practice, the fact that a device-tree represented
> consumer/supplier relationship isn't fulfilled will not prevent devices
> from successfully probing.
>
> Fixes: a3e1d1a7f5fc ("of: property: Add functional dependency link from DT bindings")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  drivers/of/property.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index a8c2b13521b27..487685ff8bb19 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1052,6 +1052,13 @@ static int of_link_to_phandle(struct device *dev, struct device_node *sup_np,
>                 return -ENODEV;
>         }
>
> +       /* Don't allow linking a device node as consumer of a disabled node */
> +       if (!of_device_is_available(sup_np)) {
> +               dev_dbg(dev, "Not linking to %pOFP - Not available\n", sup_np);
> +               of_node_put(sup_np);
> +               return -ENODEV;
> +       }
> +

Again, surprised I haven't hit this situation with the number of
disabled devices I have.

The idea is right, but the implementation can be better. I think this
check needs to be the first check after the of_node_get(sup_np) --
before we do any of the "walk up to find the device" part.

Otherwise, you could have a supplier device (the one with compatible
prop) that's available with a child node that's disabled. And the
phandle could be pointing to that disabled child node. If you don't do
this as the first check, you might still try to form a pointless
device link. It won't affect probing (because the actual struct device
will probe) but it's still a pointless device link and a pointless
delay in probing, etc.

-Saravana
