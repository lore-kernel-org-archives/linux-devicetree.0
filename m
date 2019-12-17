Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B70C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 06:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 396AB21739
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 06:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CWsihZkN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfLQGdT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 01:33:19 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:45832 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfLQGdT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 01:33:19 -0500
Received: by mail-io1-f67.google.com with SMTP id i11so6644065ioi.12
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 22:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j8qQazTeYPQdPoVme7emjZiiaLOYVtOqidRg7IlHaTY=;
        b=CWsihZkNVNtPq/SN/NKHowVe5xKMAb4uOARJ+QvJIEf7JBDokni7tWRn9l9BumYAsn
         ixCxWlJo0IpiZ/5CjEdOds3HI9rdCTvBKSWoHXOmoQNpHIo2DNEzNKU/HWo+7mzq75tG
         fIvD9gSKO/dEvrlQ047bpMw3pWUXF2S6q6vWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j8qQazTeYPQdPoVme7emjZiiaLOYVtOqidRg7IlHaTY=;
        b=DBJGzlK0rBH96MJ7mHVFPY6wan1zfLIN+5fQeZa0FHNZgg9MX+JnvoiUafRcUABCPv
         omqOrAuEJeVTnMm2fykeWedfLZ2dWYwExsoeKxXOG2ruOZasIT7Lcmjq4W7JPdKhPdZk
         jpbBTwrINlJ14hzFGQoSwl54XXGAETnURYfENlWV5tBiIEKTvClbzRN4YQIPOq2c0lWF
         EZG/4JBRjdoGjyj+3H9lkzJNgtT3FxP6V27PByMtyIladm83yPbGV97HjMQyvbz1rWfR
         QYx6uRcGRzKmfrh2HYkkfcUBF98DNYgehQ+G8tLGDT4MavRyf7ID4a1Sxfe0nMDTBP8y
         ZepQ==
X-Gm-Message-State: APjAAAU8ZzgbN5MsBXF7cXAEFGouTxDmB5rU5DCzg5wEsNprNF+gFzWW
        myh1GpbUoAUq2jBYHHoCOLZaHAgGpaU=
X-Google-Smtp-Source: APXvYqyn2ulpfTVj2KtWhCewkz0rdlwjXS+2uxM737n2t62iTz1xIlslsPNspUp4lWLZmzdr4TTzjg==
X-Received: by 2002:a05:6638:2b6:: with SMTP id d22mr2017582jaq.59.1576564398751;
        Mon, 16 Dec 2019 22:33:18 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id q9sm4892479iod.79.2019.12.16.22.33.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 22:33:18 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id c4so3070418ilo.7
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 22:33:18 -0800 (PST)
X-Received: by 2002:a92:da44:: with SMTP id p4mr4502564ilq.168.1576564061839;
 Mon, 16 Dec 2019 22:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.2.Ibad7d3b0bea02957e89047942c61cc6c0aa61715@changeid>
 <5df2b77e.1c69fb81.15e56.4084@mx.google.com>
In-Reply-To: <5df2b77e.1c69fb81.15e56.4084@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Dec 2019 22:27:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoNV26QYgADR1u-Fs00mitV9hYwHxt-rCP1agpEoa=pw@mail.gmail.com>
Message-ID: <CAD=FV=WoNV26QYgADR1u-Fs00mitV9hYwHxt-rCP1agpEoa=pw@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc7180: Rename gic-its node to msi-controller
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 1:56 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2019-12-12 11:35:38)
> > Running `make dtbs_check` yells:
> >
> >   arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: interrupt-controller@17a00000: gic-its@17a40000: False schema
> >
> > From "arm,gic-v3.yaml" we can grok that this is explained by the
> > comment "msi-controller is preferred".  Switch to the preferred name
> > so that dtbs_check stops yelling.
> >
> > Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> This problem is also in sdm845 and probably others.

Patch to fix sdm845 is at:

https://lore.kernel.org/r/20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid

That was the only instance I could find from a grep of arm64/qcom.

-Doug
