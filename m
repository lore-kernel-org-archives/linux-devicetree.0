Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C65C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 09:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01F782073D
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 09:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgCEJiv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 04:38:51 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:45130 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgCEJiv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 04:38:51 -0500
Received: by mail-ot1-f43.google.com with SMTP id f21so5005688otp.12
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 01:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjlW6oSP+p3MkzDBeG47zElrm9PNtmQ5zIOohaSll+E=;
        b=AHFhjGfzKoyg4yi1aHw1LEtlstgVdL0k6F494DuEkd6E/pfvKM/hl5bKjqst8CLUVO
         chIbT/m2ZGLqMl4XnqJ2JSGrOeI586XqiYaOhaiZ0EyepB6ZhcWm9BKzjNZztKrp0/BQ
         9LLFD9S8Phl/pxQjc2f8DJUKFEg6ofRR/89rlBWDCyzzYdhV5TrIPr228BnEEtFNm1EQ
         BgBo5jrbRZ1aG85HTHlseIz3rSh8G7fbCHDksXJHht9d4CyFLkJTSPzCOIPS/sObSRyI
         D+FS6oFSHe09BOdMcdLSk9/E5XydhsFBwgFlNEPk0vPlvc4BLTH9DoJ/kcotNKCDCZMN
         skLQ==
X-Gm-Message-State: ANhLgQ0UzMCglcwirPNnEDLu9a9AQsZKrrsdk7ETcssErG+WwpW6E4D9
        tmEyLXpwWCwK0jKT/doRvX+B45L/52xYZ8vfHlo=
X-Google-Smtp-Source: ADFU+vukGxNqz/hVg1TX9R/UMeg4cCb39dRu9Y7cq43L5hp/KdEXM/1mCCEm0Ji/y1a9a/a2AZ3+Hh366IC9Nrn3s7k=
X-Received: by 2002:a05:6830:129a:: with SMTP id z26mr6120035otp.179.1583401129253;
 Thu, 05 Mar 2020 01:38:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHLCerPCyYMmUttfz5mPrJiu3ApzoijTERLYjdZYau=EFVNDPw@mail.gmail.com>
 <CAL_JsqJ47Cm=XCaW2DXMtqcdm4+sdErpQsqgqb2jJyzEgmywuQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ47Cm=XCaW2DXMtqcdm4+sdErpQsqgqb2jJyzEgmywuQ@mail.gmail.com>
From:   Mathieu Malaterre <malat@debian.org>
Date:   Thu, 5 Mar 2020 10:38:37 +0100
Message-ID: <CA+7wUsy1ajjydta7xAc25C+KA5W4Gj5UoZ6xZXO4-CELcH3+FQ@mail.gmail.com>
Subject: Re: Permission to relicense thermal bindings to GPL-v2 + BSD-2-Clause
To:     Rob Herring <robh@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Caesar Wang <wxt@rock-chips.com>,
        Punit Agrawal <punit.agrawal@arm.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 5, 2020 at 12:06 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 4, 2020 at 3:24 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> >
> > Hi,
> >
> > Everyone on CC has contributed to the thermal bindings[1] in the
> > kernel. They are currently licensed under GPLv2 but we'd like to
> > relicense them as GPLv2 and BSD-2-Clause.
> >
> > If you agree, could you please send your ack to relicense the binding
> > as GPLv2 + BSD-2-Clause. I will then add the BSD-2-Clause license to
> > the yaml bindings sent to the list.[2]
> >
> > Regards,
> > Amit
> >
> > [1] git log --no-merges
> > Documentation/devicetree/bindings/thermal/thermal.txt | grep Author |
> > uniq
> > Author: Amit Kucheria <amit.kucheria@linaro.org>
> > Author: Viresh Kumar <viresh.kumar@linaro.org>
> > Author: Rob Herring <robh@kernel.org>
> > Author: Mathieu Malaterre <malat@debian.org>
> > Author: Caesar Wang <wxt@rock-chips.com>
> > Author: Punit Agrawal <punit.agrawal@arm.com>
> > Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Author: Eduardo Valentin <eduardo.valentin@ti.com>
>
> Generally, the copyright is owned by the companies. I've already
> gotten okays on any bindings from Linaro and Arm. Looks like it is
> mainly Eduardo/TI that needs to agree. The remainder look to be
> trivial changes.

No copyright attached to my trivial changes.

Acked-by: Mathieu Malaterre <malat@debian.org>
