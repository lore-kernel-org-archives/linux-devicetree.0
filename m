Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F77CC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 07:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DEA9204EC
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 07:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgHLHe6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 03:34:58 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:40164 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgHLHe6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 03:34:58 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 63B1920025;
        Wed, 12 Aug 2020 09:34:55 +0200 (CEST)
Date:   Wed, 12 Aug 2020 09:34:54 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253
 bindings
Message-ID: <20200812073454.GA584918@ravnborg.org>
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
 <20200721083228.GA283099@ravnborg.org>
 <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=KXZ1VkjrvZVwxbFKkKMA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Linus.

On Wed, Aug 12, 2020 at 08:48:42AM +0200, Linus Walleij wrote:
> On Tue, Jul 21, 2020 at 10:32 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > > +description: |
> > > +  The Kinetic Technologies KTD253 is a white LED backlight that is
> > > +  controlled by a single GPIO line. If you just turn on the backlight
> > > +  it goes to maximum backlight then you can set the level of backlight
> > > +  using pulses on the enable wire.
> >
> > No $ref for common.yaml?
> 
> Since this is a backlight, and we do not have common bindings for,
> backlight I first looked into using the LED bindings in
> ../common.yaml, but that has several problems, it cannot really
> be used for backlight. Backlight doesn't have "triggers",
> patterns, flash properties, the function is also pretty much
> evident.
> 
> So I will look into creating a new common for backlight.
Hmm, I think I looked at leds/ when I wrote that comment about
common.yaml.

Please consider Rob's comment in commit: 44e1655a444fe7a1bd81994d34c6bbb5245b9e60
("dt-bindings: backlight: Convert common backlight bindings to DT
schema")

Rob did not see the need for a common binding - but that may change as
we add more backlight bindings.

	Sam
