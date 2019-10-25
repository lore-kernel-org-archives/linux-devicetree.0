Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F9CCA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 23:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56A9C206E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 23:55:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dy6jrNNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfJYXzs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 19:55:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34759 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfJYXzs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 19:55:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id m19so3246666otp.1
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 16:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bavwoMbGp2ZbOAShRh7tu/QewKhCcWH09wWdF5PAI4Q=;
        b=dy6jrNNY1ljVcgOEysmnZ19k98bGr6k/qPsdysnwzwj0v4jrIUgmKmS5A/9AXik0Gn
         BLKBRrjkH/AG/p3Twxee5BF9UI7RQc35moYMrNhHTCkMMf4K8Dq8AYh+bm1wjpRktiM6
         e5jqk4vh2rqn2QwRDoiHKB75EWhb+XkK49jMZB8Qu+wPLVozmaW/uv2Amk7UT+ZuzU1X
         Ze2axCzDMbB+jhKur1SPDuG8S6uNcfdLfDlF28l499RRgbPndwJ1lCyO9J57EQEOB22E
         wa9Nh+ogc6fOXFT2FVAWWLs1s6plIKyItnA0gVgNFjLZPtZXauBJH/K367FvNuwrFW4g
         +16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bavwoMbGp2ZbOAShRh7tu/QewKhCcWH09wWdF5PAI4Q=;
        b=oNCLM8v6jEduIETKDVUV6ril41K/Q7ZoJZ1q3w6c4UWibZm1Xq8f3KfXAhmdxApOGd
         0pDTtbLdXu7JRk6eLSo74UaIT1sDtOrmwfTGTXmBP/ogq3Lhz1Otp/bsX8ydhbd30W3M
         IvdvbnjguCfgUdtlfvbjaSD2XTakSn0w9WfuBNvxvpRzxq6J8iZawydaPZWmJY/LXvhQ
         pD/LvnmEIv2acOQceUPtkcZM9TLnirQ/prIYcXCEwjtQ62tlZoqIYSk6wokBB+QZ1liH
         i0ghEZlUoqkn9NlixPb6VBhWL4zguhoeqt85x4Vt+T8ad9sP+56A8Rfh/DM+F2XjvQTx
         MyXg==
X-Gm-Message-State: APjAAAXw9I6SWTHtFZMP/dbAGIKGdbW3UrVVOgCkQ9cigwzc8PI2gnPl
        /WqwC1tsvNY0T6KXmKSG0d4eclq714PcDFjJUG0BBQ==
X-Google-Smtp-Source: APXvYqzmWunWZWTVqRSjMMjfEk3yr/qNebANIiJ/fhlGDJs30pR3QtZm9HsSzRsTtyD3E8yDfpqiMxINqquNJ5NEpR8=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr4918230otk.332.1572047747538;
 Fri, 25 Oct 2019 16:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191025225009.50305-1-john.stultz@linaro.org>
 <20191025225009.50305-2-john.stultz@linaro.org> <CAC=3eda3sCMjCQbFX2Y0-6iVt-YRR7P_Y1ksJOsLw9CmJJRxbA@mail.gmail.com>
In-Reply-To: <CAC=3eda3sCMjCQbFX2Y0-6iVt-YRR7P_Y1ksJOsLw9CmJJRxbA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 25 Oct 2019 16:55:35 -0700
Message-ID: <CALAqxLXG8LrWAQevEyj7BJ00CiAkodfgFMdCbuMRucO5w5yhKg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] dt-bindings: dma-buf: heaps: Describe CMA
 regions to be added to dmabuf heaps interface.
To:     Rob Herring <rob.e.herring@gmail.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Laura Abbott <labbott@redhat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "Andrew F . Davis" <afd@ti.com>, Chenbo Feng <fengc@google.com>,
        Alistair Strachan <astrachan@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 25, 2019 at 4:32 PM Rob Herring <rob.e.herring@gmail.com> wrote:
>
> On Fri, Oct 25, 2019 at 5:51 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > This binding specifies which CMA regions should be added to the
> > dmabuf heaps interface.
>
> Is this an ION DT binding in disguise? I thought I killed that. ;)

Maybe? I may not have been paying attention back then.  :)

> > +Example:
> > +This example has a camera CMA node in reserved memory, which is then
> > +referenced by the dmabuf-heap-cma node.
> > +
> > +
> > +       reserved-memory {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +               ...
> > +               cma_camera: cma-camera {
> > +                       compatible = "shared-dma-pool";
> > +                       reg = <0x0 0x24C00000 0x0 0x4000000>;
> > +                       reusable;
> > +               };
> > +               ...
> > +       };
> > +
> > +       cma_heap {
> > +               compatible = "dmabuf-heap-cma";
> > +               memory-region = <&cma_camera>;
>
> Why the indirection here? Can't you just add a flag property to
> reserved-memory nodes like we do to flag CMA nodes?

Happy to try. Do you mean like with the "reuasable" tag?  Or more like
the "linux,cma-default" tag?

Do you have a preference for the flag name here?

> As I suspected, it's because in patch 2 you're just abusing DT to
> instantiate platform devices. We already support binding drivers to
> reserved-memory nodes directly.

Sorry, one of those "when all you know how to do is hammer, everything
looks like a nail" issues.
Is there a specific example for binding drivers to reserved-memory
nodes I can try to follow?

Appreciate the review and feedback!

thanks
-john
