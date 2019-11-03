Return-Path: <SRS0=PDL5=Y3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC40BCA9EB0
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 08:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81C6B2084D
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 Nov 2019 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572768883;
	bh=WrEkas478AEsFfd0KnxML8A5xD0UqXNqQLN5Vnc5KU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=N2sxZnRxQmEWbQKvveU4CCZ94qsDNFr9uhxXrQ4j5OVmTl/e4NGDB6g4OKXs58OhF
	 lU7Wx++svws63cq+6qq06Wt3BjxvZtmwhfhZ8Qe/tJoDB5Zu4nUPva+R441rfYsQ0Q
	 oJlBeeJ1oJZ5suWaseSjOKoqJ88yNd5q3VlLFf+I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfKCIOk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 Nov 2019 03:14:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:45344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbfKCIOk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 3 Nov 2019 03:14:40 -0500
Received: from localhost (unknown [106.206.31.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A01462084D;
        Sun,  3 Nov 2019 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572768879;
        bh=WrEkas478AEsFfd0KnxML8A5xD0UqXNqQLN5Vnc5KU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbzuH9wvkLuKPbkNjmQVDX+bCQHXPkKnzDNvJLUefqmFXcDSVG4+gt/a4+SWLOoRR
         2Jq5++7/744mtTsA8VB3eDt++oKxNLgio/vO9W4jrstDWEOiD/ErlzM36JRaCm2anz
         gBriK4MRTdfgQgxYYqwZ7+dKv1HwTB5tsBBPs0po=
Date:   Sun, 3 Nov 2019 13:44:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: db845c: Enable LVS 1 and 2
Message-ID: <20191103081434.GN2695@vkoul-mobl.Dlink>
References: <20191002041654.3620-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002041654.3620-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 01-10-19, 21:16, Bjorn Andersson wrote:
> vreg_lvs1a_1p8 and vreg_lvs2a_1p8 are both feeding pins in the low speed
> connectors and should as such alway be on, so enable them.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
