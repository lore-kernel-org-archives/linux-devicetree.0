Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E9EC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 16:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94FE121556
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 16:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZPUFjTb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbgCaQjI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 12:39:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34265 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730590AbgCaQjI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 12:39:08 -0400
Received: by mail-pf1-f195.google.com with SMTP id 23so10590236pfj.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2020 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=44+c4Ocrbrg0k7nn//ayMhBbygL62o3qDE+l5x6G/Eg=;
        b=nZPUFjTbbHvB/92RynnbfBTbJQ4r4i4GXHAtl8BEFpByyl7RKSEBp0C6lwh4iNcPfD
         qHgIAxjTpGXG4oUFkLtR1qfpkDN1BeM173oX/Cxb1lYfb1tNUJLPhjT37qSBYKgrKpDP
         s44cOKzpmbVm323hvvCJyqjOmt0BBIWJ74d1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=44+c4Ocrbrg0k7nn//ayMhBbygL62o3qDE+l5x6G/Eg=;
        b=iLBUOV7pQOnFNhgkZyW6y1iaVc8ydzx3Jo5GRlv4/5YK/qf/3bCByeaS+eIDhrUFUr
         SFIZlALi/0lXB/+cOF4/m1hftZQ+dQFvlCT5gLNgaH4CJbNxEIhGB/oD5IXSESECOfYj
         LslFXa8uOViSEBAP9xaFGcm58ZijwnJBTQ4AbtROGmCu7W9bRAQD8QYdHH2Q9UTqoDHx
         jLD3TeSCo3uW4icdsXsUDE+/naWFrpEErdzTmIlzE34X/18v4cW1l7+Rhye+8A5WvsJ6
         G7bfOgIqN/ACOXVLKIjb2dk8wlNjEqHeidSCUbz+RXN3TLeyy5HomZ/zdsmgfMYTJCKc
         pZEA==
X-Gm-Message-State: ANhLgQ1fgdT8iM9Se+Tmx0VgD6H2Elq/0q5VuIVYcgKaBFgolfOqBXpW
        15fLiLapDFTO5ydZ5aJopTH7xQ==
X-Google-Smtp-Source: ADFU+vsGsUTeHUuF1unZrg9i5ze+SZDnJ9Sx+xT8F6R92O2gzLsoV/DUQ3aml+IuKmSF3F0qAd06zA==
X-Received: by 2002:a62:3844:: with SMTP id f65mr19541464pfa.255.1585672746899;
        Tue, 31 Mar 2020 09:39:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s15sm12878266pfd.164.2020.03.31.09.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:39:06 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:39:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200331163905.GE199755@google.com>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
 <20200329174417.GB199755@google.com>
 <20200330192511.GG7594@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200330192511.GG7594@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 30, 2020 at 09:25:11PM +0200, Sam Ravnborg wrote:
> Hi Matthias.
> 
> On Sun, Mar 29, 2020 at 10:44:17AM -0700, Matthias Kaehlcke wrote:
> > Hi Sam,
> > 
> > On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> > > Hi Harigovindan
> > > 
> > > On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > > > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > > > 
> > > > Harigovindan P (2):
> > > >   dt-bindings: display: add visionox rm69299 panel variant
> > > >   drm/panel: add support for rm69299 visionox panel driver
> > > 
> > > I have only the first patch, which is now applied.
> > > Please resend second patch as it is lost somewhere.
> > 
> > Yes, it seems for v8, v9 and v10 only the bindings were sent, even
> > though the cover letter and subject say it's a series of two patches.
> > 
> > To my knowledge the latest version of the driver patch is this:
> > 
> > https://patchwork.kernel.org/patch/11439689/
> 
> I did not go back and check, but I recall there was
> review feedback that is not yet addressed.
> 
> I applied the patch here and checkpatch was not happy:
> total: 14 errors, 22 warnings, 11 checks, 314 lines checked
> 
> Many of these are trivial indent or spaces used where tabs should be
> used.
> These needs to be fixed before the driver will be applied.
> 
> And there was too much that I just did it while applying.

Oh, I totally missed these, sure this needs to be addressed.

Harigovindan, please also double check if there is any outstanding
feedback that still needs to be addressed.

Thanks

Matthias
