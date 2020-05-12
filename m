Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B01C2D0F8
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 23:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A451A20753
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 23:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FUMFvFyj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELXYL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 19:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgELXYK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 19:24:10 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB1BC061A0C
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 16:24:10 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id s37so5893850ybe.13
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/u4atMFlBmLtwnSTMgMCyabi/w8j3iTCGwRJskabUDQ=;
        b=FUMFvFyjoY5VlbhYA9rjNaJMt+/kRqiJvdjU8f/dcnmZ5RZh2+QgVU8DfaWiULoOCW
         XPd2H5H8qIDmEqp5e/bpmkxzAepnCV1VFhTrWF+3VAvuef1c3Ty6QX1dLhH+Pj/VZIM/
         EaIkMy2EevAj1mRnJJshNV56xmonJ3SL8jlEKq2PMMpl0h0EFctkKeVAFCMZXE8OCler
         5a3UPBxJwucuQcZpYZ6Iz2rU3MlxNRIu3JqfpdeTMx4JjOSKOtJ/tWAY+iiZwNiBK5UM
         +oDEIngTzcaD//Xe5yqEjSQVXlEf3ThtGlADepvyHCAGRhVhyJE4nL2XKU1uedBG0y22
         2u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/u4atMFlBmLtwnSTMgMCyabi/w8j3iTCGwRJskabUDQ=;
        b=Snyd/+gYtgrWrlt7rKDvL6xjo+o2oUt6GULrsm5fFgkKdfhMmAlHmJpUwxu2UB42Wi
         w3XYUrlfzrRnjZ3m8zni6jpd4ocohSDLCrU4Da5efahTWLNusLmZ5D06KMos186A2jTq
         rYQrizjlRX2MImsPJCzRhNU+HGkjx8nGJFQncQQzDtiJtcEHXnJdm4br3GriU4JB2FGZ
         w8hB9fACPCGfC/V0H15Wgg6in9W5LT5GCy2tVodjiCPM0Ti70B6CD0K3FZxvp9crimq4
         nLJyLvXdrK4ROBq2+3FNoghpm1yAxqVloH+BeBI9PUbJn36+Rc58sxKT8r9xoijrBITY
         Xw6w==
X-Gm-Message-State: AGi0PuacQ4Hz9tg0OB4qhNLB9+snRRCg6mr1a/KlvbYpD+OTzjQEdoY2
        d9OcuowWMGOsutgarO3PNp4eHkDpkWFuhVrcCsQfwA==
X-Google-Smtp-Source: APiQypJsh1XuLI/Or+Cuxml34jfZWIFEC2vOt3BCpxxZ5Z8CSRquQEhUPx0qqlzhIuvjXww3sdCPdkWC8bA4V5hfgzE=
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr39075879ybg.34.1589325849314;
 Tue, 12 May 2020 16:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200424053819.220276-1-jnchase@google.com> <20200511212047.GA21845@bogus>
In-Reply-To: <20200511212047.GA21845@bogus>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 12 May 2020 19:23:57 -0400
Message-ID: <CALTkaQ1syQDYw9afNbU5GGGG2=-u4ByTAc3w6xhL_F6F=EBOzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add ch7322 as a trivial device
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 11, 2020 at 5:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 24, 2020 at 01:38:18AM -0400, Jeff Chase wrote:
> > The ch7322 is a Chrontel CEC controller.
> >
> > Signed-off-by: Jeff Chase <jnchase@google.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 4165352a590a..ec2ddc6cdf9a 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -48,6 +48,8 @@ properties:
> >            - capella,cm32181
> >              # CM3232: Ambient Light Sensor
> >            - capella,cm3232
> > +            # CH7322: HDMI-CEC Controller
> > +          - chrontel,ch7322
>
> I don't think this qualifies as a trivial device. It has HPDI, OE and
> reset signals all likely hooked up to GPIOs. You might not have those
> hooked up for s/w control, but someone will.
>
> And I'd assume if you had multiple instances, they will need to be
> associated with each connector.
>
> Rob

Thank you for looking at this. Taking a step back for a moment, I am
developing this driver for an x86/ACPI platform on which I also
control the firmware. Is there a preference between using an ACPI ID
and a devicetree compatible id? I am trying to find out if the vendor
already has an ACPI ID for this device. If I find and use that should
I still add a compatible id anyways?

Jeff
