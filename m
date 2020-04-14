Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F12C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 09:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FD332063A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 09:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YprgSRcu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437398AbgDNJIx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 05:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437396AbgDNJIv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 05:08:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B495CC0A3BD0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 02:08:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so5455507ljn.7
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 02:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zyjNeTqvfEjZX8vIKzclorxGtdOVdVhWe6jr1cd8Lcw=;
        b=YprgSRcuKMz2TB2H7Js6CV9O0igeW65lMXILU0J5LZC5dkVlZVfMejJaTxk04tAwGb
         SKRQrIaXIHu7IAXDTdwvQIFevn1Pw+oltQRWXV9hhLtCckgmgeuH1V0jUCz6Tf4puJXv
         0wyzzp1faSmkY8mg9d/yHWuGC7GaRgnindjLgjC67KJR0wVTeeLNDcy14kb+eaJy2Sm0
         FJTwfDwSCas6Tp+ruj7SxunLNrOtrbaZ3OLjgQTZODzWeIQZlzHCevccg7vyk4xBmm5J
         44mYUWCTr8x3RfWzk4bU1eOLrjRnG12wzlJ625PyNW41w6trhwqpxDEkPFYGmCGgBXrJ
         TbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zyjNeTqvfEjZX8vIKzclorxGtdOVdVhWe6jr1cd8Lcw=;
        b=WaABssd36aa4pS+IRI9R04XlbNleSISkZ/JeQX5TopfGkt+EelgB9gkwW8Xii/9kB7
         5NDuTbLqRu6NDai08N9/OIkU+H/MdVmipXe+qAhMdE/QmgYibCetaxePFk05eZ8M8V23
         6QnzQ/XI4WZN/Q48CW9Mt1FroUWPDOf52tqhrbYXDXKU2gzJESEYIPtC5T3Gwln3qn8T
         qw2d3Lp4Rr1YLS0nvroxcx6qx9PusbVYCHU1R+2P/G3zkdsGC6AaeiNW8jEx0vBfmlxS
         LEa+OSrxiOur+j3A1eq28FZ7tgQEGbV+TuhZc/oWiTQXWeq/YmYiQYAX4rHdS8odJpl/
         0F8g==
X-Gm-Message-State: AGi0PuYGvGGJcS/VR4a5dz6yz9mWPWX3OasC0/NLpUdJYxQBj9r7KGrn
        YvNh7dGbsdWHKSZZC451Obj6VnpkTNLpYunbU+6rBA==
X-Google-Smtp-Source: APiQypLF1woHKulkGKUVOcynI3F6bPW0neabdjjFhnRcaLD4bVyCGbpN1rI1nFV64y7Zz5AswkKA1tI10XRVvnW0pE8=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr12489541ljh.258.1586855329250;
 Tue, 14 Apr 2020 02:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200405173252.67614-1-stephan@gerhold.net> <20200405173252.67614-2-stephan@gerhold.net>
In-Reply-To: <20200405173252.67614-2-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Apr 2020 11:08:38 +0200
Message-ID: <CACRpkdYW930B-riUi5OnmsDCJD_piJ+321rgB40bq93ndzSp5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: defconfig: u8500: Enable CONFIG_GP2AP002
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Apr 5, 2020 at 7:34 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> sharp,gp2ap002s00f is used as a proximity sensor in
> samsung-golden and samsung-skomer.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Ooops I saw now that I already had this in my "Skomer and misc"
enablement patch. (rebasing my trees today).

I can put this in front of that patch and take it out of mine if you
prefer stepwise enablement.

Yours,
Linus Walleij
