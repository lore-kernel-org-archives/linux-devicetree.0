Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0177C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 10:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 979C624654
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579601142;
	bh=YM4Qa/96OhPKqgS9hNxjuyapvPEJG+ACOGoNyJGR+Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=U/kqHYfCNp9bgekh8jgj1DHu9tTDs3LIYyuLMUMlgoUyDtVnyyufOURaZwHaUYiZD
	 5I76AA9+XVuAesV1S2x3kMjhlPn3nrBWDTO4N64mIwjAfsUqKD71NsTuHGdvUuMrQ/
	 ee5beCe2dKpZcIqRkr7bmjWBAynaS0S2tKUHl4h8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAUKFi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 05:05:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:37538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgAUKFi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 05:05:38 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD65B20882;
        Tue, 21 Jan 2020 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579601137;
        bh=YM4Qa/96OhPKqgS9hNxjuyapvPEJG+ACOGoNyJGR+Bg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1z+xmJL/Od8kC41/xxXOYjzcnNiLRfjLW7ZvLAfqBBNQ66eIC2He5WSavlY03yrQY
         o4ErkvKCqrXERCDsdbZaGakhc1aELV5vKZ1nffgiJvPnQiN8kKWRYQ5vv797OYleyI
         sGWNJ21RWEq3PM1UWed3Y2ySZ1zByGQSjFH1hk+w=
Date:   Tue, 21 Jan 2020 15:35:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, psodagud@codeaurora.org,
        tsoni@codeaurora.org, jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: Add sm8250 dts file
Message-ID: <20200121100533.GN2841@vkoul-mobl>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-8-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-8-git-send-email-vnkgutta@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-01-20, 15:39, Venkata Narendra Kumar Gutta wrote:
> Add sm8250 devicetree file for SM8250 SoC and SM8250 MTP platform.
> This file adds the basic nodes like cpu, psci and other required
> configuration for booting up to the serial console.

I see a build warning on this:

Warning (clocks_property): /soc@0/clock-controller@100000:clocks: property size (12) too small for cell size 1

Also it helps to run with W=12 for DTBs

-- 
~Vinod
