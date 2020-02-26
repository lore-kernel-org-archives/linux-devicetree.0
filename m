Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98156C4BA10
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 13:58:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CEA22467B
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582725494;
	bh=1BoQ1ecJ5wWFRscOk4MkaHRIh59ebxQ/fwLgAw2SktQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=wmDoxj4U2JhyHhfSLxJ3doMG2+WJtKuNujOw13aonKAgQE1jB38o1zUbHV2NtSSu0
	 /xwB0b01hnjtbnLffgd6tIPshB1ejXXO37XDbh3+oqa2+6CNtcXBsx2+4I355ggw/+
	 G2Af8jnH5UtMTL7GSWOT00KfEZXQKX4DjrCawHzE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgBZN6J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 08:58:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:55666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgBZN6I (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Feb 2020 08:58:08 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D96ED24683;
        Wed, 26 Feb 2020 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582725488;
        bh=1BoQ1ecJ5wWFRscOk4MkaHRIh59ebxQ/fwLgAw2SktQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kiInuYh09C2QC5cNT3mdJz8GNahm52aQa7QJYkvL75ZFDriYxWqKvuJmMUFawShf4
         yrCRAeioABGvO5xNh4csbP8tWzx9hbZi9/CgSGPiblG9gkU3tyKQTLSxawYaiaNTVQ
         GjHcSnzOio2utOm5dIOtdJHeglqyc40tMutmEn6g=
Received: by mail-qt1-f172.google.com with SMTP id g21so2249618qtq.10;
        Wed, 26 Feb 2020 05:58:07 -0800 (PST)
X-Gm-Message-State: APjAAAWt8PsLBYZW0hCRXagurUcokouvw+SCkhywP+zzcsaZHdNnaNhk
        0M2UiGj6zWVKS6icu+ePgA5v0+QKN9kJC3oLFA==
X-Google-Smtp-Source: APXvYqxao0W/HExVXKLi5ITPoZ8h7I5256qJQ9b+gunDaYgcb4hhUH7vaGwpD+ncnnoclnVnlyafJRsT8mcCwERi+84=
X-Received: by 2002:aed:2344:: with SMTP id i4mr5644462qtc.136.1582725487044;
 Wed, 26 Feb 2020 05:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20200224211035.16897-1-ansuelsmth@gmail.com> <20200224211035.16897-2-ansuelsmth@gmail.com>
 <CAL_JsqL7hAX81hDg8L24n-xpJGzZLEu+kAvJfw=g2pzEo_LPOw@mail.gmail.com> <007601d5ec0a$fc80df70$f5829e50$@gmail.com>
In-Reply-To: <007601d5ec0a$fc80df70$f5829e50$@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 26 Feb 2020 07:57:55 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qSoy9ouYFg8pxRMT+fLwUqYCU85u=mYHnBioqhFpZGQ@mail.gmail.com>
Message-ID: <CAL_Jsq+qSoy9ouYFg8pxRMT+fLwUqYCU85u=mYHnBioqhFpZGQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] Documentation: devictree: Add ipq806x mdio bindings
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 25, 2020 at 12:40 PM <ansuelsmth@gmail.com> wrote:
>
> > On Mon, Feb 24, 2020 at 3:10 PM Ansuel Smith <ansuelsmth@gmail.com>
> > wrote:
> > >
> >
> > typo in the subject. Use 'dt-bindings: net: ...' for the subject prefix.
> >
> > > Add documentations for ipq806x mdio driver.
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > > Changes in v7:
> > > - Fix dt_binding_check problem
> >
> > Um, no you didn't...
> >
>
> Does make dt_check_binding still gives errors?
> If yes can you give me some advice on how to test only this since it gives me
> errors on checking other upstream Documentation ?

Don't use linux-next. Linus' master is only warnings. If you have
errors on that, then you may need to update dtschema.

Also, using 'make -k' helps if there are make errors.

Rob
