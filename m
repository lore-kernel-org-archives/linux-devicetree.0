Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DE4C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 21:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 499C720CC7
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 21:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgGDV0V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 17:26:21 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:43988 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgGDV0V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 17:26:21 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C6C0520023;
        Sat,  4 Jul 2020 23:26:16 +0200 (CEST)
Date:   Sat, 4 Jul 2020 23:26:15 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
Message-ID: <20200704212615.GA1693435@ravnborg.org>
References: <20200704143544.789345-1-sam@ravnborg.org>
 <20200704143544.789345-2-sam@ravnborg.org>
 <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=YG64nluAAAAA:20 a=tBb2bbeoAAAA:8
        a=eaCYuVEjiU5D5XKsubUA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Oj-tNtZlA1e06AYgeCfH:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 04, 2020 at 11:03:21PM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> Thanks for your patch!
> 
> On Sat, Jul 4, 2020 at 4:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > Now that dt-extract-example gained support for using root nodes
> > in examples, update the example for the simple-frambuffer binding to use it.
> 
> simple-framebuffer
Thanks, will fix.

> 
> > This gives us a better example and kill a long standing warning:
> >
> > simple-framebuffer.example.dts:23.16-39.11:
> > Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> >
> > Note: To get the update dt-extract-example execute:
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > @@ -152,28 +152,29 @@ additionalProperties: false
> >
> >  examples:
> >    - |
> > -    aliases {
> > -      display0 = &lcdc0;
> 
> Why drop the aliases example?
I did not see it had any value for the binding that the example shall
demonstrate. But it was not somthing I have given much thought of.

	Sam

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
