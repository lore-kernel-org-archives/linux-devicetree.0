Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD84C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 20:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54FD2206D5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 20:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hm6Jy+fn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgDPU5H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 16:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728160AbgDPU5H (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 16:57:07 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC5AC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 13:57:07 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id g14so4261296otg.10
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrdLvNUZuNOVEq/DpctNA3Oq1U2C5yJywp5te7wlqpA=;
        b=hm6Jy+fnQBEt3O7rSKr1yw27yEpuzy9j5I3q5e96JqP4sTmtV41H+pbUn16pMDC26m
         Dqrzl1JaVNUhXjZxOI3k27/KW01DXd/piu8CKN4q1RqSOIM6z8+pb6vSPoQ4ZUnkAguF
         0S35cHU4QtVvC3ZfhU7gow6p82ueKAlcFR1XthxcWf+ogCEnlVPOC3k/608BHI4VnjSP
         Z2SW4ZUcFyVHslCMQfScIjFbhjiND7nXeY1C7olk4MoPOgoUkA+4km2PfizRTPavTowX
         uADu9ny+h1mhlnbLWISHS7yrDfX/bNvDRqCHUyk/kwau2RqWm1PB0TF9n2grkzcOF+9Z
         YhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrdLvNUZuNOVEq/DpctNA3Oq1U2C5yJywp5te7wlqpA=;
        b=AhgUMxVN3A38HwhziYzEuDgml2+xNZI1HPtCdE6X4hihjx1GQdCh7q1J9IWguhNy+V
         keOwwzHMS+6kMtt00O1noDi8Mq1uB1lCnF9nTaI6HeSMZWdlyP9sWoQkodHIvImy33d9
         EtttTtwb3XFeRKrmYPXT8eueg+5xL758VyqZ9dSgX8Dlc2GZ8SjkIixs+weppIg8fr3D
         dItyvaSIbzVRx4lNAc3UHeRtUkhhQjxVl/hmoW9TtiFBMZA/NvIwKuAUcDqJkiD7NmVr
         3Rq5Tv3fCOiLbKAc3ZIKpwXsEZ7E2cAQRKcHvVhOAuci5I9cqhJ1mO5rckSw/TZN7z8T
         BBXg==
X-Gm-Message-State: AGi0PubF1oxqQ1CsFGI4rwawoMwzc/MAi1GwUbJ4QgS5foVMzvqqXb1B
        /PsG+vMiSRnRdXvkYzJ0MR+idz33UfS+bvNzGz7uXQ==
X-Google-Smtp-Source: APiQypIlWWZ5GWdzPQxZ8U60trk6vYQpLhZcfD04oMWwGIw7G8vVm1k8npz8diF9AbgVU0yecXzFqW4yfa9vUsF4NGg=
X-Received: by 2002:a9d:441:: with SMTP id 59mr25004otc.236.1587070626084;
 Thu, 16 Apr 2020 13:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200415150550.28156-1-nsaenzjulienne@suse.de>
 <CAGETcx-=E-6sg=B2Rr+V51eCxiBjNWPnOvvq6K=o9Sr-qLDvOg@mail.gmail.com> <69b79028764dcdfc9f550a5f95752afb491005f0.camel@suse.de>
In-Reply-To: <69b79028764dcdfc9f550a5f95752afb491005f0.camel@suse.de>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 16 Apr 2020 13:56:29 -0700
Message-ID: <CAGETcx_AHV8CDzRQ-y3xNRcT_QTi2ise1YwO7mw=u85g6O1uYQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] of: property: fw_devlink misc fixes
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 16, 2020 at 4:03 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Wed, 2020-04-15 at 11:17 -0700, Saravana Kannan wrote:
> > On Wed, Apr 15, 2020 at 8:06 AM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > As I'm interested in using this feature to fine-tune Raspberry Pi 4's
> >
> > You've made my day! Finally another user outside of Android. :) If
> > this does improve the boot time, I'd be super interested to see the
> > numbers.
>
> Actually making the boot time faster isn't my main objective just a nice
> possible side-effect. I'll give you some numbers nonetheless :).

Thanks!

> I have two things in mind:
>  - Exploring if fw_devlink=on can help us solve a rather convoluted device
>    initialization depency we're seeing in RPi4. It could potentially prevent us
>    from adding nasty platform specific driver code.

I hope it does! I've also noticed that fw_devlink avoids the need for
ugly hacks in drivers and side steps poorly written error handling in
drivers.

>  - See if we can use all this information to fine-tune initrd generation on
>    smaller arm devices with limited i/o speeds.

That's pretty cool. I have no idea how fw_devlink helps here, but I'm
glad it does :)

> Do you have any plans in moving the default behavior to fw_devlink=on? If so
> what is blocking us?

That's my eventual goal. The main reasons it hasn't been done yet are:
1. Cases like yours where there might be fake cycles.
2. Cases of DT with bad choice of properties. Say, something like
"nr-gpios" would cause error spew in the logs (not a functional
error).
3. Whatever other unknown reasons this might cause boot up issues.

I'm starting with trying to turn on fw_devlink=permissive so that
driver developers can stop playing chicken with initcall levels. Then
work towards setting fw_devlink=on (going to be a long road).

> Also do you think it'd be reasonable to add a DT binding to set the desired
> fw_devlink level? Something like a 'linux,fw_devlink' property under the
> /chosen node.

I don't mind that, but not sure if DT maintainers are okay with it.
But if we do have that, I'd still want the kernel command line to
override it.

Thanks,
Saravana
