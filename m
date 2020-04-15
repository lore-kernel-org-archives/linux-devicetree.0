Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAA1C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 23:49:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B3E62078B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 23:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hymJOGYO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389516AbgDOXtR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 19:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733274AbgDOXtO (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 19:49:14 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734BDC061A0C
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 16:49:14 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id t8so2148713uap.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 16:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+3cVFHINQK8034Q5fMosJmLqjR0x/8UAQMOjZSVJrM=;
        b=hymJOGYOl8wyGrt54ea9ETuKrBuw+wFtIDoosE9VbbTh3G2do1iFapNRgpRzht7cF+
         1h4tsTDnwoUY7vgAf0B6t9n+FyslLxRcQhLeXANSqSnY1BwHGWOO/CGr+ch7TrC7Y1be
         poo1PAE0JVXRF1RDYuyH/o1HSC4r+3OiFuCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+3cVFHINQK8034Q5fMosJmLqjR0x/8UAQMOjZSVJrM=;
        b=M8kAjGfpprNz33auV4st8qv1m7h4jXRtl5HSl1XyJJ7dy/LSRUY6gtgfGQwSV1R/Bc
         sfXLkqCkhmfY37kPa2l/HWZ2cyudWihqIeWf96I3VAjKZAUBcf3RzzJQ5PFS7z9uX9ej
         fkcqXWwjZ9+MwW6U9XV9GUK9txO4xCDMzzhEvbbyVVeRuVD5f0a3NbT0fPknXHi5kqk6
         3yeNgGXRooSwKY91JNoa5SZNb84TIGUOSAXJw1xUSZ77LV87Vs+F2ViUdeh+SadXN/xM
         HBNSF3pTNTV6hsJ5dUiri8Bm29IzPlMIF/grs48eCkvDcvPI8IrIFfrok/2zJnY5avIF
         pfRQ==
X-Gm-Message-State: AGi0Pua4aBiVBS8jUo725PZD783yygQL295PnMYzaSkueUNi/KseTBDW
        cYKMz+5imlT8dpg5M53R8/VfebKYfCs=
X-Google-Smtp-Source: APiQypLy5Js5FjZGrf8WPk1uhSAyuvRaDMyWQ3JrMce78CYIty01c7H2b/5o3m07nwgNTiXNRg6Plg==
X-Received: by 2002:a9f:31d3:: with SMTP id w19mr6682655uad.140.1586994553223;
        Wed, 15 Apr 2020 16:49:13 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id x26sm5374887uai.0.2020.04.15.16.49.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 16:49:12 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id g184so1282428vsc.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 16:49:11 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr7126201vse.106.1586994551498;
 Wed, 15 Apr 2020 16:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com> <20200415203256.GP4758@pendragon.ideasonboard.com>
In-Reply-To: <20200415203256.GP4758@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Apr 2020 16:49:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Message-ID: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Apr 15, 2020 at 1:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> > Quoting Douglas Anderson (2020-04-15 08:48:40)
> > > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > > example.
> > >
> > > NOTE: The current patch adding support for hpd-gpios to the Linux
> > > driver for hpd-gpios only adds enough support to the driver so that
> > > the bridge can use one of its own GPIOs.  The bindings, however, are
> > > written generically.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index 8cacc6db33a9..554bfd003000 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -60,6 +60,10 @@ properties:
> > >      const: 1
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  hpd-gpios:
> > > +    maxItems: 1
> > > +    description: If present use the given GPIO for hot-plug-detect.
> >
> > Shouldn't this go in the panel node? And the panel driver should get the
> > gpio and poll it after powering up the panel? Presumably that's why we
> > have the no-hpd property in the simple panel binding vs. putting it here
> > in the bridge.
>
> Same question really, I think this belongs to the panel (or connector)
> node indeed.

Hrm.

To me "no-hpd" feels OK in the panel because the lack of a connection
is somewhat symmetric.  Thus it's OK to say either "HPD isn't hooked
up to the panel in this system" or "HPD isn't hooked up to the bridge
in this system" and both express the same thing (AKA that there is no
HPD connection between the bridge and the panel).  In the case of
"no-hpd" it's more convenient to express it on the panel side because
the panel driver is the one whose behavior has to change if HPD isn't
hooked up.  The panel datasheet is the one that says how long of a
delay we need if HPD isn't hooked up.

...but when you're talking about where the bridge driver should look
to find the HPD signal that it needs, that really feels like it should
be described as part of the bridge.  Specifically imagine we were
using our bridge for DP, not for eDP.  In that case simple-panel
wouldn't be involved because we could get any type of display plugged
in.  Thus it couldn't go in the panel node.  Here it feels clearer
that hpd-gpio needs to be a property of the bridge driver.

Looking at other usages of "hpd-gpio" in the kernel, it seems like the
usage I'm proposing is also common.  Grepping for "hpd-gpios" shows
numerous examples of "hpd-gpios" being defined at the display
controller level and (effectively) I believe the bridge is at the
equivalent level.


-Doug
