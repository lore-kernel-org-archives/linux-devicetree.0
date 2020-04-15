Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC042C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB18420737
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586968032;
	bh=LWfFbupRx/XswUr5kigXBAfxzxhwYoQenxtzW80yBGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zsxxMb5J6vXKN3Q9QsLucCRRcW8P9u2LJNMzaa+jy6dkXl1VW0mglSqPisUc88tx4
	 Bu0LRzGXoZ6lQC7ObU4QCchmLmXQ89Gj4I43eTDHMZfpt+ppoANOFPE7JOOAqWuszE
	 IsVwhEX5vIrZYr7g50KVRzlBIL/dP3QPSga6p95g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415901AbgDOQ1L (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:27:11 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42680 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415896AbgDOQ1J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 12:27:09 -0400
Received: by mail-oi1-f196.google.com with SMTP id d7so8918993oif.9;
        Wed, 15 Apr 2020 09:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QoWSyptq3r7jFBqwiB+wzQmxtvTTslBNIl5gglBkLNo=;
        b=HY1i5U29vF/9GOuib82x0MVY4aPTAJ1kByhH7rd5InEXWPflAEuLXmhks+XhRIzS14
         6t/iQAil6k6AG4A4gZRtb/4VzEAXCXFTHsa8q3/UMooQPbCc9wIALQRr5aYO0KrM5VCm
         T0v6H0YqB4hITny2oMPHS2BiytbsOA2MG4fw7cYf0SylC4nlg+AsWxcc9qTTOaxJHNwC
         FLyrPd0WFwP4kArXg0bxmm+2Q5Or2zZWmZDeDOPPd9PnQdN4fXI/g/0NeKhFja+R8Id3
         byBhiVX/ywbpE3Y7Fd7JY7i2KlRYzYIOF6UHDc4kTKbY1ZvIBC4uS0h/xj13XLGBkWJV
         hfSA==
X-Gm-Message-State: AGi0PuZBYeE6WOy1iV4aiVJJRJZbMfUvwMP2YhG1VzXAtxDTdsRToXTb
        +/mcHkMGdloQkKsrXGrVmQ==
X-Google-Smtp-Source: APiQypIQ2YEOM2xPkhIK1e7H2ZCsw87caX8t1G4qJ1Op/t60CQS2o6DAcnKl4kvVepkYzIq8a/Hyow==
X-Received: by 2002:aca:5d8a:: with SMTP id r132mr5493oib.129.1586968027427;
        Wed, 15 Apr 2020 09:27:07 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i17sm6365730otc.16.2020.04.15.09.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:27:06 -0700 (PDT)
Received: (nullmailer pid 5651 invoked by uid 1000);
        Wed, 15 Apr 2020 16:27:05 -0000
Date:   Wed, 15 Apr 2020 11:27:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 08/14] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Message-ID: <20200415162705.GA5587@bogus>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-9-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409175238.3586487-9-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  9 Apr 2020 19:52:32 +0200, Thierry Reding wrote:
> From: Joseph Lo <josephl@nvidia.com>
> 
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and a sub-node of EMC table which under the reserved memory
> node. The EMC table contains the data of the rates that EMC supported.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v6:
> - fix example by changing #address-cells and #size-cells
> - remove status property from example
> 
> Changes in v5:
> - convert to dt-schema
> 
>  .../nvidia,tegra210-emc.yaml                  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> 

Applied, thanks.

Rob
