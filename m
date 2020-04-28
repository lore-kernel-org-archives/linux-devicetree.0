Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43D3C83001
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 18:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A5B206A1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 18:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYgGHly7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgD1SCn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 14:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgD1SCm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 14:02:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2259AC03C1AB
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 11:02:42 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 18so11059930pfx.6
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mENmQ6Pb7H8tmR1MjtMLs0ubXE4BKzkIreYYg9JTmwQ=;
        b=fYgGHly79Oyel+aDS8shmE3wA06fO5kZLL/u3s85DS992pSDgr08Jx2wajFH7j1jHC
         Dm1K5xERcf6FhGPMuwNcv14JeebOPQZorvUlcLz9r0RxfDLF+gRc1j1BvIQq3RNpOm6Q
         9EMp+/yW1t/Q54ZgaBMcfsk1FEOfsZMCpkjScN0nwNDQzMFzUhf4HwlvdsjFpCVrgXEi
         EYB+aGQalOJeufMo73XeoDc9GtUPILpD4ag+vQctucSuvpTuQySVWKSYNmE/AT+LcaHE
         kI7bunItPbbWP55YlZJPCWyIY1A8G2+MqmrVUznPsc3Sd/HNKegH3CuGA+CTuEFt/kBt
         Fmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mENmQ6Pb7H8tmR1MjtMLs0ubXE4BKzkIreYYg9JTmwQ=;
        b=LzNFKuWkS3EfWbW0xtgfU0C8HU8Hst4jciL9gEWgYnRaKdMkCTiecZpD5b8SVvn8bN
         w2XP35nPR8j4bhgw5CgNM60b2I+Yzq5JkeKY97DuMfgmwBgBwSeG3HzweS+MfJVbLCpp
         5K4npDwZtMvWS7mTPfGy2O9rcMHrcxk6vspqZIBCgyVeplb61+OmOEZUh0UV8OBDAG1w
         iY8ABJ0joLdASZdhf4x7hs+SSaePVTvlPNBJdR9MMKCApXIcVbSR4XihqLwkYTsTTqZK
         rsvXd58vJd3+/PV/YGlWpOJ7sXEhThy9CKmrFSbbR+XfXbqeejii1J45daKhOMbDigZJ
         Eriw==
X-Gm-Message-State: AGi0PuYAyeoLj8V/YB16fKyW8kh0ozeGFqstULx4OEf98wj5qJ5eYE/c
        b8dYubRKSOAVn51nhwMyAYNsTg1GyAc=
X-Google-Smtp-Source: APiQypJTI6DwHabWRQCA/LwS+jwG4QtUCwBuv+PQUF/I35yfyK+EKVAsd6jfQyV+7Qv9CI1ziwgX/w==
X-Received: by 2002:aa7:8593:: with SMTP id w19mr30860532pfn.97.1588096961545;
        Tue, 28 Apr 2020 11:02:41 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h197sm16248994pfe.208.2020.04.28.11.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 11:02:40 -0700 (PDT)
Date:   Tue, 28 Apr 2020 11:02:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add IVO M133NWF4 R0
Message-ID: <20200428180238.GK987656@yoga>
References: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
 <20200425175842.GA3773@ravnborg.org>
 <CAL_JsqL6bMwrXZqvGz_H_aJi+EeoikBwKznLP2VomJ=Wn822Rg@mail.gmail.com>
 <20200428170559.GC27234@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200428170559.GC27234@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 28 Apr 10:05 PDT 2020, Sam Ravnborg wrote:

> Hi Rob.
> 
> On Tue, Apr 28, 2020 at 09:27:51AM -0500, Rob Herring wrote:
> > On Sat, Apr 25, 2020 at 12:58 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Björn.
> > >
> > > On Mon, Apr 20, 2020 at 02:57:27PM -0700, Bjorn Andersson wrote:
> > > > Define the vendor prefix for InfoVision Optoelectronics and add their
> > > > M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel to the compatible list
> > > > of panel-simple.
> > > >
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > I got OK for the vendor prefix on irc so patch is now added to
> > > drm-misc-next.
> > > Another time please use a dedicated patch for vendor-prefix
> > > so it is not hidden with other stuff. This way the chance
> > > to get the attention of the right people is better.
> > 
> > I should have mentioned there's basically one thing to check:
> > alphabetical order.
> I thought I checked that, but obviously not - hrmpf..

Sorry about that, I thought I did double check that before posting it...

> I will post a follow-up patch for drm-misc-next to fix it.
> 

Thank you,
Bjorn
