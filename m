Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFBEC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 04:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5722A2072D
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 04:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583469462;
	bh=mxdW1VGI6eXUPnu0t6lHUTLnV9a3rWwkVHnbuxAjglI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ysaOkAv7PGLc5W2dwc9clpO2TBmJC7W+wN0COcc7csX893VDGY2kKlgUqK2x86/nB
	 5+yV6vY6iKXYXf9I9iZT1f3NN4oqsx7+5kVC1MfFCO3skrNJy/J6gA+IaA8heb8Bc1
	 O8ktiZVfXRissjjAXsBH7lUvtwe1tYpr27ZSXCoA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgCFEhj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 23:37:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:44912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726243AbgCFEhj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Mar 2020 23:37:39 -0500
Received: from localhost (unknown [122.178.250.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCAB02072D;
        Fri,  6 Mar 2020 04:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583469458;
        bh=mxdW1VGI6eXUPnu0t6lHUTLnV9a3rWwkVHnbuxAjglI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDplQ8u01XZ4eduBCy2TVZfZt5//UWdDbEfHpbXhbOiBg5Qc3rJ/qxs4N8oY2HPNG
         96D1nmZj3t+aZvQozvhI0I5xTEp2tZZeveezGi53eJ4Bntwmj62p/330QJRcqCa6V8
         GJY7PcExHTTvP+cnbPJXfdHz/4wjEeQXauYEeEn4=
Date:   Fri, 6 Mar 2020 10:07:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8996: Define parent clocks
 for gcc
Message-ID: <20200306043732.GB4148@vkoul-mobl>
References: <20200106080546.3192125-1-bjorn.andersson@linaro.org>
 <20200106080546.3192125-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106080546.3192125-3-bjorn.andersson@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06-01-20, 00:05, Bjorn Andersson wrote:
> The CLKREF clocks in GCC are parented by RPM_SMD_LN_BB_CLK, through the
> CXO2 pad. Wire this up so that this is properly enabled when need by the
> various PHYs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
