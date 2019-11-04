Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7224FCA9ED4
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 23:02:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 463FA20869
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 23:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJe75S+X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbfKDXCY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 18:02:24 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40398 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729850AbfKDXCY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 18:02:24 -0500
Received: by mail-pl1-f193.google.com with SMTP id e3so6274638plt.7
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 15:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X1UnPHKL+R2cZ8Kw6+/720/J4o7/qh5ZTT6nGad7uFc=;
        b=iJe75S+XWatVO63vpa8OCbttobDDRXQDHpSA5POIQeMX6fxWDxN1H+2wJfuKHyYmTS
         RIhDArF/B/r+170+sXr+ID3efg8y8ySEksy6z5I+vysegvbqELJ3APp8lJ7qTjd7c09v
         gI2LjD4oCRQyGn3+tUh3VdjHZa1wbmYqWP0fEdWZPioPeEg7cVGZwdj95xbbEvViTGgH
         cfBOEnX/XnPno7W/cVSyA06kwTAWDkQ2koWsYydlRwAKweAeLlYjT2lr5Rf3FD+QtgWi
         SJrC3G3LxdjHS4q/3DtzL9g1Fosjk8dT97hozl42iabPuetbLeRleKLkQmFajWs7waIi
         /iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X1UnPHKL+R2cZ8Kw6+/720/J4o7/qh5ZTT6nGad7uFc=;
        b=E8fYsrROZJoEpOuii6saBMo+/mJNVGRQ7AuU9YFPnqsXiSLPug/UVszjxE+zXqgYwe
         pQlDUfBdBvPYNb1S0jzxCkLAHqgWuXgDCfLtfJcDVWGXMYWKHrpTsfIsMz4BWz7lGLvR
         uRYQREvsL785gFoocolDTbxwXBZ6Dnb9jNyRGvhtrVXxSlk+MYdvnQFfL0Ebfs5JkvgS
         bRkn94xUe3jLWg/Rp6QL6ciZn0pXSpF7uPRP3p1nA/fAB/FwRtGsXoRNGS4YbiEgm/qe
         AA4wQTetspLWtipKWdxP8Bi+1u0GbKLik+znlz6ZeYPf+XGeHINYgZI8QdJ7pRPX9tKL
         Ae4g==
X-Gm-Message-State: APjAAAXXBDzfaVCp7DoMy89fJDioTI6gAkfZzd/2edCbpd1rE5HfL2wF
        UAZWUJBqZm87WzMcdJTFL4SEiw==
X-Google-Smtp-Source: APXvYqzJHtTwMH1ADOHC49u97iZoDWvrf1I4qV/BP7/Ne+/CYjKqqJfdSXB04ZCFwKG8gk7W+BrYNA==
X-Received: by 2002:a17:902:9a92:: with SMTP id w18mr29336869plp.186.1572908541755;
        Mon, 04 Nov 2019 15:02:21 -0800 (PST)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id q184sm18357035pfc.111.2019.11.04.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 15:02:21 -0800 (PST)
Date:   Mon, 4 Nov 2019 15:02:19 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, ohad@wizery.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Support for MSM8998 mss
Message-ID: <20191104230219.GA5505@tuxbook-pro>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 31 Oct 19:43 PDT 2019, Jeffrey Hugo wrote:

> Booting mss on MSM8998 is a critical step to getting wifi functional - a
> rather useful feature for the MSM8998 based laptops.
> 

Thanks, and thanks for the review Rob!

Applied,
Bjorn

> Jeffrey Hugo (2):
>   dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
>   remoteproc: qcom_q6v5_mss: Add support for MSM8998
> 
>  .../bindings/remoteproc/qcom,q6v5.txt         |  6 +++
>  drivers/remoteproc/qcom_q6v5_mss.c            | 52 ++++++++++++++++---
>  2 files changed, 52 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1
> 
