Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C6AC4D2EF
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5549624717
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="F/Uy17ys"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbfLMUPw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 15:15:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56084 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbfLMUPw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 15:15:52 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so68323wmj.5
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OSjOeT8G41sJUMcGNxAsisj1FiAyZ8f/rHyI40o7EdQ=;
        b=F/Uy17ysVsCxX3vbmQdR9X3Li0fixrsi063fSRObadKL2Wtyc6qZSMbdWVZFW4rd7C
         8dsTaWvnCrnAoEiK+2U8PpopCRm/vseai0riI2WN0irMYcSt/EE8cfY+2lhPb38ceG5n
         s7XddZQDv1gaN5YJmmD822xxN+g2JYoGg5vrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OSjOeT8G41sJUMcGNxAsisj1FiAyZ8f/rHyI40o7EdQ=;
        b=LLEEUv5uLLCzc24V26P6ptI0Iz+lqUM6F+GhT15xZRC1ElokOPzmTowtq6k+4pHhM4
         qLXHI5/OtXdwnObszLQu6Wo4W1IuTDlsacz39VAo64stMgQ4k7q6G+sK6BUz9TDn/oMb
         bjAzmHqIOt/YUbINu0XTb/zLf1w2KrOZtjLLOns5VjYaWiP8SGNCShCgcsQze7oLYY/b
         LQMyJmTwom3eqS3s7i4eFOQzeY27ntWZez9GqQSMtTv32hSXFpnHMnRoL7C8LY7FUdsE
         9AGDlgDRUbH7956FBe/aCA80iZxRP4AQdFXZeiac+08Gc2hw5JiZvrMqseZE93DP9snQ
         INfw==
X-Gm-Message-State: APjAAAXWS9ax5zhkhdq/hs+smNLjsc3SC7+MRJKtMRU05+pNiJd6nuNr
        G56ylsx2NhpIyCyq2+2TwCa+x3mx22Y=
X-Google-Smtp-Source: APXvYqzooDTqgGz622+5KcyFt/wyDCN5P5HVJHqSheKFCzLYHUXc3Sh2LPhnXpgOLnBce4bDVKNR1Q==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr14848010wmh.74.1576268149794;
        Fri, 13 Dec 2019 12:15:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id i8sm11349337wro.47.2019.12.13.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 12:15:48 -0800 (PST)
Date:   Fri, 13 Dec 2019 21:15:46 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Jyri Sarha <jsarha@ti.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
        robh+dt@kernel.org, peter.ujfalusi@ti.com,
        laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com,
        sam@ravnborg.org
Subject: Re: [PATCH v3 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20191213201546.GN624164@phenom.ffwll.local>
References: <cover.1576158368.git.jsarha@ti.com>
 <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
 <20191213103024.GH624164@phenom.ffwll.local>
 <0acedebf-25d9-6ae2-1307-8f764af449af@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0acedebf-25d9-6ae2-1307-8f764af449af@ti.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 13, 2019 at 01:17:59PM +0200, Tomi Valkeinen wrote:
> Hi Daniel,
> 
> On 13/12/2019 12:30, Daniel Vetter wrote:
> 
> > > +DRM DRIVERS FOR TI KEYSTONE
> > > +M:	Jyri Sarha <jsarha@ti.com>
> > > +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > +L:	dri-devel@lists.freedesktop.org
> > > +S:	Maintained
> > > +F:	drivers/gpu/drm/tidss/
> > > +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> > > +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> > > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > 
> > Is the plan to also move other TI drivers over (like tilcdc) or just an
> > experiment to see what happens? Asking since if eventually omapdrm moves
> > that might be a bit much (or at least needs a discussion first).
> 
> Hmm, yes, I think we should have a plan for these.
> 
> tilcdc: small, old driver, and I don't see much changes for it. The HW is
> very different from the ones supported by omapdrm and tidss (the two of
> which have many commonalities). I think drm-misc is fine for tilcdc.
> 
> omapdrm: big changes going on for now, but after the rewrite to get rid of
> omapdrm specific drivers is done, I expect the patch count to drop, as the
> HW is "legacy".
> 
> tidss: the "new" driver, which should get most attention in the future (after omapdrm rewrite).
> 
> All in all, sometimes there have been very few patches for many months, and
> then sometimes there's a big series.

Yeah occasionally big series is totally fine for -misc. We're pulling in
pretty big amounts of refactoring all the time, so really doesn't make a
difference.

> I haven't seen a need to have a maintained branch for omapdrm, as multiple
> people working on conflicting items has been very rare (there aren't that
> many people working on omapdrm). So I've picked patches to my private
> branch, which I have rebased as needed. And then I've either pushed via
> drm-misc if there's just a few patches, or sent a pull request if there's a
> lot.
> 
> Is such a mixed model ok?
> 
> I'm not sure how much is too much for drm-misc, but probably omapdrm and
> tidss combined (if pushing everything always via drm-misc) is a bit too
> much. So perhaps a maintained TI tree would be an option too, and pushing
> everything for omapdrm and tidss via that tree.

tbh I dunno either when too much is too much for -misc. I think tilcdc and
omapdrm should both easily fit (maybe after the big rewrite). If the shiny
new one here becomes too big we can always reconsider.

I think the really big drivers like amdgpu or intel don't belong in -misc,
that one is clear. In between I guess we'll see.

> I'm fine with all options, so I think we can go with whatever is most
> acceptable from DRM maintainer point of view.

Whatever floats the boat, with a preference for not having tiny trees
(simply because those pull request tend to get lost in the noise).
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
