Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FB7C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 208E220720
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YkEKt4Xq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgFRChg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgFRBNk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 21:13:40 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08634C061755
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 18:13:40 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id n70so3236554ota.5
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 18:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3IYRY5mApD1A8OkAx1KflK3AICy88VNSwsN4bKujjE=;
        b=YkEKt4Xqjx+zUaljadFVqmEbhQJpAYp226CoARdTZb6Yq2H/HnAbdTucy3qzbhx9jJ
         0QvOx8Ej9ODoinLyRqQ6IKGHiSophBg6PthO6sh/eA2t0O2scb44Pdgh9p2CDuA+td0D
         Eg7zwHJn/9QNAh6DsJATmjPsfGvpmaitDA4LUG+0p7DRvO3yGhI9ybE3neNH36zSBHRQ
         gy3wlcgzbb+zMkPWmC0uBClslu1OnWnZQceN2Wb8FRIIjN84ze5gtoVwmcbJPBRswpE9
         nbbkBYJlwNosILLejA8e9hgmZSXTIdWF5O6FtpZHFpv/UNSrgr6HQDBR7c/GZ4imWsXd
         Do7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3IYRY5mApD1A8OkAx1KflK3AICy88VNSwsN4bKujjE=;
        b=jvF2GWdfpcJiyjLzPNZfAz3KCCvpEB4SwjdmFK9UDEb24C+Y/E4NCGuQ7Sm9i10i0o
         Gk77XV21KTwP1POZz27XS3XCuK/FPcwqyEk2n4FaYbJTyiXSF3opGuQ4IaUdpmZrtND9
         v/lKx2VP4wFnBVOM1DBl4hE/J1JJC/MsqcEfF1xHMcNrj2kVCevEIcFeHkBJDh6z8dsf
         2C667nWSODxb7wIzBJCL2qZ49LBJCZpOA/pYeGTCfMsYXR09tdtp7KYQcRJr41zFqIE+
         CJHS6DK0XHHbZERXz6/CaJAU2EEEQO7qRHn/NeoPhXsm3CboXEIHKY22hefkSGfAFxKu
         +gBQ==
X-Gm-Message-State: AOAM531VGw2zoiohB6g/LIhYbn54SYDF09G0YTMHcdG7zYoSnFhZj6ok
        ZpXQDKQc+DqpFzMG20cfjW4jcC2qM2YSy9xJDN/q0w==
X-Google-Smtp-Source: ABdhPJxEH8/D5t9RpT0wPLIRenM82iFZzBH+GwCDoDkTglhtD6JQZNKdbsUFVN6/5Bi8XuJhpZJUfddbIiz67WLm/5A=
X-Received: by 2002:a9d:ed2:: with SMTP id 76mr1501386otj.236.1592442819145;
 Wed, 17 Jun 2020 18:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200610011934.49795-1-saravanak@google.com> <20200610011934.49795-3-saravanak@google.com>
 <20200617221221.GA2923473@bogus>
In-Reply-To: <20200617221221.GA2923473@bogus>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 17 Jun 2020 18:13:03 -0700
Message-ID: <CAGETcx-TBg-Xm4vTkB=F73hGweM+T35Ht10x+DdpwYEbYkzg1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Improve cycle detection when one of
 the devices is never added
To:     Rob Herring <robh@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 17, 2020 at 3:12 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 09 Jun 2020 18:19:34 -0700, Saravana Kannan wrote:
> > Consider this example where -> means LHS device is a consumer of RHS
> > device and indentation represents "child of" of the previous device.
> >
> > Device A -> Device C
> >
> > Device B -> Device A
> >       Device C
> >
> > Without this commit:
> > 1. Device A is added.
> > 2. Device A is added to waiting for supplier list (Device C)
> > 3. Device B is added
> > 4. Device B is linked as a consumer to Device A
> > 5. Device A doesn't probe because it's waiting for Device C to be added.
> > 6. Device B doesn't probe because Device A hasn't probed.
> > 7. Device C will never be added because it's parent hasn't probed.
> >
> > So, Device A, B and C will be in a probe/add deadlock.
> >
> > This commit detects this scenario and stops trying to create a device
> > link between Device A and Device C since doing so would create the
> > following cycle:
> > Device A -> Devic C -(parent)-> Device B -> Device A.
> >
> > With this commit:
> > 1. Device A is added.
> > 3. Device B is added
> > 4. Device B is linked as a consumer to Device A
> > 5. Device A probes.
> > 6. Device B probes because Device A has probed.
> > 7. Device C is added and probed.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/of/property.c | 62 ++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 56 insertions(+), 6 deletions(-)
> >
>
> Both patches applied.

Thanks!

-Saravana
