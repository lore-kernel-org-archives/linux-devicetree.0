Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746D7C54E8D
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5295820735
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgEKLvY convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:51:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44869 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgEKLvX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 07:51:23 -0400
Received: by mail-oi1-f195.google.com with SMTP id a2so14602531oia.11
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hW15TcE71gsbBVg2kI12Ssrf3EfANmSXapsfwYoYaWc=;
        b=JDAPzZcuVrDUv5S8c0GUsq0D5mO1yvP345SU4TpRCF2HFPYzsZhSyYjsHez/IIKj4L
         XcBlEW+xBZvlkWLZhGkmIirCZeLlq7bIYSEVYQ8Ch/hfBYIeAOTsHgH9fsO7xh3c13nH
         96aIJroq8u3Vpm+/R2E8JhzKYfOfJ0lH+BxA0DKi4aPlkkEUxJqUxpleHvnwRvOqohFZ
         G3px4r8sqvyEl9bKo2clLQPn9rDTdYixehS8P0w3MoCEz3MIVP2D35HJWGp2fXGgd3kY
         tkgp3EnjPuaRFQQXtz5iSNeLYfeCBYbxUsX8ISrsKjbCS4cRKHejjh6EefzQ4LXOH7pO
         TF3w==
X-Gm-Message-State: AGi0PubRQEhBn9Is5UjTo6yUfIHxMztqJRJq0xTdgakpdwmc5MAhXYpq
        5htM/O7LhFa+8xxbQtettD69GaATu+DzpcTk9grq9p8P
X-Google-Smtp-Source: APiQypKKcWumoCx2WrwMXDUmLXShQe901ZvBEln7LKgQn/MOfam8b34IDER5Z2sdGj3EDQn4lHOKNZD6Owo1e3vGSUg=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr19429336oig.54.1589197882858;
 Mon, 11 May 2020 04:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com> <20200511110611.3142-2-ricardo.canuelo@collabora.com>
In-Reply-To: <20200511110611.3142-2-ricardo.canuelo@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 13:51:10 +0200
Message-ID: <CAMuHMdU8++E88TSWd1KJMd_9JzbTY9EjPpCD_zP7r+Tq++h4aw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: renesas: make hdmi encoder nodes
 compliant with DT bindings
To:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 11, 2020 at 1:06 PM Ricardo Cañuelo
<ricardo.canuelo@collabora.com> wrote:
> Small fixes to make these DTs compliant with the adi,adv7511w binding.
>
> r8a77970-eagle.dts,
> r8a77970-v3msk.dts,
> r8a77980-condor.dts,
> r8a77980-v3hsk.dts,
> r8a77990-ebisu.dts:
>   remove the adi,input-style and adi,input-justification properties.
>
> r8a77995-draak.dts:
>   Reorder the I2C slave addresses of the hdmi-encoder@39 node and remove
>   the adi,input-style and adi,input-justification properties.
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
