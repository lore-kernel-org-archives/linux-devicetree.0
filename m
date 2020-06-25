Return-Path: <SRS0=bF7C=AG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B783C433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 05:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 176B520720
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 05:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLPjaUmV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389749AbgFYFrj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 25 Jun 2020 01:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389549AbgFYFrb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 25 Jun 2020 01:47:31 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EF3C061795
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2020 22:47:31 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id q69so1122795vkq.10
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2020 22:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Pyf0GGvFVlXsdDyV6XIIzdPqN+R0eNNqJvFwUcTnuQ=;
        b=NLPjaUmVWEdwr3ufy0pJAdyTKWHhcA1I+POUG5D6lz7Y0eAuoVUFJuP4weZ7N3WzeN
         /yMrWQVRvJ0+rlA33aFwLrpB6T9yHLqO4XbTVCGg3WUEOEsLpT6L/uw0j/K8gSfEDnn8
         ECvwrH3hOzi4tUJGMu2axZLXlpxBvo44/cGf+qh1p7SWDj3GdGe8NvlWunaErT+TpKeA
         BaasQKGPxAW3VzxEtaKA9unVB7PFKUmlBqRM7M4qvPwLC3AKzrXan6a1OunMe3nZC96w
         rUL+XgxmyOnm3aHp48j4SZlESnDm+LttG+OSry6PTWJAjvIn2R8/6PPYvGFMCseYF0yk
         WLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Pyf0GGvFVlXsdDyV6XIIzdPqN+R0eNNqJvFwUcTnuQ=;
        b=UcaSG5RBH/Ih7ZpMVg/pMEGvtRkSX9JetXKAHkftq73f0vW6ZlLVqqVB+Il3VAVKtC
         1TGDJKeJKshzUZfKwZgme/Z0P5kBJ3PaxbYBMgVs+srFGcNiBysD/92Dj86ubrYl+Chu
         vqqd6pfW/C9FpaiOAF9Wr9qAWpcjBEMwGoeN+4id0GwCWzS7ap6OKkzvSbEi+gzHPOU5
         zh0vpM6HFgJrAahKnlUQ95I7XfRMNUMu1aIw2z9x2Tro4NsqWOYb+9hAJn8NerQISIZt
         4BxJPgE90i6RErZCps0fmJS2sgIx2hwixQmGgo0kfJI0JedxOfZWARPU1d1n1S1h4nme
         sDIQ==
X-Gm-Message-State: AOAM5308+gSPMnryKLcnG8F0/ueNCtFQXGW94s3Ljr6nqOOPD2QXJy9o
        8WI1jYXPdM5TWo6s/Ed756qPLJk2JB2l7Jmb1ZOKmg==
X-Google-Smtp-Source: ABdhPJz29/gwxTOnUa+6XWgaPKMFCENul0uiekbDYgqPdKvRSaVgk4wq5FPQsyia16fNAO7d1Z4wSbTgFy8RGO5Xeqc=
X-Received: by 2002:a1f:d783:: with SMTP id o125mr26144467vkg.46.1593064050335;
 Wed, 24 Jun 2020 22:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200623180832.254163-1-konradybcio@gmail.com>
 <20200623180832.254163-4-konradybcio@gmail.com> <CAHLCerOAM5j+gZWP9MUuGZ+TQfBg4Z=GoEdUfxBTwtEs5TqUuw@mail.gmail.com>
 <CAMS8qEUT+Kdq-gqZn25X7W2V8HacuXFbeoTDz=N7C7MNpSfOHA@mail.gmail.com>
In-Reply-To: <CAMS8qEUT+Kdq-gqZn25X7W2V8HacuXFbeoTDz=N7C7MNpSfOHA@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 25 Jun 2020 11:17:19 +0530
Message-ID: <CAHLCerPOwO1JHUtb33fFkBH9wAT6Ty4E4GxbHNvbEkwr2SOvuw@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sdm630: Add tsens node
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 24, 2020 at 8:32 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Interesting, the downstream DTS only mentions the 0x010AD one..
> Are you sure you're not looking at 636/660?
>

I looked a bit closer. So there are two instances of the controller
but the platform doesn't have as many sensors. So using just one
controller is fine. I suspect the other controller might be disabled
in firmware.

Regards,
Amit
