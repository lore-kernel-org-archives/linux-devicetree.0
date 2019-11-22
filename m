Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B0FC432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 15:43:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 993602072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 15:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAGbQgf1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKVPnZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 10:43:25 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40121 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfKVPnW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 10:43:22 -0500
Received: by mail-lj1-f193.google.com with SMTP id q2so7901030ljg.7
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 07:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQzy1iQq7/UigF4z8t1UMdfHuT9DigedXPRNYTx8QBY=;
        b=XAGbQgf1cU8rD/kywGu8E//J0deKp6oSzrY4nW/7iQnOC7Z85qIiCXWxldnCOmfQM0
         5rD4pSqDLOxxYiQ22XtpA+ZQtIqNcfUSFvLURlIPtJQVgPu6ai8DLyrFL71pg9GiQ9pG
         J3lCWTccy2Ay+ptCBd2t+/YVxqaTPHmAVMWaO+1JJ8kbJonQBCsyOGxhUYGEl3GzmSzI
         ho5z7STf9Rfad2+G+J/cpfc9GQGp4z9GERHGxEaTUbyQm6+2MI6V46dhpZKOLPjpFlk3
         RbOEvF5G831FamUvktmD2bDhXniv+mEfiO+c9474NZJJF1jmAgNlIrUF58CkzGAeBa0J
         jdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQzy1iQq7/UigF4z8t1UMdfHuT9DigedXPRNYTx8QBY=;
        b=UsKxVlCquW91gpUJK+Lnzm8BHC0hcBbnJX4/P98v3NA3aXpt8P+C7kpzUTD0ajFGK1
         kO1srRx+FgHPwPCi5EvNMft5mDvls1Yl3e92MitxmFNpHFf3vFMalAVvnMai4xrFcev/
         T8bgrfDODGKEeztBSsqUGV1Evj9JQHVmiZx0ng1pdSg1YJN1HEHxFPyjgQ6dAKbaj/uw
         9Egc93XY7d4VuXOUArTbXQqf0MBI4A5VsgXXEi1B5U+76oW07eh/xGLBqPdeCAvQ9hxt
         pwqgOWA3rBp9dpg6MjbQidJkIV6WAet55GPSnbXG4bqZbH7dvp6inW/V5AJdhYlrMbc5
         3BbA==
X-Gm-Message-State: APjAAAXnerVpifPVxSFIVg0G5dIVMi79TedfFXi/SpRMi1+07itNcEk9
        SzxK8w0203wgNY93cShVFeUVMogcF3RF5DE2jSHksA==
X-Google-Smtp-Source: APXvYqwcugeW4edWhYbow6P3IthY8AWt+/SiEG9o6A9ekVZjqmWysrxtVlxvnwXZwUzSHLS/mgbF3SgO93jwQdxuQ3k=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr536136ljm.233.1574437400356;
 Fri, 22 Nov 2019 07:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20191120181857.97174-1-stephan@gerhold.net> <20191120181857.97174-4-stephan@gerhold.net>
 <CACRpkda-rm=1hz_p2YCqBVgxsM9cmKYJVUg+T91MyBrgmtDP-w@mail.gmail.com> <20191122140944.GA2872@gerhold.net>
In-Reply-To: <20191122140944.GA2872@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 16:43:08 +0100
Message-ID: <CACRpkdYfUikKaB-9HO_heLZrGC346XZVKxvifMPJizeYSPjShg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: Document compatibles for Ux500 boards
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 22, 2019 at 3:10 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> On Wed, Nov 20, 2019 at 09:22:19PM +0100, Linus Walleij wrote:
> > On Wed, Nov 20, 2019 at 7:20 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > > The device-specific compatible values used by the Ux500 boards
> > > were not documented so far. Add a new simple schema to document them.
> > >
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> >
> > Nice, thanks!
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > I expect Rob to merge these patches as they are bindings-only,
> > alternatively I can take them in the Ux500 DTS pull request
> > for the next kernel cycle.
> >
>
> For this patch it would be easier if you take it through the Ux500 tree,
> as I have another patch series that adds a new board to it.

OK I applied it for v5.6 on my ux500-dts branch.

> The vendor-prefix patches are independent, so Rob can merge them if that
> is easier?

Let's see if Rob wants to take them, else I will merge them as well.

Yours,
Linus Walleij
