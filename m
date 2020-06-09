Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B2CC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 22:24:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C63902072F
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 22:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="oaOHAz4d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgFIWYC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 18:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgFIWYB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 18:24:01 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B229C08C5C2
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 15:24:00 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h188so261392lfd.7
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 15:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKvNER5A2IjwZIxC0Xlq5AYP9JFJKTf7sG0leVqyGrc=;
        b=oaOHAz4dKwt88LzJ1VuawMYuOi7CgKdkOWayyJ+QbOEn/DxrkZDPjmgBlPltn0MKCu
         H1W4u8Epzv5jWO8f2wNpf0//ibtQYtMBEXuxCa9Cx1whHO3lx3FKNskAlnY1hhGrrLx+
         L2v5EYNNIciwj0dCDP90ZR7ySpvbQ0zGd1MY8N6uHgLgwYasPE1Ljxo6z22bzd2GmFOD
         NdbfDnAa6G7PZa7oEvWbU3NLQCAE9wQSquwiWJ0TtNP8CfHnWtLTBhnLJB537YVPM8nx
         xu0v7/5ckE0iUzGP7Ygxs94HQLM+lH+qeeXnGgTJ7f1G6fA3XD2TvHLYYB5qQ0yja6EB
         3Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKvNER5A2IjwZIxC0Xlq5AYP9JFJKTf7sG0leVqyGrc=;
        b=lM+Y/WzCyvT6eaxKV6OPRGsjz39t4CznvHraf4zHGQwsE7RIF8IwIi4Ay1MdkjvL+d
         itRh3R8Se9C6ds/EX+o/GIO8jdNQYuuaEHgEkodQM5Tu+ovbeUmhaiM7FQejCu7qYY/r
         5DVbv9do2htWuTJjY8xAr58j/EYy1Sc+yzY7ruGXw6GtcysDtuY3EP5w4Mk5AdaDt4DE
         +ROm/krJv5z6yFCYMrtYYue2U5K676HUr2eroM50k0sCM+qpyWd7szjah2Me4DKE759O
         o5GNeWIU2mqnUESSsgibVwWQidhlZztGGNNn2rD9bvva1B8+aI91IjVODnfkTA+uoh7W
         eqsg==
X-Gm-Message-State: AOAM532WStT3GmqXmTg673IzBN7s846uB1yTJuhMhqLT6Ssrg8qDga4u
        RI/C+1DPpSTt50UQCLe1IzkxF++Tp5pwfV1ClDHbRApB
X-Google-Smtp-Source: ABdhPJzPNL8NXYEPrzmlBn0JJ/YPzOMPrtv7DXBfa4e21zWSXb2c2IGQ2jq4fuvlYNhciR3LKtdCTrYMNq+y0ZJLbx8=
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr53671lfn.10.1591741439138;
 Tue, 09 Jun 2020 15:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200530123222.361104-1-kevin+linux@km6g.us> <20200609221401.GA1492918@bogus>
In-Reply-To: <20200609221401.GA1492918@bogus>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Tue, 9 Jun 2020 18:23:48 -0400
Message-ID: <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
To:     Rob Herring <robh@kernel.org>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 9, 2020 at 6:14 PM Rob Herring <robh@kernel.org> wrote:
> > ---
> >  .../bindings/rtc/abracon,abx80x.txt           |  6 ++++
> >  drivers/rtc/rtc-abx80x.c                      | 34 +++++++++++++++++++
> >  2 files changed, 40 insertions(+)
>
> Binding should be a separate patch?

Indeed, it was re-sent with the patches separated.

> > +All of the devices can have a 47pf capacitor attached to increase the
> > +autocalibration accuracy of their RC oscillators. To enable usage of the
> > +capacitor the following property has to be defined:
> > +
> > + - "abracon,autocal-filter"
>
> Can't the standard 'quartz-load-femtofarads' property be used here? You
> might not need to know the value, but presence of the property can
> enable the feature.

On these devices the capacitor is connected to the RC oscillator, not
the crystal oscillator, so this property is controlling a different
function. I'm certainly open to suggestions for different names for
the property if that is desired.
