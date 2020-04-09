Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E346CC2BA19
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:04:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B50DF20678
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld/lxIkP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgDIRES (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:04:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44082 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgDIRES (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:04:18 -0400
Received: by mail-ot1-f68.google.com with SMTP id a49so11168525otc.11
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2020 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Od78lHji1R4oB8jriLMbIKkOcPwKQulsrlxEP1qy9W0=;
        b=ld/lxIkPFnngYXWsZtBos4iPMq3YReDzj9vr6Y2y1uLRBDVfqNe8fzPOXluun082US
         Hxb4IPYDGi5rgQM6E0o8+3OmknwQev9q9dXAbzr3dx1bmyo/Iy67zKZNZqbPKdmH0193
         pPIt2j0qCfzzstZPB193EDP7Wu5/pcYRnjLSl/80E9mFgnR2LtaOiJ7f4eTFh6AtoU/I
         tGAnrepAQlwfBuOEF5BoUumqxTk/dwEWKIdI6HOCiBAvtRmy9HvWRrRfcmk9c57wyJFJ
         ksePFFTnWAXd2f/oLGpXReHF1MkJmE3nbpQ5IMlc+gwKxZs6hYl9A9bguiMW06EysMVd
         wm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Od78lHji1R4oB8jriLMbIKkOcPwKQulsrlxEP1qy9W0=;
        b=n4Xn4kPWTXC+S8tDIr2K8XUJ6kTStIKNLS3HrzWDJK1Ktcab91At478fVA6IHtvgaR
         4mZXLPTtHSeGw0CXNmpQTGm+DvqJtsUGwX55iO/8+rdMlDevnDxJobIdegSYfhjm9Enr
         bOm7NKdZ8oh6iO0pLdUkCdKglX5O0QdYynJ/KSZ9gxprfgF8TTHaPfOC0zb75xau+4n3
         DJ36/Oedqfpa5TOv360k643EiGDB67crVhZYoQiATexP2J7rSXs9pRvQqfFnWEu4u8PG
         B6HwKbWOikyTTTPkQJ7KfNtNWYyKezADwA+M78HT2j2IVslZcuXFEapcGiFOQrt0S8Td
         bcHA==
X-Gm-Message-State: AGi0PuamdTao8XdMZzpRxGHt7BJqQJB78HGVVOP1ebJu0YOz0vHguzMZ
        MtcrfwdE9BPbYoen2+FzP4SkvN6Vjj4g31w6IR0=
X-Google-Smtp-Source: APiQypKzkt4m+gvrFrc8rZL36U4I6nKnZ9/zIgz5AmVm9KYpHKUbUzzAP7SBNtxJcv6sSwSsOixAmtnH10+Kaerq2pE=
X-Received: by 2002:a9d:895:: with SMTP id 21mr687256otf.365.1586451857851;
 Thu, 09 Apr 2020 10:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org> <20200408195109.32692-2-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-2-sam@ravnborg.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 9 Apr 2020 18:03:51 +0100
Message-ID: <CA+V-a8vHNNOSYH00zdJ2GextiMi_y_ZnzgP4Bqzv99aewkvd5w@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] dt-bindings: display: allow port and ports in panel-lvds
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Wed, Apr 8, 2020 at 10:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Both port and ports names may be used.
> port - for a single port
> ports - if there is more than one port in sub-nodes
>
> Fixes the following warning:
> advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
>
> advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
--Prabhakar

> ---
>  Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..f9132d50821c 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -102,6 +102,12 @@ required:
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +if:
> +  required:
> +    - port
> +else:
> +  required:
> +    - ports
>
>  ...
> --
> 2.20.1
>
