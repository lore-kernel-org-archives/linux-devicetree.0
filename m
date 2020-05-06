Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F000FC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 07:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCDF720747
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 07:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgEFHoc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 03:44:32 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34924 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbgEFHob (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 03:44:31 -0400
Received: by mail-ot1-f68.google.com with SMTP id k110so633234otc.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 00:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+PZSdGjgBrO1ZN1QwTXyPWZrbqZlSLSFkTwxM8ooADM=;
        b=MCzBdptQ01mkeAp1Re2zdzp2vkjABocDEqhiCfbfVBQSssfZWS08UTjFLih0DK1j84
         /tBO4xxRU+TUdSwKKNPR6v0pTgWPB6kFm/FPWJMiveHaRj5QRwfClyjRrmRo5C7lpKSz
         Y3iMocfrZLlSuAouSRza34W5EpEWSvcBl1N0jibjOz/Ax+W15kEsv9UEXmemLu1IiZ+B
         kE76FOJsJlMEcNPZVBkUD/HqhgFvDRGuTqH4mu/AHSsJWi5TSyeNI+73gKoH/nhnKjkv
         3FCte0TiXSuFvz7rpHUVCE2fkuK+RPbqR3lOvGzaLm/uh57v4tyB37k8Xaui6CLZrK1E
         WC7Q==
X-Gm-Message-State: AGi0PuZetssLNvqzOU2grPw7plv8BH9BgENtPWwn2kKvdqFYp6EQ2Kxt
        9hf2gVbUE7JHEtzzjNJwUdkhjlWi3TGL9n/Y+j8=
X-Google-Smtp-Source: APiQypJ+4xFnHOiS2S+JNds3Xmz+4Kuk15I6/2b9iYq7lC5nwvlq/+iCHXAiNqEpGOfxXlsFFKlO5CbDC3CjtSH/Olk=
X-Received: by 2002:a9d:564:: with SMTP id 91mr5681994otw.250.1588751071000;
 Wed, 06 May 2020 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200501083227.10886-1-ricardo.canuelo@collabora.com> <20200501083227.10886-6-ricardo.canuelo@collabora.com>
In-Reply-To: <20200501083227.10886-6-ricardo.canuelo@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 May 2020 09:44:19 +0200
Message-ID: <CAMuHMdVbRoGAqeqePQDgRpxg4Vsr_LEfHERW-r6KdiSOCo5a6g@mail.gmail.com>
Subject: Re: [RFT PATCH 5/5] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On Fri, May 1, 2020 at 10:33 AM Ricardo Cañuelo
<ricardo.canuelo@collabora.com> wrote:
> Convert the ADV7511/11w/13/33/35 DT bindings to json-schema.
>
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
> @@ -0,0 +1,293 @@

> +  reg-names:
> +    description:
> +      Names of maps with programmable addresses. It can contain any map
> +      needing a non-default address.
> +    minItems: 1
> +    items:
> +      - const: main
> +      - const: edid
> +      - const: cec
> +      - const: packet

Can't you avoid the need for patches
[RFT PATCH 1/5] arm64: dts: draak: Reorder hdmi-encoder@39 reg and
reg-names properties
[RFT PATCH 2/5] ARM: dts: wheat: reorder reg and reg-names properties
in hdmi bridges

by using

    items:
      enum:
        - main
        - edid
        - cec
        - packet

instead?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
