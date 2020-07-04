Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498F9C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 21:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23CDA2145D
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 21:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgGDVDd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 17:03:33 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33837 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbgGDVDd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 17:03:33 -0400
Received: by mail-oi1-f196.google.com with SMTP id e4so21054272oib.1;
        Sat, 04 Jul 2020 14:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yut0ecpXXGBYkNUyjPkKKir3ho9UA6fe0bH3wwD2YtA=;
        b=Ul2R6rBHhuiptR3avIjONjpZMjlODXr8gjSLjrT+iP3GMKpSEmQeX4mJSkawk5wqSu
         oA5BiFKi39m+YDMy6o0bViuJO2vCUuoNYbhXjMFg6//qS3s5uIEoak7pvZDzHepu5jLk
         XBV69PhjhiNbgBl/r4JOLsUkRm1DVRinctNlAYdTqMvsUjY/3504wTclF7nWYc/GSZyT
         VNxsvwKt9ki7+DTiSJjeHgpF7sCubteXQguoIOmpFtOPO7jv1yvVwCoIAz6gAe1TzQRw
         Wwip7rfGxRFUrI2b4im702hQ+S05Ph75fb+WD86j+gas7mFRQ7FERRiZqjqaLrn7Ez2X
         aEvw==
X-Gm-Message-State: AOAM5318tdZadz4FvFJR6edciafYfRBPdNPbiDlGo5nnuKEeD/YlT5h0
        HEiwxHpA/4zvGcu1g43dxZBtvOjvjLPetVMeYq0=
X-Google-Smtp-Source: ABdhPJyTCoq8/XCSR+AJg+1hDROJChzwPNMYZ5Lb1va9EPUV35YM2IZobwkleBvxakacYZY5XTsZ9MpukAzF2eKN250=
X-Received: by 2002:aca:1801:: with SMTP id h1mr26808470oih.148.1593896612172;
 Sat, 04 Jul 2020 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200704143544.789345-1-sam@ravnborg.org> <20200704143544.789345-2-sam@ravnborg.org>
In-Reply-To: <20200704143544.789345-2-sam@ravnborg.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 4 Jul 2020 23:03:21 +0200
Message-ID: <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

Thanks for your patch!

On Sat, Jul 4, 2020 at 4:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> Now that dt-extract-example gained support for using root nodes
> in examples, update the example for the simple-frambuffer binding to use it.

simple-framebuffer

> This gives us a better example and kill a long standing warning:
>
> simple-framebuffer.example.dts:23.16-39.11:
> Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
>
> Note: To get the update dt-extract-example execute:
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> @@ -152,28 +152,29 @@ additionalProperties: false
>
>  examples:
>    - |
> -    aliases {
> -      display0 = &lcdc0;

Why drop the aliases example?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
