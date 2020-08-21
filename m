Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBECC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 10:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE9AB20738
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 10:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXZJddLs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgHUKjz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 06:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbgHUKfg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 06:35:36 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D64C061387
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 03:35:36 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z18so1199499otk.6
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EfdWudG0h0q5CaIQdMWXtuPOgO5LF8y0CpSBc1t8Vmo=;
        b=lXZJddLsySTWLGE+UKv+3I86NhQqIIkV25M4nrFxsyNqk9bRGqRcr/4gkY5vkypS3r
         wOPaCUxWj0gLJv835VT/xORv9cX8tCUo6OPSPVTSyJeHT2tLG5KU8SaeHkzuAU8g9g3P
         sB8dCJJ+xxPfWuX2xnQJgFAjw346ICZ01pnVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfdWudG0h0q5CaIQdMWXtuPOgO5LF8y0CpSBc1t8Vmo=;
        b=ZHLaLKgG7AlF+HShH6hcv/mCuaLL+e/FQu3yXwr+25xP5WnJiX7O2GvS0J1VqqkLQQ
         Daw2m2FFkHCZMz6i2zrNVcNjTpdwXGtLQ1UF4nzi0m8ip0Fgo5Sln2R5SY4wKuO2OfhH
         AC8i2eJU0lmqz0uGqN31dHFKBBIzp1fLnvIZkluJAjJc/C1u0PvQ7Ghne3InVc8HXQCi
         l287SBthPRUkTalF6arUUkduAY3L4tdYHz7Bhr3evQBE1ObqWYcKkPdPwis30NIMVGH9
         tOqozY+QMGeTFdKVkhs9Ijlj4vsZLMHWv/fTURmcf1vSc7++bR/JvMqE0LD8ILdHoHSX
         quTg==
X-Gm-Message-State: AOAM533it7PxOx6FzRIKUMeHg2sGGpUKHGO1cjc+Cm7MIm3R97SEpB0u
        0Ds4Dyd0GyJVjPz5I1s4XJvSBzOYeH+gXjJL
X-Google-Smtp-Source: ABdhPJyWliIMoQ+JFBknHZtLw/GYOITrv9dEBXzHiyV4oc2XLd/TRY/V4dXZigb2cQOCfc0ru5/wlg==
X-Received: by 2002:a9d:3bf7:: with SMTP id k110mr1482725otc.11.1598006132945;
        Fri, 21 Aug 2020 03:35:32 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 102sm297019oth.3.2020.08.21.03.35.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 03:35:32 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id e6so1132956oii.4
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 03:35:31 -0700 (PDT)
X-Received: by 2002:a05:6808:196:: with SMTP id w22mr1229658oic.55.1598006131352;
 Fri, 21 Aug 2020 03:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org> <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
In-Reply-To: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 21 Aug 2020 19:35:20 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXZ4WoRcdpO42RAbBJZGdWteE76=jMM2HjTfMukUYf4Qg@mail.gmail.com>
Message-ID: <CAPBb6MXZ4WoRcdpO42RAbBJZGdWteE76=jMM2HjTfMukUYf4Qg@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 13, 2020 at 3:20 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> On Mon, Jul 13, 2020 at 2:09 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > The mediatek codecs can use either the VPU or the SCP as their interface
> > to firmware. Reflect this in the DT bindings.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index b6b5dde6abd8..7aef0a4fe207 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -19,7 +19,9 @@ Required properties:
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > -- mediatek,vpu : the node of video processor unit
> > +One of the two following nodes:
> > +- mediatek,vpu : the node of the video processor unit, if using VPU.
> > +- mediatek,scp : the noode of the SCP unit, if using SCP.
>
>                          ^ typo / extra o

Fixed, thanks!
