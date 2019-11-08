Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5781DFC6196
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 21:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 285702178F
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 21:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nKl15u10"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387399AbfKHV3c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 16:29:32 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:34218 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfKHV3c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 16:29:32 -0500
Received: by mail-io1-f65.google.com with SMTP id q83so7929136iod.1
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 13:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mRmwhSGnJWcbro1I2NsU98mvkk0pcwQPiXBcJRg/O6I=;
        b=nKl15u10ItYfNUfRdfrOlRLJn71C4ibsqBZ/3P+B+74i1afpRcQqn+q6zc8jpdWfF/
         4TlxJXWMVA2CzKaTu4/TkkDz/vWRfcJCJh6ToAyHjyRSfJH2cy+7BAFBE4bUdTXhkVpa
         +vhUPS0fXQBcgMO/mJWo4oLl/GXv8laDO3g2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRmwhSGnJWcbro1I2NsU98mvkk0pcwQPiXBcJRg/O6I=;
        b=k+lUygM5hKMj/It2vftX62yH89GrC/ciO9+xNjNyKk57G+Gc/LkEhNSp9m+LHc6isr
         5RexTHurfntFjAp/uVr0rp6BykSXALruvJGZ7C30OeiF6+J0zwzmSkBvZOODNCylTmEm
         8h43/05/kAeC5tNdQfLqV+5YQ+HcE4Zq9oJgj3qQxxsImtwtVUUhpCsHhO79GT30Bj8x
         LBTfSXWr1uVOwq8LUNwsBDElCBmsmfY2wBL4eb6N9mnEA/NgT+Fc/C0eF1D6zdT46a8r
         KpyLM44tTdgFfxd4wY5dHomrEmW4B4YC/CBY/Zjq7JZWnczhU/6rmTFulUal4oODqIoh
         vFRg==
X-Gm-Message-State: APjAAAVXMRdmkeUR49YjT55F/ugbtTgFG9EzVcuZLB2o5GGWhA8JjO7D
        aSAXPK5MyDjWu/hGJ8lJlOgYhFXctqc=
X-Google-Smtp-Source: APXvYqx5FuWdajI+Dds0mFnd4LkSPDMxDeacFID7FTVw+oh7cPzL8xiAGYhn+rSK6iqbF8AvIbjVhg==
X-Received: by 2002:a05:6602:198:: with SMTP id m24mr12902145ioo.238.1573248570998;
        Fri, 08 Nov 2019 13:29:30 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id z5sm989445ilq.3.2019.11.08.13.29.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 13:29:30 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id p6so7892565iod.7
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 13:29:30 -0800 (PST)
X-Received: by 2002:a5e:c642:: with SMTP id s2mr914619ioo.218.1573248569668;
 Fri, 08 Nov 2019 13:29:29 -0800 (PST)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-6-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-6-git-send-email-ilina@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Nov 2019 13:29:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WeDEaMEEqPr52WBKJ8MLGBZ590ro6nCpemctES0kvvDg@mail.gmail.com>
Message-ID: <CAD=FV=WeDEaMEEqPr52WBKJ8MLGBZ590ro6nCpemctES0kvvDg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 05/14] of: irq: document properties for wakeup
 interrupt parent
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>, maz@kernel.org,
        LinusW <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/interrupts.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> index 8a3c408..c10e310 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> @@ -108,3 +108,16 @@ commonly used:
>                         sensitivity = <7>;
>                 };
>         };
> +
> +3) Interrupt wakeup parent
> +--------------------------
> +
> +Some interrupt controllers in a SoC, are always powered on and have a select
> +interrupts routed to them, so that they can wakeup the SoC from suspend. These
> +interrupt controllers do not fall into the category of a parent interrupt
> +controller and can be specified by the "wakeup-parent" property and contain a
> +single phandle referring to the wakeup capable interrupt controller.
> +
> +   Example:
> +       wakeup-parent = <&pdc_intc>;
> +

nit: git flags the above line as whitespace damage.  Please remove
if/when you spin.

Thanks!

-Doug
