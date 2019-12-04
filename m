Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0945C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 20:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D649207DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 20:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfLDUPA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 15:15:00 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:50772 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfLDUPA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 15:15:00 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 572C120067;
        Wed,  4 Dec 2019 21:14:54 +0100 (CET)
Date:   Wed, 4 Dec 2019 21:14:52 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20191204201452.GA30193@ravnborg.org>
References: <20191119231309.18295-1-robh@kernel.org>
 <20191130194337.GE24722@ravnborg.org>
 <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=VwQbUJbxAAAA:8 a=zu6OG0ZhAAAA:8 a=pGLkceISAAAA:8 a=ak7PtswyECe1Mw--VqQA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
        a=pAN39diAhXWuPx0-Vjn3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

On Mon, Dec 02, 2019 at 08:38:39AM -0600, Rob Herring wrote:
> On Sat, Nov 30, 2019 at 1:43 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Rob.
> >
> > Thanks for doing this boring, trivial and tiresome task.
> 
> It was somewhat scripted at least...
> 
> > On Tue, Nov 19, 2019 at 05:13:09PM -0600, Rob Herring wrote:
> > > Convert all the 'simple' panels which either use the single
> > > 'power-supply' property or don't say and just reference
> > > simple-panel.txt. In the later case, bindings are clear as to which
> > > properties are required or unused.
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > So Thierry and I ended up as Maintianes for them all.
> > I gues thats OK as we look after the panel stuff anyway.
> >
> > > ---
> > > We could perhaps consolidate a bunch of these, but I have no idea how
> > > accurate some of these are WRT what's required or not. Seems strange
> > > that 'backlight' is optional unless the backlight is tied full on for
> > > example. If that's the case, then should backlight ever be required?
> > I do not really follow you here.
> > Looking through the patch set things looks normal to me.
> >
> > What do I miss here?
> 
> I'm saying a bunch of these could just be a single schema doc with a
> long list of compatibles. The variation is in what properties are
> required or not.

It would be just wonderful if we could have only a few
dt-bindings for the simple panels.
Like you I cannot see why enable-gpios should be required.

We could end up with something like three classes of bindings:

+required:
+  - compatible
+  - power-supply

+required:
+  - compatible
+  - port
+  - power-supply

+required:
+  - backlight
+  - compatible
+  - port
+  - power-supply

The port part is to my best understanding a way to
connect the panel to the display driver.
So it should be more how the connect in the binding
that decides if port is used or not.
And the panel should not require it.

I may use it with display drivers that do not support it
in their binding.

And then we have backlight - which can hardly be mandatory.
The panel could hard-wire it to provide backligt if it wanted
and the binding should continue to work.
I think you had the same argument.

So we are down to two required properties:
+required:
+  - compatible
+  - power-supply

Could we put all simple panels in one binding file
with only this - that would be great.
Hopefully scripted somehow...

Then adding new simple panels would be a matter of
adding a new compatible.
And if they are sorted this should not cause many merge issues either.

I hope I understood you correct.

	Sam
