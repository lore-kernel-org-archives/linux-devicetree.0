Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C933C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 18:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA403207F9
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 18:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="gdKqYos2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbgFWSw3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 14:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733075AbgFWSw3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 14:52:29 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A61C061795
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 11:52:29 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 18so3056460otv.6
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o0ZyZBP3R+xTsYbXudhPpeqGQTx9+AtNXicoVw+deco=;
        b=gdKqYos2nRamqmG/sd35v1EqNpbtG3PgDZ2E/tKpeKaJVjd4jrL/oqg/dsC2xdGuAe
         Qkmdffu9YfXVdVYSddOShypUzRWjTKVlWLxPdP9yqsTz7molW/pzEeuAUYju9xxAAcgq
         K9PUEARzddqf1oxlK1zqzhgkwo5t3CaCemnRymg8KwkEqU7p7N3RD7ihuegY7ql0WoV3
         wjKEEeyegTPJ83s8obqhz7P1ZUyNxmBRgaipBT18usGwYxJmZsAdpWUD/5X6ZIeQl2Hj
         08RzZPNIT6yNJJQoLxFURJfHOBxXMLf5g6IcnutbZvEmXa7QXH5+blWDmvXQB3xaOTrw
         xWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o0ZyZBP3R+xTsYbXudhPpeqGQTx9+AtNXicoVw+deco=;
        b=L1nhDJKMcUch0D7mrhBhiQ+pNUpSUhrCknWlNckEjTWhE2c55Q1dsmEFnn6AJCuJEo
         vR0W0rpttqL++FJABM5Xq75ChSInTCFqID5lgWEK9mZBkUYB24tIHPzcK6zO19YO6+Qn
         JPO9FntRQRho/W6iy+ZvgXXMBB5Hc1y4TPxhI84b7J4W3ioVh+QTPUcNZWcw6ekQwz/t
         iErOlqjacfm4rUwp49eQ1Rb62RhBb+kWzb8U8KrctmDPAUoOxI6XVdPbp00cj0nHxAhw
         5ygjHNux/V6TsJREOMmOvQYCqN/hwDFjpADM4AgyAQCffwknulqRl5jCWLqC5PZG4mg/
         cHyQ==
X-Gm-Message-State: AOAM532AzVFRSDk2doc7nwWsGFCRdJ4yr0Sk6Zu9L1idkm+bn8kzIs26
        0aS910Ppyia2KZtcmOT8R0X7uR0mMBsJIDtyS/RaHg==
X-Google-Smtp-Source: ABdhPJzp+aM0LlFXFQjN4tMW0nFimdEGTUlw1nniLZRr8VJRCoJV2HqfPjDySP2P6IFuViQjezhymY70H2D/O0Ud/6Y=
X-Received: by 2002:a05:6830:210d:: with SMTP id i13mr18314198otc.252.1592938348318;
 Tue, 23 Jun 2020 11:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <1592937087-8885-1-git-send-email-tharvey@gateworks.com> <CAOMZO5CbLvf_iV5K1zXZdYqgpBqrOZmTGR=NYyL+j73ojTGOnw@mail.gmail.com>
In-Reply-To: <CAOMZO5CbLvf_iV5K1zXZdYqgpBqrOZmTGR=NYyL+j73ojTGOnw@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 23 Jun 2020 11:52:16 -0700
Message-ID: <CAJ+vNU19ebj3xpOKxeHMzdMQjVdZoJCTFJ5DSYat7U4tpZTWvQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ARM: dts: imx6qdl-gw551x: fix audio SSI
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 23, 2020 at 11:41 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Tue, Jun 23, 2020 at 3:31 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > The audio codec on the GW551x routes to ssi1
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
>
> Shouldn't this have a Fixes tag, so that it could be backported to
> older stable kernels?

Fabio,

Yes, it likely should as it fixes audio capture from 3117e851cef1b4e1.
I didn't think it would apply cleanly to stable but it looks like it
does.

I cc'd stable@vger.kernel.org. Should I submit a new revision with the
following?

Cc: stable@vger.kernel.org
Fixes: 3117e851cef1b4e1 ("ARM: dts: imx: Add TDA19971 HDMI Receiver to GW551x")

Thanks,

Tim
