Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9020C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 23:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4CFA2070E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594338197;
	bh=a/HNHM1kTmTh394mpCSAb/WE35qSdbzfsLbjaOswnQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=s0cVpwGwbb0jFiR5lyoQRoCmm3Z6jPrnK/TbOeWGC57l8n+lPz/B4ub0hr/6M/d/X
	 zFMxCGO5SGkn6xDx74abUuRH5Jy04KpElvoNadp+lnqfpXy0D7mlxsDQsJRNDOqnnA
	 2y2T8XB0ZfvQRTPi+7yio4O8/Z5BUoDaJ73hP8TM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGIXnR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 19:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgGIXnQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 19:43:16 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273F5C08C5CE
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 16:35:05 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id k23so4141926iom.10
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 16:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xYijZ/BX2Btv1jBhkRuxab/fnOb1MXoDYM/e4XDrW5k=;
        b=GdNMyXeCJnASHMFM9ipv2Z0gSv+FQGE0Ufc1SJrhgr+cJof992dPDGj6BZH+Z701KZ
         mnZ6EUmwr1jAjUI4RcFPdu9xvyOep1niENfP4WAyUzAxy2r/sK3T85/BYJtwFBEbwDU1
         RJEjkYczt/mqbfwj3XvK5/u+Z5PVoSTaEL5Z/4NJnjeWSEL5LMMDh8oQpPUCq8kn6oSl
         P+C4XYD+eWDaRDeQH8CdGZoFVikcvUkvrtnKRg0XiSgQRKJv2PA9GHtZfxM1tES/vUkz
         RGZWCvuDxH1TIxAGoOMdIKj3gag/lkDdrTXrNaVYBPz01HKU60ZsH6ou0cr48FwWoc8Y
         ewkg==
X-Gm-Message-State: AOAM530YHY4IAUg24gRWcG1eEukQsqW+WZ/0IwkTSc0EKhJRoxck/t7D
        R2ahFPaqrxmUpQTEgyvsxw==
X-Google-Smtp-Source: ABdhPJw6T9j2SNkUn0RZGgUhV6z0vwDieSHApxdWSPZAqjBVATyRXP+wX6l6mdxeKa+1GCidB2K6cw==
X-Received: by 2002:a6b:b4d1:: with SMTP id d200mr44270196iof.128.1594337704467;
        Thu, 09 Jul 2020 16:35:04 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id j28sm2761685ili.76.2020.07.09.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:35:03 -0700 (PDT)
Received: (nullmailer pid 1109950 invoked by uid 1000);
        Thu, 09 Jul 2020 23:35:02 -0000
Date:   Thu, 9 Jul 2020 17:35:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Chris Zhong <zyw@rock-chips.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to
 DT Schema
Message-ID: <20200709233502.GA1103707@bogus>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704103408.GA735964@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200704103408.GA735964@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 04, 2020 at 12:34:08PM +0200, Sam Ravnborg wrote:
> On Sat, Jul 04, 2020 at 12:28:03PM +0200, Sam Ravnborg wrote:
> > This patch-set convert 3 of the remaining panel bindings to yaml.
> > 
> > This is a follow-up on v2 that converted a lot of panel bindings:
> > https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
> > All was applied except for the reaming three patches included here.
> > 
> > One binding is a DSI binding so just added to panel-simple-dsi.
> > The other two bindings addressed review feedback from Rob.
> > 
> > Sebastian Reichel has a pending patch to address the remaining
> > panel binding in display/panel/
> > 
> > All bindings pass dt-binding-check.
> > Based on top of drm-misc-next.
> > 
> > 	Sam
> > 
> > 
> > Sam Ravnborg (3):
> >       dt-bindings: display: convert innolux,p079zca to DT Schema
> >       dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
> >       dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
> 
> git format-patch adds a space after the ',' - in the subject.
> This is often a good idea, but not for binding files.
> Will fix when I apply - if I do not forget that is..

Sure about that? I'm pretty sure it's dri-devel doing it. Look at 
lore.kernel.org copies for different lists. I've been fighting with that 
first in patchwork (which had this bug) and then in b4 (which is where 
it got nailed down to dri-devel).

Rob
