Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467B8C352BE
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 09:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 221AB20771
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 09:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="sTtX0xPo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503370AbgDPJKq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 05:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502799AbgDPIol (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 04:44:41 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38D6C03C1A8
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 01:43:31 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id q204so15947216oia.13
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 01:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykDjvtxv4Q2KeXX83+m1/r5YqBgMSd9dJ4muRIWqoK8=;
        b=sTtX0xPof16ieMD0Q9OdwI0NgjF/5AfTvpLiSV8y9MbHQuapST//WTvCgs1LhmMB/w
         ltPjhVc7fz135Ygr7sOa5IK+HaQdpyz/InJXeSWuxtXsWPPZy0uBaatPkI+Lc9lHdAn6
         20iOMacLvX4sttfW6pW8XAqDOz7Bwn8/ptj70PbeazMMqNLmjF9kd8Q/nUlOzlNFi5Ke
         7ZBEIsWWaUPDQQXnL5TlrPwok27nzT9jJ7s7YylaHtmNDtyfhiE+xPq+mQL8FtWhCquD
         cBEglwnIAdIbkGUObP3+Kn8YaUCPMmjpg1dv106flH+bZeFyO88/3UgEUf7DI9L8arWQ
         3BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykDjvtxv4Q2KeXX83+m1/r5YqBgMSd9dJ4muRIWqoK8=;
        b=lRuY0+vhfA/ztJWyqOIP3YLIuO4XIrJaFoUdRVTKTTLvMAUGSKuu7w5Pe8RWY1tfgf
         qczr0WE9FJug8O+2xKFg7BiaTDa2Jd6mJduKHVpILx/L+bWcatMUr4i5RIayUoSYTeDu
         urEjyEH4tSXkLrXAbmlTv+YUjujHNaSXu7tmaeaS0AZ3/AVwL7ZN+dAP4q6mFALvX9F5
         Vzae2f9UBjstEw+yoQlWMPavjGSm+AymJbzNzjJc9okZFdw3FpIJZnU9zuCfbidTuojJ
         fhEgL2DfnAI+R7xBKC7EqpqdrDgrZCe91GYIPj902lT4HnvAjl1YnAVifZiRw9GlE1zv
         j3gA==
X-Gm-Message-State: AGi0PuY9SCvTzOtYxJLWMC+STw5d37EmGLOhLf2QeQlMH/yuXBjWRN6A
        eluskSm0p4jGd4VhEkdF0i247TCWa9BexZENilcmvQ==
X-Google-Smtp-Source: APiQypKA0tsSgmkVKs1bVQXUH8aVDS5ErxQUQokg0NYz0kQHISsOtgMVqpA9ywjDpHxMmo0pN5cR4SI23dw3PEHfkJc=
X-Received: by 2002:aca:4d86:: with SMTP id a128mr2238387oib.96.1587026611441;
 Thu, 16 Apr 2020 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200415150244.2737206-1-robert.marko@sartura.hr>
 <20200415150244.2737206-2-robert.marko@sartura.hr> <91e6a0bc-2189-69b7-ddca-14721dc6ca1a@gmail.com>
In-Reply-To: <91e6a0bc-2189-69b7-ddca-14721dc6ca1a@gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 16 Apr 2020 10:43:20 +0200
Message-ID: <CA+HBbNF22tXVtOQkZJ0JHi_ryeeUnnH3hZuxuHFcyTAxZ_Z2nQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: add Qualcomm IPQ4019 MDIO bindings
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 16, 2020 at 1:55 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 4/15/2020 8:02 AM, Robert Marko wrote:
> > This patch adds the binding document for the IPQ40xx MDIO driver.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Please do not drop tags when they were given to you in an earlier version.
Sorry, I did not know that.
Wont do it in future,
thanks
> --
> Florian
