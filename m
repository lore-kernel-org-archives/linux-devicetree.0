Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E018C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 17:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54F9022522
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 17:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YrB//b92"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgA0RIG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 12:08:06 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42393 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0RIF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 12:08:05 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so6113061vsd.9
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOiV8nj2HZ+JtKcIVA5xQdznkVK/jM8PnqE9J+mRXqQ=;
        b=YrB//b92fTsHkMw3bXM25KI/RYWOU7ymbAeVsjo+vGfk3HbEiKFvFYtASMzcTT0lUM
         dyv2seW78v0VKay+qVrhTS3Jpn7Y7unPJ29rR2HvbrOOrPCQzDq7qdIqyFckjEDe7+Ap
         aFRB4NmCvhUk0h4tMLr2fD0rmlmi8+LY4yxVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOiV8nj2HZ+JtKcIVA5xQdznkVK/jM8PnqE9J+mRXqQ=;
        b=Kn70Wv9GM3tCSgVkAnTRtgdB6GAZp0fh+0it8V8AktsfJuqtf0PmVP1dD/4+cd9gxE
         BBN2b9tcNRgiEmJgHFw/4xllFIucUxm1k7CT2wanC4dpQNgbn98mr/14JX3uMn2GTDDb
         tdBi6/J/sDcuYuyrj38nl5JritsZxd67Hr5HHWkGHMwkqibM4OwLo/nbuW8fu3MQvs0O
         rOXQZqE4FG7RmstZpzL6FXvEY6u+Fh8waSBgasVBXExVQtPQVnTkvcRH1WJMVm4TAWFX
         lwtFdC4P+GfwHLbM5ZL/42LmDrMUuHGLhvcf5vY4iIjOFL5UdgqV0Pr1C1p2xweG1PW4
         obEQ==
X-Gm-Message-State: APjAAAW/Mzrp45Skfa28zZ74GQSQEeARSTOqdprju8wZdlGFKp5GQgzF
        DibAeo0vE8CB203wmsNs92G4uQ2+GbQ=
X-Google-Smtp-Source: APXvYqy22+qTQ7ISnCDWMn/XcSZbuk8xo6phRtx0VY+1KSanZii3ihKdteSBPGpnXoH7vplu2ORyhA==
X-Received: by 2002:a05:6102:18f:: with SMTP id r15mr10704670vsq.206.1580144883171;
        Mon, 27 Jan 2020 09:08:03 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id q189sm4516448vkh.44.2020.01.27.09.08.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 09:08:02 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id v141so2476265vsv.12
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 09:08:02 -0800 (PST)
X-Received: by 2002:a67:1ec5:: with SMTP id e188mr4925367vse.169.1580144881597;
 Mon, 27 Jan 2020 09:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20200127082331.1.I402470e4a162d69fde47ee2ea708b15bde9751f9@changeid>
 <20200127170457.GK2841@vkoul-mobl>
In-Reply-To: <20200127170457.GK2841@vkoul-mobl>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jan 2020 09:07:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XKHy6FmkeyCNB+vb7Ws=uZWOQ-QpYOKPJZg9PhFcJf5A@mail.gmail.com>
Message-ID: <CAD=FV=XKHy6FmkeyCNB+vb7Ws=uZWOQ-QpYOKPJZg9PhFcJf5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix sdhci compat string
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:05 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 27-01-20, 08:23, Douglas Anderson wrote:
> > As per the bindings, the SDHCI controller should have a SoC-specific
> > compatible string in addition to the generic version-based one.  Add
> > it.
>
> Thanks for spotting it Doug, Btw did some script catch it or manual
> inspection?
>
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

It probably would have been spotted by "make dtbs_check", but I wasn't
running that in this case.  I just happened to notice it while
chatting with someone at Qualcomm about whether
<https://crrev.com/c/2022985> was correct (still waiting for a
response on that).

-Doug
