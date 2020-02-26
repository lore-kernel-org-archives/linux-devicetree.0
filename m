Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55211C4BA24
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 19:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A2BA24692
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 19:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dWcCF8s4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgBZTbD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 14:31:03 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:39697 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbgBZTbD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 14:31:03 -0500
Received: by mail-io1-f65.google.com with SMTP id c16so416335ioh.6
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 11:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MFxJeomCczgXDzeNV9Xn+RHt64mPvJ12qZr3RbPrbU=;
        b=dWcCF8s4J9A+iP2iXoWcm3srPwjEatU3HdSYDIVsbNOiHHd7MtnwyuiE9mCNcHaGU0
         qwCoH2p/6/qrCzG/i3ueu4EZqypRCXV4NQTLYaswGjHLOJWyjjeUM9SXiYcQxeTrcELD
         ACUWcICt+Ximqv6VZnywYGgK6FeUCdHP4Ttig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MFxJeomCczgXDzeNV9Xn+RHt64mPvJ12qZr3RbPrbU=;
        b=T4DirmZBhgAZd8R2BPnOS8wXKCgDHFmr9pK3ZyKiRMefxZGg8W25IuSAJAYqH6wL+x
         v0yj+osQSfm+pRwa64/8SnVclVN3G8LqN3SNXK8KYlq7G0RdfH76WFbbua+T+O1PoaSX
         kw1J0EmeL7e3x9xOsdKIAN9J7a5k32rz/krMd4hKYdhYLGJL3dquuFsBQN2Ta4MdLnVh
         bExrU+LAPUcwDP/P4turo6HH2yr40/81KOBJOSIR3vLQ5cAzJFxvSELGYHR1RlPNzWW1
         TEIiXV/pzwUOtytp7ygDMIP2GMcO87HBFVIFpIsfaW2YOE2sZpeNhmLLymtBtHL03/LL
         9aoA==
X-Gm-Message-State: APjAAAVskHDZffeoiTDE10aWvdzXlEfEC7xjO8R306BSLV4dbjIrCJ2F
        ATB/7m1hDAW9ed6EGwtupqwzm+ipmajUuoAm+jicZw==
X-Google-Smtp-Source: APXvYqwm7wEEXPS3MuEPhTwwGRUEbcd/4WOJm2XgfK0kRKisj4w+h5pA1wDFpztH3aEcTh+AhwR4v0v1+qCPqLGRK8w=
X-Received: by 2002:a5d:8955:: with SMTP id b21mr146927iot.41.1582745462529;
 Wed, 26 Feb 2020 11:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org> <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
 <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com> <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 26 Feb 2020 11:30:51 -0800
Message-ID: <CAODwPW_FR0gHO_=yfCPwETXvKG9CvgvPddX-EOT=OXDPEkp_Kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Not quite. /firmware is generic container. I'd expect another layer in
> the middle for the overall set of Mediatek firmware behind smc calls.
> Look at 'xlnx,zynqmp-firmware' for an example.

There are no other MediaTek firmware interfaces described in the
device tree on those platforms. Is it okay if we just call it
/firmware/watchdog in that case?
