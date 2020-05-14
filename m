Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD3BC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 07:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80D89206F1
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 07:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgENHcP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 03:32:15 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40345 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgENHcO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 03:32:14 -0400
Received: by mail-ot1-f68.google.com with SMTP id d26so1593080otc.7;
        Thu, 14 May 2020 00:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vhc1vPOe6XCEp9cAZAiq6WN1cflOAJVbZDflQFJ2vjQ=;
        b=JDB2sMytdCit1Mhi6CTKqqWI+CXqtp77Po/uyMf5zjfU+62LjR1MVfWNflNeZE81K/
         KcBao1vg71j8aLO4h5GaGia3wg992ZPXB32dHEHXH7nGZICZDNDalBe1u6IRNIiNhPHS
         JYEX4Il8ISQPWA2IB6pgXTSJyfx91XCRtvEjTKNAxocgVRnb3OwWY68E3Q6bxUK1xucu
         gu5iPbbsfkhxJ+2ul/fhRbv7IVk2+U+X75p7YFjmlORpNeHXLZXUzFtGtqzFCennzArH
         tJmBw3DcBHhCPBh3xUBv/F4is3F1wMlHxO6sB2eTmBWYHv3Q2WgD2AcjFw0/YAK1ZO6E
         VYvw==
X-Gm-Message-State: AOAM531SOkvf714tbkGfhU3sGcQEyWvIQ+gV+rAhVKeIYM7kN/SxmZK7
        Sk4FZ80h7PSfG1K1I9lDKgAJVmo+H/DUpgYI77A=
X-Google-Smtp-Source: ABdhPJyGBQa7yUxMaeUUyVrVubTEBO6u7aeAiflupj4yZkSBefIq/PXr26WIZz78ucQ0WiPzpHtHcVIgcxumEbzSbis=
X-Received: by 2002:a9d:564:: with SMTP id 91mr2543922otw.250.1589441534036;
 Thu, 14 May 2020 00:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com> <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 09:31:53 +0200
Message-ID: <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    lvds@feb90000 {
> +        compatible = "renesas,r8a7795-lvds";
> +        reg = <0 0xfeb90000 0 0x14>;

#{address,size}-cells = <1> for examples.
Applies to all nodes below, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
