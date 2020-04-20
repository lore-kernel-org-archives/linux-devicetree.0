Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9E1C54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 21:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC16F20724
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587419401;
	bh=FR1Z2uSpQYPsmxEOc/GwebV256/kxJ0+jQqmWFlpIyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=odvVz75+qtGq240ejADcEg3nzO5DcjVOQ2GDD8Py44a3+JTmorr9jgj2Jia/J/IOE
	 jMvVDljqxsH8aKUEbVxdxcV9Hy8wdf/vgkkPNtXskeqmc/xoC3+tR2jdhS4cZ0sC2O
	 l6DMvo11bzlt/achQuo6gExbVbYSfmvh9j+Jbnek=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDTVuB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 17:50:01 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35795 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDTVuB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 17:50:01 -0400
Received: by mail-ot1-f67.google.com with SMTP id e20so9567902otl.2;
        Mon, 20 Apr 2020 14:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vYmwwzqG7uqx9g2ELxFVG14owXz8xo4qOPYfFDEaBnk=;
        b=gedjbVZE0RQ/kZpc1eNrGRNc9pMsnx0nNGWd5xRtMB4JI8RH8gu1zdE+C+AYeWYmcF
         pNi1rNcYB8tMxVVyo0aUHXjAdJcD4bvOwKT2zmI7ikZ763EAf4OohhHkb1q2uX/ZBO+O
         0INMGWVyl3s9ffJt1fc8dM6GMnAg/khX1N16x6PURcba8JCmGgWZPK2LBxODQbHpXXPL
         QX7/ukn+lxKISBu+xnCWHcZ7exHVLu8HwyglTfde/PHfz4D58cGlx5ZkD/BsD5UR39SK
         yCZU/a5R8DUFkf1Jw0tc1Iy1pdUdMHWbn1TsdEpbjN+6Pi8gtWR3iGmcpImBWz4em0B8
         2tOg==
X-Gm-Message-State: AGi0PuZRBmBLXMjSNxwI8dBKai/5fjqPh0yd8IDR/7q+zgSR9L82ij1h
        jXosoTCGpWLsIYmiisuoLkjqTQk=
X-Google-Smtp-Source: APiQypLo5amH2CJMms+WGoIdXKyJV3V9lJJ2mR1Um33qIA/Ag0+OPAipS7fQufoA90Fhx/wSicrR3w==
X-Received: by 2002:a05:6830:1483:: with SMTP id s3mr11058611otq.176.1587419400257;
        Mon, 20 Apr 2020 14:50:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i2sm188842oon.0.2020.04.20.14.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:49:59 -0700 (PDT)
Received: (nullmailer pid 23817 invoked by uid 1000);
        Mon, 20 Apr 2020 21:49:58 -0000
Date:   Mon, 20 Apr 2020 16:49:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp: Add SM8250 UFS PHY
Message-ID: <20200420214958.GA23753@bogus>
References: <20200415060745.740193-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415060745.740193-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 14 Apr 2020 23:07:45 -0700, Bjorn Andersson wrote:
> The SM8250 UFS PHY can run off the same initialization sequence as
> SM8150, but add the compatible to allow future changes.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 5 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp.c                    | 3 +++
>  2 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
