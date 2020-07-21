Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE98C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 13:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B1F722BF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595339948;
	bh=gLckNsYh14wN8V0/tcKaLTFBild0sZAw45voTSmhvnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=uqz6ElzmZoF3Rt6Xssf5PYMZuejVzlyj3hxXIktXWyBrNL0DlNvVDEXNiKTzmfTbw
	 qQz1J9wqJzaDiX5+JplywPP19HSanR1BPkaaCnTbUydK4HclZB0lUfvo6Q986qs27v
	 jR+x3li+jvhIYi+H1P2NmKG/m6lMW3hM6lS3RTpI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgGUN7H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 09:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:45030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgGUN7H (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 09:59:07 -0400
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17DC521702
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595339947;
        bh=gLckNsYh14wN8V0/tcKaLTFBild0sZAw45voTSmhvnw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=X9FxBf1QQ/oRk1mNPAyeO6jF+3lE+IB1LXHzTVIG1Y3gHqr4T87aUHi3/B5wUUYUx
         LCFfGHdLluRywW6enRh3hoM8ZsJABI8agN6cDj6PHYtbPUHCEbdZEmw0hIRtLQDYZD
         E8f/sj5KP6gkVPp4357w2H7EDd48e+QHvQ8oiaBQ=
Received: by mail-oo1-f53.google.com with SMTP id a9so3928959oof.12
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 06:59:07 -0700 (PDT)
X-Gm-Message-State: AOAM531Yt2q7mCxyJQSzhElA/rOl6tWN/sLphauwbodXv8cxApMI3hyL
        Odjh/3kC61veLDK2SJlN6fv7pVFLI3lQgt6g0w==
X-Google-Smtp-Source: ABdhPJyYjl7WVU3V2AZbMxJnFr515YDrcWIxW4LtJAK9t6VjPhcMM208pWMsNHcf/mD8rUfmCCGlIjSTOP3WGaGGS84=
X-Received: by 2002:a05:6820:1015:: with SMTP id v21mr23488832oor.50.1595339946333;
 Tue, 21 Jul 2020 06:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org> <20200714071305.18492-2-wens@kernel.org>
 <20200721021026.GA3382460@bogus> <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
In-Reply-To: <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Jul 2020 07:58:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+=vOxCLNPwgj3yjphh4RpcXu9_0fW3QWL2+XGZQhChMw@mail.gmail.com>
Message-ID: <CAL_Jsq+=vOxCLNPwgj3yjphh4RpcXu9_0fW3QWL2+XGZQhChMw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color property
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 3:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jul 20, 2020 at 08:10:26PM -0600, Rob Herring wrote:
> > On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens@csie.org>
> > >
> > > Some LCD panels do not support 24-bit true color, or 8bits per channel
> > > RGB. Many low end ones only support up to 6 bits per channel natively.
> >
> > This should be implied by the panel's compatible property.
>
> I'm not sure it should, or at least it's not sufficient. Some panels
> while 24 bits capable might only have the higher bits connected to save
> off a couple of pins per color, in which case we should probably
> describe that somehow.

That's the bus/interface format which the 2nd paragraph said this was
not for. If it was, then just bits per component is not enough.

Rob
