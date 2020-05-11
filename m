Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EECAC54E8D
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EFB52082E
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgEKLwi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:52:38 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39568 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgEKLwi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 07:52:38 -0400
Received: by mail-ot1-f66.google.com with SMTP id m13so7272940otf.6
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3SLivmoLEe5zdWLeW28Uage4wLxjeHXZBhIuDc+h5/Q=;
        b=Lq/3ZVT43moPqR46CFGzTdAkdtvUBWiXbnWpLfJ11gSIPNY+HSghJJnWxYlDQF4ZMY
         h5Wmfv1yh3RxLQzOYFxVV2uj/6Wme4+365JKT9RAV1XmgcOeqAxChA+iILZEqz7oi87i
         pZoR5upSR8XdwEKg5f8jJrCqQSPGMfREkfMEe6g7C7AZQu9U6IbujLPM0djaWC1lDqWU
         jJSGLSZ4cwANKriowi+fEeLfL3y4EfEoKLsXs6UKrsrATaZ4M9Yp6kDzD5F3wp4gqE+m
         ex6iTZkRukl8uP2AiB4PQJpqkwSnKYzf/aO6xtNTDY0/t3l5Av071V+oaf20cT0qOcXI
         OLBw==
X-Gm-Message-State: AGi0PubppqrQwDc3k/gFtFJ4MdpoIQL90P91/t6FmQR6KD3zbEI2gz8U
        BCcVCRIXJkVBW5dbZSakXaSBxgnPoNQEKlmPdn/c5ZNj
X-Google-Smtp-Source: APiQypI4+FXDKpb/c9jajM3DN3Ek8OlUzwUew05RswarCvWnvBS55EVKeAu6kK8PN2MakdlVtuYA29onwizfCx9aG+c=
X-Received: by 2002:a9d:564:: with SMTP id 91mr12335404otw.250.1589197957711;
 Mon, 11 May 2020 04:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com> <20200511110611.3142-6-ricardo.canuelo@collabora.com>
In-Reply-To: <20200511110611.3142-6-ricardo.canuelo@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 13:52:16 +0200
Message-ID: <CAMuHMdX=3O33nqPGNr+nU874w_FJ8fgiKnkxKfqq8NR8wd+iYA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ARM: dts: iwg20d-q7-dbcm-ca: remove unneeded
 properties in hdmi@39
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

On Mon, May 11, 2020 at 1:06 PM Ricardo Cañuelo
<ricardo.canuelo@collabora.com> wrote:
> Remove the adi,input-style and adi,input-justification properties of
> hdmi@39 to make it compliant with the "adi,adv7511w" DT binding.
>
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
