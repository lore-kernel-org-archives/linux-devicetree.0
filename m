Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24A2C2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88AB8206E9
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505178AbgDPLup (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 07:50:45 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:36032 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504790AbgDPLul (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 07:50:41 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 68EBC20022;
        Thu, 16 Apr 2020 13:50:35 +0200 (CEST)
Date:   Thu, 16 Apr 2020 13:50:33 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
Message-ID: <20200416115033.GA5785@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-3-sam@ravnborg.org>
 <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=6jNYHG2WMrghLeowZv4A:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
        a=cvBusfyB2V15izCimMoJ:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Linus.

On Thu, Apr 16, 2020 at 01:26:32PM +0200, Linus Walleij wrote:
> On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > Rob wrote:
> >
> >     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
> >     case found in dts files. We should fix that to dsi(@.*)?.
> >
> > See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
> >
> > Fix it.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> 
> I think I was instructed to use dsi-controller@ at some point but I
> suppose it was a misunderstanding.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

I have already applied this and most other patches.
I tried to post a follow-up on the first mail to tell so,
but it was flagged as spam.

So this and your other feddback from today did not hit mainline - sorry.
But thanks anyway!

	Sam
