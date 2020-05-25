Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DB3C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 11:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 110B520723
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 11:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MC3AAGzO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390142AbgEYLk6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 07:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbgEYLk6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 07:40:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED72C05BD43
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 04:40:58 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bs4so14769798edb.6
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3R2hnooSzZvAs9d5orE428NFg7oFKj14M/PhRYnHm+g=;
        b=MC3AAGzOyJf040Y5J3twKH/Sv4rtqfMp/QAbQ28YTdMp5ienj9Xx89GxVsmpo6R4RU
         xbqTu9jyRrn6eMpB4gjnN/EfiCIlmIc6IkI08/8jNsEc2e4uVHoBrSrarbtgwGPC0mEC
         nmU+6OtECbU8BiKJfqjwDFRcHy7VuOPsoRBEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3R2hnooSzZvAs9d5orE428NFg7oFKj14M/PhRYnHm+g=;
        b=R+WAIsAtvMyh3Z/6vdISTSq1WFmjTCDfL2aHHrtjGQXSLxEGgcZv+cIMyN/o90tB4I
         u+rgAXqqS6qeOkE9EaKRYYOlcRsGJ7sfPVXmnpo4E+BlOgI/5U19ySPmCg47NwmLh8Jv
         Ep8BIuoruHVigJ8DT3gwq6xH7YDIpYiz84YjH7bkNR+BJnWWYK4Gf5faX4AqOVXJyIDP
         WcB5Qvw8dbJEctctLWnzTjbd2CELUlFqqLUnMP0iwDY6eEiqYcQPHR2YGf43lqoDKGm3
         LKw85pgR/FcLA1NUqkkgbuql4FWxDdDN4MAmbLZY2tlbW5D1YI8/hV90tfyHAxkyV/Yf
         ET8w==
X-Gm-Message-State: AOAM532gDcK1LrLVHnfJ56Iw4sjE12JeRYbXw0Y3xOoEeSsJRrkrrJjO
        htGTqxsG107Yu/5gzXJACwYMjK+f1xZtaA==
X-Google-Smtp-Source: ABdhPJxFb5XF+ksj6W/ZKG/gIXjOgybas2fdFBs7u0B1Ypsxy8PBj8ONZSCqjuVCjJBYbA8q1Fdfnw==
X-Received: by 2002:a50:ec8d:: with SMTP id e13mr15531331edr.8.1590406856450;
        Mon, 25 May 2020 04:40:56 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id y66sm7906713ede.24.2020.05.25.04.40.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:40:55 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id i15so16751499wrx.10
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 04:40:55 -0700 (PDT)
X-Received: by 2002:adf:92a5:: with SMTP id 34mr15165420wrn.415.1590406854796;
 Mon, 25 May 2020 04:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com> <20200519084833.GH1094@ninjato>
 <20200522150037.GF5670@ninjato>
In-Reply-To: <20200522150037.GF5670@ninjato>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 13:40:42 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CdmcYpSLsgOPJqo+=kOYundF5NZua4QpdOTTWYSYAopQ@mail.gmail.com>
Message-ID: <CAAFQd5CdmcYpSLsgOPJqo+=kOYundF5NZua4QpdOTTWYSYAopQ@mail.gmail.com>
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in adapter
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 22, 2020 at 5:00 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Tue, May 19, 2020 at 10:48:33AM +0200, Wolfram Sang wrote:
> > On Tue, May 19, 2020 at 03:27:29PM +0800, Bibby Hsieh wrote:
> > > Although in the most platforms, the bus power of i2c
> > > are alway on, some platforms disable the i2c bus power
> > > in order to meet low power request.
> > >
> > > We get and enable bulk regulator in i2c adapter device.
> > >
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> >
> > Applied to for-next, thanks! I added Tomasz Rev-by: for you.
>
> Reverted because of regression reports in linux-next. I am all open for
> the change in general, but it looks to me that we should wait another
> cycle.
>

Thanks Wolfram and sorry for the trouble.

Bibby, I think we need a bit more thorough testing. We can discuss the
details offline.

Best regards,
Tomasz
