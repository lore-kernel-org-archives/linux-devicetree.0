Return-Path: <SRS0=ldLf=AF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C72C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 24 Jun 2020 17:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C50C2078A
	for <linux-devicetree@archiver.kernel.org>; Wed, 24 Jun 2020 17:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wca+aKs6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405613AbgFXRoB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 24 Jun 2020 13:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405522AbgFXRoA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Jun 2020 13:44:00 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6ACC061573
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2020 10:44:00 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x8so429903plm.10
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2020 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=blPOdTajVn4OJWy527Nm/cJEP9dim0oSKgwxjjYh5Yk=;
        b=Wca+aKs6OCeCLlQZHE2jtvWB9Igz6JI4h9CAPSmdajSZfhp2ZUPUCRDHujdfiLw847
         RY+1k9HzrWuintQ1IOg0AvP8qZaBBwDF4rut0xOtMGygpnJK8PHQskMf03hSw+HiPVN1
         oxn1UkEEkBskJoSBUGnoEZcMTz1dNz834ktawILifAj0yQ4aUyK9pBs6xHm+h0Ljrf+y
         rFbYYzWRA5j14xgc5ygP+TrFiJ3HazqFe2tZLTx5XJ8stS8GbnLwxdSUQj0nGIGycoYP
         ZeXu3B8KwzSYDlcjgCzItlFn+A2QCmb5X4lC1VIJd3pDehc2NmqWTjMxU68j3EGSHcex
         Gr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=blPOdTajVn4OJWy527Nm/cJEP9dim0oSKgwxjjYh5Yk=;
        b=eu1VQP+/aJ7SW52Vdhs9arqlWuyL9FdQ9Ana81dBZ0g82uhqPmZ+RXBlsNHPuVVurO
         SnKVjY8MjPl9y6GzGUA+BsOqjq83JfldFhIofY0bld2yWDnzaYWzqut/48MLmkN1X9lP
         Q3BlVP0JDRuC0zGICrsMh8F5rMh5GP95ewMsu+mgbsd/iiTCN1Qdpnp0B5jD8IgaYh3F
         a+/dRtIasMikBDhNHl+HhQryWiW6OMst3Wv2tPheLDAG+nUiervb1BJ766PyYhuJZav/
         Ji28eJ7tYRXVSla8NPg1VkE9/1eT8Xm5jebR/eiUF7dH1Tk1JIwv76+vvfaygnfBDyQM
         hrng==
X-Gm-Message-State: AOAM533etw+mAVR4nBnBq+58YPISO5qgWE4krj6dpWq7i+JJQwrGrqdQ
        TTN8LGRkxs95lwk1wn6N+d0qPw==
X-Google-Smtp-Source: ABdhPJyNVz7Caxp0j/OEjoO/h6oiEfmM/aIeAAklNOAuzgysJYahbgohTEF9YUzi6hvucALYQ5uqlg==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr30519050pjb.19.1593020639461;
        Wed, 24 Jun 2020 10:43:59 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h13sm20588371pfk.25.2020.06.24.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 10:43:58 -0700 (PDT)
Date:   Wed, 24 Jun 2020 10:41:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        kishon@ti.com, robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 0/5] Enable USB support in IPQ8074
Message-ID: <20200624174117.GU128451@builder.lan>
References: <1591625479-4483-1-git-send-email-sivaprak@codeaurora.org>
 <20200624171834.GH2324254@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624171834.GH2324254@vkoul-mobl>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 24 Jun 10:18 PDT 2020, Vinod Koul wrote:

> On 08-06-20, 19:41, Sivaprakash Murugesan wrote:
> > IPQ8074 has two super speed USB ports, with QMP and QUSB2 PHYs.
> > This patch set enables the USB PHYs and USB dwc3 in IPQ8074.
> 
> Applied 1 thru 4. Bjorn can take the 5th one, thanks
> 

Thanks Vinod, I've applied and pushed out patch 5.

Regards,
Bjorn
