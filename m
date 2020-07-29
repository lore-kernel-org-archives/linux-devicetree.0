Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4508BC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 09:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B4F821744
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 09:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="NEIJjohV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgG2JOH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 05:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2JOH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 05:14:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2489C061794
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 02:14:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k8so2198225wma.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UP89gGtNifZ2OXiYa2igFr8vAWMBLRJL0ocxb3qTc7I=;
        b=NEIJjohV6bX1tKEzqf+d3D5YWkpcvrUyHjdAD7fzT7Rjms6K9mKPEiKdljtYOh4rOA
         zZWmulfdjV2YX09WLBGwAufZi38QenV6qAA9nJYmi2uZZjdLhOkuQAKS/JegMqn1YMzU
         8yIVkUZ2zLd+yFcPDVkfQsL5WhoYKUn6ct5yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UP89gGtNifZ2OXiYa2igFr8vAWMBLRJL0ocxb3qTc7I=;
        b=nJtgIsWjS4K8E++KEIspjYztGj332qDnPgUj8T/QF4GiPNhIxUG90FFIN3j704/68H
         puxrB0OsVmx7nfpdt31bUjQrmgNrjyl11DoTm2GXHQVIv58IUuXVALK/kenm5HNEui/j
         1u8TZxnRhsLTnM2X3jBb+mTpvONvwIKssxBY5FQf+l9sQ6b1AEk66ni1ScBjnQfveoOt
         S4vWHWNKh3Ap6CvshSqgCsKx1XKNb5LK8VGOGqD/XGgMAaydfO5xiMCczifUhDa4klnM
         emzhT17XdjRkb5e/cfZ3+RxtV5nzSOu514gFqH8qs94+3LDf+O5a+bk09ZQMsvpGkVrl
         Mksw==
X-Gm-Message-State: AOAM53359Xq82czxK3udl6WorUqwU0lp8Zfe6eyMq4DJQIL1XnC+3UyV
        Ujfr712Z8EIalB2TipY5W/xwcQSqKY78JMcZVAlxNA==
X-Google-Smtp-Source: ABdhPJzZV+e1UFgavtykineiuRZ18D0h683RmsaU4kIGW+k7U8arE7aPOvS325+KBzLbYn/obtxmBpD3rS4T2RCsBao=
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr8087059wmh.4.1596014045518;
 Wed, 29 Jul 2020 02:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200728100321.1691745-1-daniel@0x0f.com> <20200728100321.1691745-2-daniel@0x0f.com>
 <20200728191842.GB2778962@bogus>
In-Reply-To: <20200728191842.GB2778962@bogus>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 29 Jul 2020 18:13:54 +0900
Message-ID: <CAFr9PXkwpNAhQvOJFqLUm-uWoaH=nsNiq_y+OgTf8Z60i4RhRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: arm: mstar: Add binding details for mstar,pmsleep
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Wed, 29 Jul 2020 at 04:18, Rob Herring <robh@kernel.org> wrote:

> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +         - enum:
> > +             - mstar,pmsleep
>
> Needs to be SoC specific. Random collections of bits are never
> 'standard' from one SoC to the next.

I don't have a manual for any of the chips so I can't say for sure but
so far all of the chips in this group (ARMv7 based MStar/Sigmastar)
has the same layout for the registers i.e. the reset register,
the resume address registers are at the same place for all of them.

Does calling it "mstar,pmsleepv7" make more sense? I'm not sure what
to call it really.

> If your never going to have child nodes, then you can just add the
> compatible to syscon.yaml.

Considering the above would it make sense to drop the specific
compatible string for now and just leave it as syscon until there is a reason
to make it more specific?

Thanks,

Daniel
