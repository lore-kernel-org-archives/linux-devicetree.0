Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0853FC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 09:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D537921531
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 09:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwkcskJV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgFZJkK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 05:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFZJkJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 05:40:09 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C814C08C5C1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 02:40:09 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h15so8817463wrq.8
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IJPYmFQ5PUZFd/hsuCewfegAqJ04XYM4/xT+2m8jgiY=;
        b=vwkcskJVh+L2Xpf1FviJZSKSkJLqYR6xk/pX4JNAhMBewx2yQaQft983xXe7VZ3dca
         lEgPv5xvUx4mRGQRcfniAphVtbSlP9EkLlTGd7bf8YuPoM0pQIoKsCZ7DbUrbdGfZMne
         QfNCXgwvmUXqaDps2UKbyt+ZRbHag99DxnS+NbWOW5J/gHaWxRLuaIF/mfiXri3dbmNq
         vsbGFCBZWHSAss/biYQPAdmBkwGnCHGJRHw3dOUJ/RU4d6AwiI7wxYVMfZMhu1RVEkeo
         UPt1PTtNB7/SE+vA3BCcgOwTgHDX23EMfZWBC3Ne0bMbmc922qad+li8Uqng9+nbXl2b
         rjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IJPYmFQ5PUZFd/hsuCewfegAqJ04XYM4/xT+2m8jgiY=;
        b=l4Z5s3hS651csSqmPZQ1bm2y0GKzUXtrDzR+sTfQi6Ss/m6NLzp9TXPn3DMCKrOhEw
         9zGVB/Z9+6l2g3jZKQlU7R5JGbJ7XBperiPrFypdTvTW6IP+IuskC7oVtUVCdF4vqcjx
         czLd5BGdLaskFBzcADb8gqrFHYHsElv5HhjdHKzB6K9HRmGvPJ7GG6BWMA+DxleGB0+U
         yzNzMILLDVztqZBrURo/yBc3dJE/1lf+nEHSs8jAm2fJphu47Wp31s11oDKGfoeU2MZB
         DB2/CmcYpEi/It3bWj44wCuQDSx33pY2KpOfxIYf2xU/rihLka+1cwf1H0M7zzA+fQU1
         Ym5A==
X-Gm-Message-State: AOAM5319rb3FRaQjbSFsZS9UmDwhTbnTrbHy3Pij57bF+d6Kr5VMYEg8
        Jx8GGlJ1n5HvczPotxnc4BMcJQ==
X-Google-Smtp-Source: ABdhPJwPIIuvYVlW7mNotwj3Hv4mO83srghyGHP5ErgWEB6RxsGtQBjhSqDXG/2cvVM7LX6aGeIc7A==
X-Received: by 2002:a5d:498f:: with SMTP id r15mr2935735wrq.175.1593164408186;
        Fri, 26 Jun 2020 02:40:08 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id w12sm26985624wrm.79.2020.06.26.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 02:40:07 -0700 (PDT)
Date:   Fri, 26 Jun 2020 10:40:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200626094005.GA177734@dell>
References: <20200306085513.76024-1-ikjn@chromium.org>
 <20200417101333.GA3737@dell>
 <ab5adcd1-18f2-9b1c-8c5d-744f7a0e5579@collabora.com>
 <20200625134620.GS954398@dell>
 <b2f27cee-327e-c96c-aa12-5e1ef1f352aa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2f27cee-327e-c96c-aa12-5e1ef1f352aa@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 26 Jun 2020, Enric Balletbo i Serra wrote:

> Hi Lee,
> 
> On 25/6/20 15:46, Lee Jones wrote:
> > On Thu, 25 Jun 2020, Enric Balletbo i Serra wrote:
> > 
> >> Hi Lee,
> >>
> >> On 17/4/20 12:13, Lee Jones wrote:
> >>> On Fri, 06 Mar 2020, Ikjoon Jang wrote:
> >>>
> >>>> Convert the ChromeOS EC bindings to json-schema.
> >>>>
> >>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>>> ---
> >>>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> >>>>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
> >>>>  2 files changed, 129 insertions(+), 76 deletions(-)
> >>>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >>>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> >>>
> >>> Applied, thanks.
> >>
> >> I don't see this patch applied, I am missing something?
> > 
> > It should be there.  Not sure when the MFD repo was last pushed.
> > 
> > I'll try pushing it again (there are a couple of new patches from
> > today).  Maybe that will spur a fetch from -next.  If it's still not
> > there tomorrow, let me know and I'll investigate further.
> > 
> 
> Still not there, just to make sure I am looking at the right branch, I am checking
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next

Oh, I see what's happened.

Looks like this patch wasn't sent to LKML, so my apply script failed.

Any reason not to send it to LKML?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
