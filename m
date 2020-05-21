Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8672C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 13:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94069206F6
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 13:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TZEsQQmR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbgEUN7n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 09:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729544AbgEUN7m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 09:59:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7544BC061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 06:59:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e16so6743681wra.7
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fd27zalAyz5wmnk1UFuL/3CVJVB2Mbru00pqm3YvwKU=;
        b=TZEsQQmRmAtlsPZ6hEPx1lfN+WVfX9faQiHdd1FC5rdGKNoEokI5y6RqM2R5AunejI
         u538EoIRYq37DBlxBdB5BCNFnYNB9Adj3e0xFr5JZI02zmw4mzuluXYm9cnjbvpKyKgs
         AgA/U/12lSi6ar8khG8bQKCe9ydhwDp5gYliM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fd27zalAyz5wmnk1UFuL/3CVJVB2Mbru00pqm3YvwKU=;
        b=iZJVbqoRFnHZ8nyZxQZL81pIZ3ieNy6cBwzU6mziHODjPTTl71yUFRDyKkGzhupTwF
         EDgpKRV4ynxOGWKWzCZezEJ6ULN5c+wLnuv4UUs2cA04EIAgiOVsUhQ1wuwKmxCtdThM
         xui5+Om1Dj+RdNlnOwgy4hDHhwHSGUZuRe48HNL0Tqyy1L/fycnHP2ZrOJxja1V+wAcj
         JjmWE07xFrcDydO3cA5nHBH3M7sa75Z+Lperm7fn2xrdFPPdn0WXj2glv9PPZwTEuW4g
         Zq3XNXrklAittx+akzKMjOUDXvZlhAxyJQ0VFUbhivLhPnNkmDex5GBxJWDOTxb3iFeB
         JsKQ==
X-Gm-Message-State: AOAM530YxB8P0GwlzXZ36xLg2+Ql/zrHJ+OiemFztFmlhsKHXOJ7C2qS
        f+T7bNIu7lFuPPeZlP2WKRnflw==
X-Google-Smtp-Source: ABdhPJzYH1Ehd7L4WwVhzu2u//nGcgv2AbmGEgmxLvE9GqtTmu1vDDGQKL8r/UbPrLf9oXWCdRfLAA==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr8426488wrw.349.1590069580276;
        Thu, 21 May 2020 06:59:40 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id c17sm6505348wrn.59.2020.05.21.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:59:39 -0700 (PDT)
Date:   Thu, 21 May 2020 13:59:37 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH v8 04/14] media: platform: Change the fixed device node
 number to unfixed value
Message-ID: <20200521135937.GD209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-5-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-5-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:23PM +0800, Xia Jiang wrote:
> Change device node number from 3 to -1 because that the driver will
> also support jpeg encoder.
> 

Thanks for the patch. The change is correct, but I think the commit
message doesn't really explain the real reason for it. Perhaps something
like

"The driver can be instantiated multiple times, e.g. for a decoder and
an encoder. Moreover, other drivers could coexist on the same system.
This makes the static video node number assignment pointless, so switch
to automatic assignment instead."

WDYT?

Best regards,
Tomasz
