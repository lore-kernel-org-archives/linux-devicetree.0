Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9E3C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 00:03:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B78020849
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 00:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZG5OHkrz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbgEVADq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 20:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729771AbgEVADq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 20:03:46 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48059C061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 17:03:46 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ci23so4192064pjb.5
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 17:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aimWUItgOf1Mo4eNsHUlIg6Ef9QsJNRTVwtUqNdOH6M=;
        b=ZG5OHkrzAxL75jV4jI9yyW41kOusvleLyaT+i8cXJZTdBo4cdW390NE0CHkuK+u3LO
         fDKPFO2iZtkgAZiMCfDuY55LTfhIfRiRndLQAueqXhmcGEf39qGrCQ7t6E3ey/8iHkPB
         u5b+B3Q/Qh9sjOAdFaqtjj5BmQm0OHNyWS1fCXnBZyGLeI4SJTkHHpHryB0jNrdpeTZr
         o4T05BzrOHJeIyRDsXnJFDkfj/elgR+viOPFpX5fYs5ciwuhRwT+YsNaZGDIDqQ+npYl
         dOA87DruowRnaDWivlA5TMnS2E9Zh3f3ipIFxpt7oCHj/kR6a56Fdex4r241Zevm+UmH
         ABRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aimWUItgOf1Mo4eNsHUlIg6Ef9QsJNRTVwtUqNdOH6M=;
        b=Ba3ktg8QGLlifztqRzzruFFtE8FWG0wlQOi7a8zOGlc7Qsp7b5n7EN88C2Fyzw3MlM
         +HJor1bxXZgl9AXGW09LSGnNeGSPBjeZJH4sqwtAnUi5XSr59aA5ZW99Y903DV2WDZZp
         C86SLJ1jx4mJSECfHw967iNKDV4gGvY7Q77KfSiVDOAVwxQH7zpGswQWi7AUa28oe8LG
         2Sf1DUlpVTbHkVl1WmnBnCSH49+2cUU9hpW5SLTm1f7Vu28NmFZHdxsuiHIF86ay9cIy
         YY/ngz4TOo1IADOwE6SzdBWc1EVTjLuc+A3JIXWj08DQ87JunZUIMDrvH6Df3askHuUT
         +pqQ==
X-Gm-Message-State: AOAM530KE2UEvPqvf6qCfaYAmQA08p3h6UvrYPvLeEQUQhUX8NDy9ZF0
        CVAaQ+47MldOUNd6qp8qXLCLLg==
X-Google-Smtp-Source: ABdhPJymXguid2RaAquptSVy3PCyyF4zQrru0krE8vDzueEdGjOYVT72JC4TiSto94bPhX23JXSexQ==
X-Received: by 2002:a17:90b:10f:: with SMTP id p15mr1059980pjz.99.1590105825570;
        Thu, 21 May 2020 17:03:45 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o11sm5259985pfd.195.2020.05.21.17.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 17:03:44 -0700 (PDT)
Date:   Thu, 21 May 2020 17:03:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] TI K3 DSP remoteproc driver for C66x DSPs
Message-ID: <20200522000342.GG11847@yoga>
References: <20200521001006.2725-1-s-anna@ti.com>
 <5f84465e-8f63-51b4-4758-59c85d3ad597@ti.com>
 <20200521190141.GN408178@builder.lan>
 <20200521222334.GA11366@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521222334.GA11366@xps15>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 21 May 15:23 PDT 2020, Mathieu Poirier wrote:

> Gents,
> 
> On Thu, May 21, 2020 at 12:01:41PM -0700, Bjorn Andersson wrote:
> > On Thu 21 May 11:59 PDT 2020, Suman Anna wrote:
> > 
> > > Hi Bjorn,
> > > 
> > > On 5/20/20 7:10 PM, Suman Anna wrote:
> > > > Hi All,
> > > > 
> > > > The following is v2 of the K3 DSP remoteproc driver supporting the C66x DSPs
> > > > on the TI K3 J721E SoCs. The patches are based on the latest commit on the
> > > > rproc-next branch, 7dcef3988eed ("remoteproc: Fix an error code in
> > > > devm_rproc_alloc()").
> > > 
> > > I realized I also had the R5F patches on my branch, so the third patch won't
> > > apply cleanly (conflict on Makefile). Let me know if you want a new revision
> > > posted for you to pick up the series.
> > > 
> > 
> > That should be fine, thanks for the heads up!
> > 
> > Will give Mathieu a day or two to take a look as well.
> 
> I don't see having the time to review this set before the middle/end of next
> week.  I also understand we are crunched by time if we want to get this in
> for the upcoming merge window.
> 
> If memory serves me well there wasn't anything controversial about this work.
> Under normal circumstances I'd give it a final look but I trust Suman to have
> carried out what we agreed on.
> 
> Bjorn - if you are happy with this set then go ahead and queue it.
> 

Thanks Mathieu.

I looked through the patches again and saw that we're still waiting for
a ack on the dt binding, so I guess I need to hold off on this a little
bit longer.

Regards,
Bjorn
