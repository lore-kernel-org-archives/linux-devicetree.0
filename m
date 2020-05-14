Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3ECC433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 06:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89E63205CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 06:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgENGoe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 02:44:34 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34656 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgENGod (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 02:44:33 -0400
Received: by mail-ot1-f65.google.com with SMTP id 72so1544052otu.1;
        Wed, 13 May 2020 23:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g1s0XB9H+uh7sdHu3xSmDUQrpxyudnsMCE9Ul5AyP3g=;
        b=KS01b5AaAll2DmFZwUvAZTomU2sPogC4LVtVqM8Qxeq/WJxi5RaPoflRvzBG2yaXoj
         a2HPDDMBAAVQTDO1hIPVjW/8SY1YXZvJIBKVMOvhVpqDpA/OLQFd0MeMBpkMp0tRayXp
         qxHo6ezvNP067bOd+XYP+N6sTOj+rpkNvbTHAjXV7U+ds3xIx93jOhN3BvnONOPchekR
         MPM5Vdr4FXKOHOVk+1lVQljEtFjroWs8q8q8V4dMO8FUBxveuWDF/fpRmlFPRHM9tMsW
         9jsWItRgxOMb3RvaFmwD6iDzkL5IO3xjKnzQg71dY5pxh4rfulTq5UHiuYQr7+sKmgM9
         EVbw==
X-Gm-Message-State: AOAM530G4Lwp6dMsNTjEGu30HvbEI4w6MoK2NHiGzQzu0s15EZdpOzIl
        FnA2a6OKvpbsgN5VYQsFMnQiFVSJlb3SY2PsiqM=
X-Google-Smtp-Source: ABdhPJx5VgiH2lgK0AW+wxYBnbzZDA7oqs3hGnSiQ28a5Q5TwOi3q+2ndSDzKIx6x4YhkjH5tlwRaRC9RY+atYYrLv0=
X-Received: by 2002:a9d:564:: with SMTP id 91mr2434708otw.250.1589438671372;
 Wed, 13 May 2020 23:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com> <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 08:44:19 +0200
Message-ID: <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
Subject: Re: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs
 renesas,companion too
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 1:39 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Document RZ/G2E support for property renesas,companion.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -81,9 +81,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        phandle to the companion LVDS encoder. This property is mandatory
> -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> -      the second encoder to be used as a companion in dual-link mode. It
> -      shall not be set for any other LVDS encoder.
> +      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall

R-Car D3 and E3, and RZ/G2E SoCs

> +      point to the second encoder to be used as a companion in dual-link mode.
> +      It shall not be set for any other LVDS encoder.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
