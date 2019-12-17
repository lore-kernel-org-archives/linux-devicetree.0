Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BD7C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 19:23:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D99724655
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 19:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="haUsSjX3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLQTXI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 14:23:08 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:46807 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfLQTXI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 14:23:08 -0500
Received: by mail-il1-f194.google.com with SMTP id t17so9336407ilm.13
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 11:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/IwEwp0WnVVccJ/nXI+m2TMK2nBYe24/J4DSiPygpI=;
        b=haUsSjX3lPpr0JU/QJDJufoNCsgPvJ6oKb7R320ALmJQ0qYqJnDkm+wDZhEf5uPMDK
         k8KmwQARjeBw4DhVp4P0yHgR+ZYucEzw8758Ld2GYfSJRl9HmcjTIGq/3EXIXIvVMYrB
         mIHgitESF8mwTupA1jsQ8p9/LpcfxsVGQAHqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/IwEwp0WnVVccJ/nXI+m2TMK2nBYe24/J4DSiPygpI=;
        b=NdIadvQ++o7m+7hgGPhoIChna2BxiTirEzEfPMr4NcabA7huSW78kCM+/gHFG/B66V
         zG0RC3S34oRquZZsG5LFhvSQfaSCWrF14wtzL/F7ofpruqRwtubgwWa+qtdq3qMFf82U
         jL163nYbq0jOhOTCf3+KMgunXR+dRmwk6ABXczAI9Ki0tCY51g7Vhpm9uAIhfs8jifNu
         2yl+jPtRvL717Q8yqh5G9XU8oO2M6RbFJVNyekBwhfwUlPK5L7sMUsiAMA5J8UeVNOxI
         2RObcmndj/OAHeEf5OOl8l3rONEuJSqKVgj48AXdiKaYG80IkfyVEsoKHJEQ3ZlfQpeY
         U8lQ==
X-Gm-Message-State: APjAAAU/AyYUNT5IfdTwnmBIOpVz6B9RT7YF8fLvlb0IVzlVPZ+DMn6U
        GmQntqGb9Gw2e9aH0/fqj9P5ScyrjFM=
X-Google-Smtp-Source: APXvYqzZRqznbRNbQfttGcXIVw+hrdETNPr337S7EO5TIuqYQLXs/vP7Droc8dheCKQXz5QpM1YXhw==
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr19144613ilq.192.1576610587382;
        Tue, 17 Dec 2019 11:23:07 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id r14sm7031897ilg.59.2019.12.17.11.23.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 11:23:06 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id c16so10423764ioh.6
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 11:23:06 -0800 (PST)
X-Received: by 2002:a02:ba93:: with SMTP id g19mr19057729jao.90.1576610586103;
 Tue, 17 Dec 2019 11:23:06 -0800 (PST)
MIME-Version: 1.0
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org> <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
In-Reply-To: <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 11:22:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com>
Message-ID: <CAD=FV=XA7g87vu_sNhn=z1cfe51c9cUT8MHUHi3PYC7bosb5PA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
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

On Mon, Dec 16, 2019 at 10:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
>
> Hm... ok. Interesting.

Use of enum seems to match 'timer/arm,arch_timer_mmio.yaml'.  ...and
sub-device probably uses DMA so IIUC it's important to pass
#size-cells of 2 down to it if the parent had it.


> > +  qcom,select-utmi-as-pipe-clk:
> > +    description:
>
> Don't these multi-line descriptions need a pipe, | ?

The pipe just means that carriage returns are important.  They aren't
here, so I think it's OK/better w/out it.  The example-schema.yaml has
many without it.


> > +        usb3_0: usb30@a6f8800 {
>
> Should node name be something like 'usb3'? Or is this usb 3.0 so it's
> 'usb30'?

Probably should be just 'usb@' as per 'usb/usb-hcd.yaml'.

-Doug
