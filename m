Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36EAC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 18:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA50E227BF
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 18:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cCfmWZGu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLRSjo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 13:39:44 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:42825 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfLRSjo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 13:39:44 -0500
Received: by mail-io1-f67.google.com with SMTP id n11so1509636iom.9
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 10:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qS07QetcqHopZvL0SAF8T87/ibXNrIwvAxwHVFARh9I=;
        b=cCfmWZGu+EkTY9HHCwEPsf8m9ckAewsbfv+DdyQ2mndIWHOIm5cPWNW6KA2eDILRbS
         Yp1/dohvrHxPAl+V3lkzpybQo/+zHsShotOBU5xVZT9n5tFDQQe3LfkSfaeEXTa1iav5
         Tw1T5zvpDld+JYMpSOSO8g4Wf2BGB/9CUvAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qS07QetcqHopZvL0SAF8T87/ibXNrIwvAxwHVFARh9I=;
        b=njEMv3DIniY0KmH1cu9fLT0/cmnOyev7VeqMpo+fQfpCUVukEHPvxggI6OuZd2Y1p1
         v+2XOGebeB/k+LA8Jo18km7PqrCL1ertUc3w0agBr3YNRFiM5Bzk+dbpGF5pgHJNLAbJ
         +Hz/SGzYvotARJbebJD4k3FJubw6mOVrlvHTFF8tbu9JxIBGAlN70/yJrCQLB4hLTHTl
         3nldVm+8kKdrOgmGxOL0bGMKQseKsqqXC59fW44eD9/+CHZDdou58KUAWCfsVmDNbpOH
         PhnwiBqzo9xVhHMC9w0dz18UfZgdQwM2cBeuEYW5l8gedoIVOwCWMMKs5vjI3WSLR8sl
         izVg==
X-Gm-Message-State: APjAAAVpy3Giyjukf1JoUVO6H1h098mdhHC/YUCa0DKbkuD4SMzBjpag
        SRiQYfCGM3o4YDuYfGDy9JmLPJp1QF0=
X-Google-Smtp-Source: APXvYqxahTYFagiGzORstPasVXz1BJHYmo1WjYVKclh5L1rKB2qJMvCXKW/tbb2gxodA16eqf1Jwzg==
X-Received: by 2002:a02:ce8a:: with SMTP id y10mr3751540jaq.21.1576694383071;
        Wed, 18 Dec 2019 10:39:43 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id d7sm921992ile.54.2019.12.18.10.39.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:39:42 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id v69so2540844ili.10
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 10:39:42 -0800 (PST)
X-Received: by 2002:a92:cc90:: with SMTP id x16mr3278373ilo.269.1576694382002;
 Wed, 18 Dec 2019 10:39:42 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
 <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com> <e901331b-456c-f3ed-6717-e5bf24778c57@codeaurora.org>
In-Reply-To: <e901331b-456c-f3ed-6717-e5bf24778c57@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 10:39:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xg9UTt2xjerkSKiSKSZ3tP2Drqf36Mu5eFiSxmsgj6kw@mail.gmail.com>
Message-ID: <CAD=FV=Xg9UTt2xjerkSKiSKSZ3tP2Drqf36Mu5eFiSxmsgj6kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Dec 18, 2019 at 4:48 AM Sandeep Maheswaram (Temp)
<sanm@codeaurora.org> wrote:
>
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
>
> Hm... ok. Interesting.
>
> Use of enum seems to match 'timer/arm,arch_timer_mmio.yaml'.  ...and
> sub-device probably uses DMA so IIUC it's important to pass
> #size-cells of 2 down to it if the parent had it.
>
> Should i mention this as below?
>
>  "#address-cells":
>     const: 2
>
>   "#size-cells":
>     const: 2

No, keep it like you have unless Rob disagrees.  If the parent is only
32-bits it should be fine to keep it.
