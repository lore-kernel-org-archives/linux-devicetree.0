Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880EAC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 07:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6883C206D7
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 07:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgFRHjY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 03:39:24 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43296 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgFRHjY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 03:39:24 -0400
Received: by mail-oi1-f194.google.com with SMTP id j189so4219548oih.10;
        Thu, 18 Jun 2020 00:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPQ/PH3aH+rlKhf78bS3JYd7KhJYAAclpBwrav1LP0c=;
        b=soRpjfKFJcDkBxNZ2kQMdeOKZfbNgFVG/CQsafxGrA7Xzv0L3sMpXHWDXSGsglREXD
         Tk9lyDm0K16qXH43QKzMX09febfi0DSVici+jvjo6TT0jZLOc2BhzXZR2V+tFCV+BvuX
         wIxIiekEFlLNqwbD6exG5grFUFc3oe7pqxEdn3H2mTpMInFiHvYS6SW3LY3dAr6PZ20Z
         UJFWRUpINkt9F3kqh81mcWp4p1/B4sBYfuVdAuEcK5/bnh04YpSwhoW2bowPszQZ7ZHb
         wVceamBQ8kwFaCoqghtH8xZvPuJ/qLTVl9mDM6AsQa/jbZXPZZ4ZH2UZUG0sF96S233C
         KzCQ==
X-Gm-Message-State: AOAM532ordZOa9ljWFVxkP8RsSDCXyoru0VTuVXHZJxitXpJO2FtZs/e
        66i0Mo+IK1Rwb86wrZqcqjeGNSNVGMLi2hI00jU=
X-Google-Smtp-Source: ABdhPJy4yUnPGoDLOCCQPH7S491o6IyHC9WENjbj4u6y5OalCmoE+8y/bCOTmagHYhARE+BM4ZATmE0eAZ6ulNI3An4=
X-Received: by 2002:aca:849:: with SMTP id 70mr1816387oii.153.1592465963424;
 Thu, 18 Jun 2020 00:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1591873830-10128-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1591873830-10128-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Jun 2020 09:39:12 +0200
Message-ID: <CAMuHMdUnwgYhVo0jjRcHrmnOFi3Dokdu6cL26=mQ7DudS5+QZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 11, 2020 at 1:11 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
