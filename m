Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91ABC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 18:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C45AF20759
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 18:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JbuLznLZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729006AbgEUSi3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 14:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbgEUSi3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 14:38:29 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF201C061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 11:38:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k13so7688861wrx.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LNC3H7rEKUYKmtw+FfHQGSZX2sVQSBHXnVoTDU42qPY=;
        b=JbuLznLZl83UGj+x/fv3TrhYsAe9fNCLffilc1K7DaqA3D+B14saAOvfrK+QCf2bVO
         IdXHbRkvxXsIhfUlHcmLoIANGHGoULOdn3m21jPRcnbpboq620j9KzSmlU+tregxxFDZ
         33xdGc7iUxca+LR96EHtwLNYzCgvk9Dgr2u5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LNC3H7rEKUYKmtw+FfHQGSZX2sVQSBHXnVoTDU42qPY=;
        b=l/OMeHikuVZGwYOVi8xDZfunmQXKwVkSKVH4bRf8En2aukpJjOGrSeG0FR2C6vT/Zj
         3r6upmmeDCv+vDnLSY7PuvJhbVRA8JCrFiDHOte5+Q+1B2rS73FHVSvX7UVoZx5KW1uc
         47IyI1KVo0aDfTCJqKWLJ73KGoxKqDqDJS0GckcxonNJsQgT23+tOa01OXGSFPh1yx/j
         iMQHYzSJ6eRh/RUnLM1xiLOUBUqm170cJreA5FpTvxHPmGwKsGBhDYzocQWtI3VrRct+
         5+C0uNXlCEJFnjV0gIg3mJ6KyPXNXeQJjGRwPU3DwDNC90F89xCNDXXGguRKoheUW0CH
         9pKQ==
X-Gm-Message-State: AOAM533guGa4nUYWRNBcGKQ8dNFz6r2R+JjIz5yFyBwO+zg30DN5bFOc
        jJaXnco25nZUjY0AM4DkuFaDPQ==
X-Google-Smtp-Source: ABdhPJx+mMeFfjdw27k0v6HQGzNGMS5EzIHJarokhlVRpcdV62wWUZ44xVDdvCqxSbWyifL0JHBSqA==
X-Received: by 2002:adf:e749:: with SMTP id c9mr3070276wrn.25.1590086307624;
        Thu, 21 May 2020 11:38:27 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id j2sm7127697wrp.47.2020.05.21.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 11:38:26 -0700 (PDT)
Date:   Thu, 21 May 2020 18:38:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "pihsun@chromium.org" <pihsun@chromium.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?utf-8?B?KOmEreaYh+W8mCk=?= 
        <Sean.Cheng@mediatek.com>,
        Sj Huang =?utf-8?B?KOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        Christie Yu =?utf-8?B?KOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?utf-8?B?KOmZs+S/iuWFgyk=?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?utf-8?B?KOael+aYjuS/iik=?= <jungo.lin@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
Message-ID: <20200521183825.GB249683@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jerry,

On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> >
> > Hi Laurent, Tomasz, Matthias,
> >
> > gentle ping for this patch set,
> > If no new comments, I would like to send a newer version.
> >
> 
> Sorry, I still haven't had a chance to look at the series, so feel
> free to send a new version and I will take a look at the new one.
> 

Finally found some time to review the series. Again sorry for the delay
and thanks for your patience.

Some general comments:
1) The metadata format FourCC should be added in a separate patch,
together with documentation for it.
2) Control IDs, structs used by the userspace, etc. should be defined in
a header under include/uapi/linux.

Please also check my replies to particular patches for further comments.

Best regards,
Tomasz
