Return-Path: <SRS0=wYQk=7F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E6BC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 09:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CB8A2071C
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 09:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group header.b="lgkXbzQa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgEWJzp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 May 2020 05:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgEWJzo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 May 2020 05:55:44 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF64DC061A0E
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 02:55:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q2so15556561ljm.10
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMclQJeEjaTGzozjvCY7w7Tg3uKCjCaOAOe9Qm2vLDY=;
        b=lgkXbzQaxZ3ZdUqaKD/Vk8++aL4V1xQFTCGOMMlMS2FwW/36sWQqk2y3t+S+XOpMKp
         7r1yk9sbFiX+ulpxmh9DHFT5Pneh83/ip4//P9XuXtjMGRrDQHSCl5yQkVKtyJETvZtc
         ZQTl2rX9KncufYqrd9gMLzSRR986GZ2TN8LshEnx8DUVP5XP2DfT64ZqAxmzwqgH7SkK
         XCNpFncBj8GW+ardlqcljq3zWqd4Os26P8ApyLAxXFOk2OjJBSXP57EkIhhGOKNm4moz
         cfOo1QTQ9RslEQmBxNG9B4XsKYMxPgfITMSU0erivsNpMHquKv4CFLRJGyQHpcKt+cAu
         CB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMclQJeEjaTGzozjvCY7w7Tg3uKCjCaOAOe9Qm2vLDY=;
        b=bw5oHzUtw8qqsbWljCgSBu6Rnn6VzbmWiCsz46PSDIFFYLoPseZQtQdKMQ6dbv6//C
         DEm0WK1sRxiz8ludnpW8r6DbYjK6qsYM8Vu/TcYuQ+sUbPuVVju0V1YEH3C4MJ6YuVAF
         gBtc9wjT7RNLOTVcOI7l9HthZNrIShA0lnvDJ7Jo0dO7F0KkeLYJF57o7Lo6SzCWY4fT
         m+8KnVNIzErj45dq3jxxBI+LSPgdx1OvY4UthyfxVt2di4fA6e008Gt4UNq7y91sGxRU
         f1T+QiAVAK6P3dkcu4R9nZzVMt2fm+MEjdutgpVf2T28Yoz0RuEkf0wwqaogezt6zIw6
         49lQ==
X-Gm-Message-State: AOAM533JJr8eKrHPZnzdMaNWjwdtVODK0mTochSJTlAKDaxE9IZ3C4uc
        i8qofmYE7iLbt8mdxgkFF9WTymvtektY4NKDAqe5vQ==
X-Google-Smtp-Source: ABdhPJyWikAx3DmkIWIlzihQD50fVK6Jep9CtCjCkA+74uSibZApHsJ7HrlPDX3OHQ52a4Ly48BqBKXpN5ihKWU+NV0=
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr7901816ljc.375.1590227741126;
 Sat, 23 May 2020 02:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <1589963516-26703-1-git-send-email-fugang.duan@nxp.com> <1589963516-26703-2-git-send-email-fugang.duan@nxp.com>
In-Reply-To: <1589963516-26703-2-git-send-email-fugang.duan@nxp.com>
From:   "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date:   Sat, 23 May 2020 11:55:30 +0200
Message-ID: <CANh8QzxuHAu+L0swPC5V4Oca21Z5zpiULTm22VPShX_T-JVznQ@mail.gmail.com>
Subject: Re: [PATCH net 1/4] net: ethernet: fec: move GPR register offset and
 bit into DT
To:     Andy Duan <fugang.duan@nxp.com>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andy,

> Fixes: da722186f654(net: fec: set GPR bit on suspend by DT configuration)

Just a nitpick maybe but I don't really think this need as Fixes: tag.
That commit didn't actually *break* anything AFAIK.
It added WoL support for *some* SoCs that didn't have any in mainline
and didn't hurt the others.
Of course it turned out to be insufficient for the multiple FEC case
so this patch series is a welcome improvement.


>  struct fec_devinfo {
>         u32 quirks;
> -       u8 stop_gpr_reg;
> -       u8 stop_gpr_bit;
>  };

This structure has become redundant now that it only contains a single
u32 quirks field.
So we *could* go back to storing the quirks bitmask directly in
.driver_data as was done before.

It's a slight wastage to keep the, now unnecessary, indirection,
though the size impact is small
and it's only used at probe() time not on a hot path.

But switching back could be seen as code churn too...

I don't have a strong opinion on this, so just noting it to see what
others think.

Martin
