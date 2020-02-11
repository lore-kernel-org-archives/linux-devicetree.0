Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0030DC352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 17:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC76420848
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581441333;
	bh=NFP+GkcvKn1TghMtqg0aTQVPXT827ABPxl10ddw+pB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ozjLNOiQpPOZzu9uozTmry9K5AwpWJNUTAjr7AiY3k2UNQS+Kac0p/k/TL7np5/Q/
	 I8Y1QX9Cq7t3Lnqy0HT20gQzydEz8WtZuMvUsy+dtVdHjHITLpJSP9YZNb7ID8jcob
	 y77VD5SPLym/A8Ln73k+HzPfquPvwveMvBHeRfeE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgBKRPd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 12:15:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:43066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728078AbgBKRPd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Feb 2020 12:15:33 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 841CD20848
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581441332;
        bh=NFP+GkcvKn1TghMtqg0aTQVPXT827ABPxl10ddw+pB8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bJlPHF1EJvyFtpSwsCbRnoZQHUIHwO46rSG1klBJVb2IavJW8USQPuVo+Tg8hR9Ul
         axzP/wm0T07aOaZLdIKAxhpmI911F3ScoZt4e5DrFHsm8KkIDt1Dzk7xxMS/PLaXUb
         E7gvX/LoxIWXmyXwvkFECKjFzAuDmqe7xmEkWZQw=
Received: by mail-qk1-f179.google.com with SMTP id g195so10780076qke.13
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 09:15:32 -0800 (PST)
X-Gm-Message-State: APjAAAWqGQHGfgJmp9MLIvFmgoF7tMZQfra6pIQkb/ZIFKwirk2Vmhc7
        cwdtzKw6wxaPsRvDdb4V5lhpOA/Lknbrvl9MXA==
X-Google-Smtp-Source: APXvYqyWKQeqpFVRNZhOQFHnvB0d/oetTLA9uewWxSJnz33oLogqcGENofESStJaAB8QilLhPv/RwlBh325G2oQpd2k=
X-Received: by 2002:a37:6457:: with SMTP id y84mr7310974qkb.254.1581441331614;
 Tue, 11 Feb 2020 09:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20200206113328.7296-1-bage@linutronix.de> <20200206113328.7296-2-bage@linutronix.de>
 <20200210074310.c6adwjegqouzs6uc@gilmour.lan>
In-Reply-To: <20200210074310.c6adwjegqouzs6uc@gilmour.lan>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 11 Feb 2020 11:15:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ3QCMFygQiKMvnPQ8wJALaKtPS4ykZKA1vgzbo8wSY5A@mail.gmail.com>
Message-ID: <CAL_JsqJ3QCMFygQiKMvnPQ8wJALaKtPS4ykZKA1vgzbo8wSY5A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: Add vendor prefix lx for Linutronix
To:     Maxime Ripard <maxime@cerno.tech>, bage@linutronix.de
Cc:     devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Benedikt Spranger <b.spranger@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 10, 2020 at 1:43 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Thu, Feb 06, 2020 at 12:33:23PM +0100, bage@linutronix.de wrote:
> > From: Bastian Germann <bage@linutronix.de>
> >
> > Add a vendor prefix for lx, known as Linutronix GmbH.
> > Website: https://linutronix.de/
> >
> > Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
> > Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
> > Signed-off-by: Bastian Germann <bage@linutronix.de>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 7fcd48adc276..f6fea38b0848 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -561,6 +561,8 @@ patternProperties:
> >      description: LSI Corp. (LSI Logic)
> >    "^lwn,.*":
> >      description: Liebherr-Werk Nenzing GmbH
> > +  "^lx,.*":
> > +    description: Linutronix GmbH
>
> Vendor names are usually either the vendor name itself or the stock
> name, so you should really use linutronix here

Good point.

I hadn't pushed this out, so I've dropped it until sorted.

Rob
