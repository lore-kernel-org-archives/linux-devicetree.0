Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30916C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04B38208C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OOj04mF2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgBUTl7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 14:41:59 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:43187 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgBUTl7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 14:41:59 -0500
Received: by mail-io1-f65.google.com with SMTP id n21so3580298ioo.10
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 11:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WPEkVNQNo6+YwuuDTJ8f8LWVOUVBTxJ7HCWvWKezvwM=;
        b=OOj04mF2+3yRsYgUDM4psSLvDVhPp3+mkxUO1ZzxFRyV2BpOHmDVNSaSg0Nf+m0Jvv
         g0iOef6Ch4C7hb4JDOA4KgPfcuXgKOre6matGbVL9twWijFXGJ0NeeRfME4dB6V33VJK
         mrf7dJ5OaUo00VZfHhlyludpRW1y7L1C8zfQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WPEkVNQNo6+YwuuDTJ8f8LWVOUVBTxJ7HCWvWKezvwM=;
        b=Skbr0xq6kRb8VZpk/l/cZ112WjkIUTc0YanVTcSiz/jxQ1AcIspi8JGkUoG4EM3E26
         IOHnANffPr6yvjXzE8q3D3xC78Cm2toqN3FF33WkxLtSrnlq8+fdU0Unug4pej3lqrvE
         7Cd7OqgBE06rc+i6TfWo531Wlc563tA8XyAMR/mL5f9pHR50HK+ypM5+VOykjLk+cXeY
         VZbbsXMw5qcJ0NDDZppB30XxQj8te86jkTmkuFUDkGDJeTgJ7xRgko0s3gEVn7egec3I
         Q2r9ugoheaEa2ivIn4DeTfJ963TDDOrVQQXLCHKBxj0Du8xCBApI9lm+COIUdRizg7vM
         fHGg==
X-Gm-Message-State: APjAAAU7TetU95YGbbqHkGCpG3FBoSBPQy+XdkbLlsJhJw1N8nxcFhLw
        eby7p+Pro42CLngKnbKRkEuDTtFTI1HX9Lk/CNPqXQ==
X-Google-Smtp-Source: APXvYqyhv6yoRrvJUuENNKPAWV05pjT3Uyf9H3bCQETX5SOA9ofYJ2wSIn+d5yP6cxreX1ktp9sFgfx2+GHoYNL0c/U=
X-Received: by 2002:a6b:7117:: with SMTP id q23mr31725213iog.153.1582314118577;
 Fri, 21 Feb 2020 11:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus> <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net> <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
In-Reply-To: <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Fri, 21 Feb 2020 11:41:47 -0800
Message-ID: <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Evan Benn <evanbenn@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Because the ATF does not define standard wdt index, each vendor defines
> its own index.
> So I don't think that the current driver[0] can fully cover my usecases.

I think the best way to solve this would be to put the SMC function ID
as another field into the device tree, so that multiple vendors could
share the same driver even if their firmware interface uses a
different SMC. But they still have to implement the same API for that
SMC, of course, not sure if the Meson driver is suitable for that (but
if it is then I think merging those drivers would be a good idea).
