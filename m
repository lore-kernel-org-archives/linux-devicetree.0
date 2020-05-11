Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDF5C54E4B
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AF8F2082E
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgEKLz7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:55:59 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34073 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729688AbgEKLz7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 07:55:59 -0400
Received: by mail-oi1-f195.google.com with SMTP id c12so13816334oic.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TAUhuuX1kMVrb7rdeT0m6iZG1AO2eOiW1S5bAIpTs0Q=;
        b=T76KEAyhyVIWfe+SrpBXLGNzKPbWkAOycCW8gnhxNNjToVNaJXOybbeTdEdBRblKmG
         ynwtI3g3taYt9rf09c8Cjkkf7vA+61A6kthRtcuEE7wkKuGEg7bx2RGjazGNBDHkmae0
         XztbdEsbr/4A2NH0g8pTOCpjsywtu66HwjtmHc+vMnGRt7iADYOukvrUzk/lTg4LfQzg
         Rhfpu5LFDNEufAdgUHccvcyBWon+wnvQz9vFzM4iB41R95osTvbWWmiKfvBGE8T3nj1P
         SLybLj9skSlpywpKNe9n9VVyrwl8YaqXMcUXkcw/dbdhVOnUfHDSHlv3WRkZucfxs/kz
         MfSg==
X-Gm-Message-State: AGi0PuYU+iAei3sGMRjx+VkyCM9KbRv8dLhTHDk2oybFO11WPIkCI+Dm
        26KWVPVzdQUb09RjIfgPM1R3cFPZxXAOP6AthQY=
X-Google-Smtp-Source: APiQypKOd8bZGDBI1ZQgvyEvgHSBubS1W5azF989KZ2zDHB3SY7QFg5VTKzm4vesSlfv+3bfpytS2jjR75nDc3qCMp4=
X-Received: by 2002:aca:895:: with SMTP id 143mr18608955oii.153.1589198158548;
 Mon, 11 May 2020 04:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
In-Reply-To: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 13:55:47 +0200
Message-ID: <CAMuHMdXuMMRwbU=NrmGqXJ7DYzXpS1v+yM1ngPSZJdRZForPHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Convert adi,adv7511.txt DT bindings to yaml
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

On Mon, May 11, 2020 at 1:06 PM Ricardo Cañuelo
<ricardo.canuelo@collabora.com> wrote:
> This series convert the adi,adv7511.txt DT bindings to json-schema. As a
> result of the conversion some dts files needed to be updated.
>
> The changes to the dts files are of three types:
>
>   - Reordering of the I2C slave addresses list of the ADV75xx node. The
>     addresses in the 'reg' property and the matching names in
>     'reg-names' for an I2C slave don't need to be in any particular
>     order, but the DT schema defines these properties as a cell array
>     and a string array respectively, which are ordered, so the
>     definitions in the dts files must match the order in the binding.
>
>   - Filling the minimum binding requirements. Most of the time this
>     means creating a 'ports' node in the boards that don't define
>     them. Note, however, that the purpose of this is simply to make the
>     definition compliant with the binding. I didn't define any endpoints
>     for the ports.
>
>   - Removing unneeded properties.
>
> About the binding conversion:
>
>   - The original binding covered five different devices: ADV7511,
>     ADV7511W, ADV7513, ADV7533 and ADV7535. They all share a common set
>     of properties but ADV7533 and ADV7535 have enough differences from
>     the rest to warrant their own binding file. In v1 I modelled all the
>     properties constraints for all five devices in a single file but it
>     turned out a bit too complex. Splitting the binding into one for
>     ADV7511/11W/13 and another for ADV7533/35 makes them much easier to
>     read and maintain.

Thanks for your series!

> Patches 1/6 to 5/6 contain the dts changes. Patch 6/6 contains the
> binding conversion.

If the binding conversion is accepted, I can queue the below in
renesas-fix-for-v5.7, to avoid the conversion introducing a regression.

>   arm64: dts: renesas: make hdmi encoder nodes compliant with DT
>     bindings
>   ARM: dts: renesas: make hdmi encoder nodes compliant with DT bindings
>   ARM: dts: iwg20d-q7-dbcm-ca: remove unneeded properties in hdmi@39

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
