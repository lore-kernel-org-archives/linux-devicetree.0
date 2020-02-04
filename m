Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D963C35247
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 17:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 114C12087E
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 17:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jjb36hAp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgBDRZK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 12:25:10 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38621 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBDRZK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 12:25:10 -0500
Received: by mail-vs1-f67.google.com with SMTP id r18so11882771vso.5
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQ5VpNlkKKb7XdD6t2/fjKBTlJ5xrb0+onSqPevSGn8=;
        b=jjb36hApE2rzA0PwVFrbGceWDgUFBRvIFh1O9GaHdj+09aKzb9Ac6Cy7L3R+0hMsRI
         XeqCYNXjropbpRxsmUZlOV7cfU89VXuPdhvIz1xBZk3yDCMeaUq/gyuuUTM/+NB7C7Zt
         M19FLFrg6K3918rZgxVyaRa/VOoIU/QZ6Ng7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQ5VpNlkKKb7XdD6t2/fjKBTlJ5xrb0+onSqPevSGn8=;
        b=hZAwbqhlkdmukpDfFrQOYkuYel0l67Y7YNw4eEqrO8bKmxQd9FNb86UGjVyWTPgKyf
         VuITqvH9e7VN+EtfEP0vEXJvJNEdPuTYGR5vQQar09Uizy6Utlvto++7DCj3Qh6k7y7r
         m4cMUsxXOTWw5SJ0CwwPWR7q98KJpixCnpqatwid+pflx4F25R/mwE8NqzsCOH/Nn5Pa
         ZSgZyU96RpMdB0K3sXcjIajmZ6WIT/WcbIlfAvZ1Wv+xyvZ8jcUo9ZBdnEGgwaOK803d
         vqV0gDXsTyqtB0LeFEcJ+5rWHHD1LQqS/MBxzb46ayYXqZhbnAR7lJVh+U8KCsYdXLck
         2UDQ==
X-Gm-Message-State: APjAAAXskKAvwJ8aNigQvc6n1+1hN9NiLG13Hk/7x1u0Xf50C8+Xd3j4
        A6IZThBfy1+sJT0gCnln1CrRVLMvSPM=
X-Google-Smtp-Source: APXvYqxDHyFMlKgCm9vKT+ldIj8/rIs5zt01apnM1qXv+oOcV2TNxDC6y93kwHf51uZTkdx1n+5eyQ==
X-Received: by 2002:a05:6102:303a:: with SMTP id v26mr20701318vsa.119.1580837109059;
        Tue, 04 Feb 2020 09:25:09 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id o36sm6831937uao.15.2020.02.04.09.25.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 09:25:08 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id 7so11843262vsr.10
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 09:25:08 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr20331801vsd.106.1580837107900;
 Tue, 04 Feb 2020 09:25:07 -0800 (PST)
MIME-Version: 1.0
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-6-git-send-email-sanm@codeaurora.org> <5e38c036.1c69fb81.3da87.c53d@mx.google.com>
In-Reply-To: <5e38c036.1c69fb81.3da87.c53d@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 09:24:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ximzn+WwmDr62sjOsFOQRtQaB34BP7rY-y4x7Pb-zGPg@mail.gmail.com>
Message-ID: <CAD=FV=Ximzn+WwmDr62sjOsFOQRtQaB34BP7rY-y4x7Pb-zGPg@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] phy: qcom-qusb2: Add support for overriding tuning
 parameters in QUSB2 V2 PHY
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Feb 3, 2020 at 4:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Also, why not  use of_property_read_u8() and make DT writers have
>
>         /bits/ 8 <0xf0>
>
> properties so that we can keep things smaller. I don't understand why
> they're u32 in DT besides to make it simpler to specify a u32.

As per the other thread, I think it's discouraged to specify /bits/ 8
in DT unless it's really needed.
