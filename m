Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51881C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 11:22:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ACE32053B
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 11:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/bNMMik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgEZLWa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 07:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgEZLWa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 07:22:30 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A357C03E97E
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 04:22:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v16so24028548ljc.8
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJxI8q9GaxwusSxiN1TRl1t50DLCSayUphT+bXOuVqA=;
        b=M/bNMMikN5rlMrwQqf4wuwwbofYB2P7B1TVibatvt8DV12qC0t3WfTLDIKYPPVaVAr
         A/f3VdlkZ0uoLoIgysMyIpfF1UG/ANS6qt1mUuG29T5Cl6mAeNoOyvzUKOdJJ8uA7giL
         qD7sfjXYbwg4iSJN5ZIRmUBWa2wlbl+Ugvxjeg5ss11qHAsmn25CwI7z6ncTNoh9NJiX
         0sxAbxzSMgfnDrVk5m4SNa5jHt3jgGyiccSWLvURNhA4j4SyZORWhck4vjMgfFGv2a5b
         rPWOMAmALGAVvuNt8rbuXWXGHACZGW4c1S+jz+mgm5NHSXQm2562P12Dnu85ptTxZS39
         9eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJxI8q9GaxwusSxiN1TRl1t50DLCSayUphT+bXOuVqA=;
        b=AaW91ahP/+9Ffbu6BaNf3AwzAKZbT6uElVLmvmrp0WGj2rdQ8BCQvZglymLmO89ncA
         LoQozNt8vjgTnR46BHSthD8B2JyHIk0csPik7Lay4o6ySOBKzAjtl3JpLJqbWzPycl0Y
         3iMotFs7wu8bI872oDOrcJ0D2yyHlpqQpbzJFwDYnZzldQlqwCh/hKEhRH2xAm00uIkH
         bCYZ+KReprfwG0aJAY7AVOeqYZFdkm4XH1gcFjFV7q9tiikQPIjte5FmvNoBa/ykrwDW
         gM0MsNbC2r622Y7KnS4nbbMH5e1GK9fP+Bc+Y4qu7rIVBi5zyScNI9tMy26VXMBbPM+q
         Kppg==
X-Gm-Message-State: AOAM530ijsn1JTxEjaLAoLcuJcNFj8VU3bclf3JFZ+G4aTrnfHHBJ/Ry
        Oqg7TDGPrP/TUF6X9PvQKjoIvf9nh8V58jBSKMXjIA==
X-Google-Smtp-Source: ABdhPJzdhwywLZUu1iioOyV4RjM5M1Epk+nZBmMIV652Jit18mFH9boEqTDc5xdPxLb/F7xuG/+hRyaxUu9GK3c0+oc=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr384158ljc.104.1590492148520;
 Tue, 26 May 2020 04:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200513212451.1919013-1-megous@megous.com> <20200513212451.1919013-3-megous@megous.com>
In-Reply-To: <20200513212451.1919013-3-megous@megous.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 May 2020 13:22:17 +0200
Message-ID: <CACRpkdbb0Y32EG=tEx208eUh_CJndvnQGQvAnF_mG29Hd9-2Jg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: panel: Add binding for Xingbangda
 XBD599 panel
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi <linux-sunxi@googlegroups.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Samuel Holland <samuel@sholland.org>,
        Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
        Bhushan Shah <bshah@kde.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:24 PM Ondrej Jirman <megous@megous.com> wrote:

> From: Icenowy Zheng <icenowy@aosc.io>
>
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel. It is based on
> Sitronix ST7703 LCD controller.
>
> Add its device tree binding.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
