Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C27EC33CAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F060C2075B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578953005;
	bh=5Lk0I84bdIIGN9uM7n135AuqzI73cu9k6WUFDpAYPWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B7R4kDMOEk+joi02CCJIMctcPc6T5jnpV41lZYr/IO9oQqIEXmxAwkbQivJard6jj
	 kr7yyrD+5tT33YFQ0VyeoA4R01lHMrKoWQ7nrGvpAZB+qxqaQsHH2KOqBhigCoBd/V
	 G42J/Wre3/95THchunvIGoALmBL4jrPCG80M72YA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgAMWDY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:03:24 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39958 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgAMWDW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:03:22 -0500
Received: by mail-oi1-f193.google.com with SMTP id c77so9845898oib.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TPVDmHPgyswCSzHUpaO4xXgku0uEWmnDxxOITskBC8M=;
        b=YK6wH77vgs/j8FryEkPEe6teqqSQP6WnsAQup9dIny5OtFIO4Tkn9AcU1Jgo2/Aep0
         hwFUXlnpvVpSdY0smVY/CWi1sC3QqY6OftIEhn6kWXYbk6Cjrk5oIYxRwdXttJcx5gPa
         ZpV9CPpi0IrkCqzS0+/mp0YeKIKcOLjjyB5m8y9WgG5VJOVy2GbQv8XTjpc30HbgbKE3
         KZUvekDYucwnmKn6huEQfI/oD1M8xQiHgakKaXLN1e2czKMmthHuskSDcOcM3qr9kOku
         eXPqCLaJrAzTYVIJx2GZ13+uZOgDxmVTqPg29T1VYDQ6sB5YdaUjrcNwZZWjEb7k0sMm
         gYvw==
X-Gm-Message-State: APjAAAX7FG+b3Iz7ZdsqH9cmqlNMBKjntodypiQH3HTWLKPbN2DlqHjh
        vymNtelyQdl+9YmMguQQ7Ib0h1U=
X-Google-Smtp-Source: APXvYqzhYhzYSPEfvbX9Pzh2pcU83cpsWQlSQAd4VLhi+VKTAgK0Fb66Qx1q3G85oFOY/XDU/eBdqg==
X-Received: by 2002:aca:4a87:: with SMTP id x129mr13899871oia.165.1578953001634;
        Mon, 13 Jan 2020 14:03:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w201sm3954917oif.29.2020.01.13.14.03.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:03:19 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:03:18 -0600
Date:   Mon, 13 Jan 2020 16:03:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     skomatineni@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, digetx@gmail.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/21] dt-bindings: clock: tegra: Add DT id for OSC
 clock
Message-ID: <20200113220318.GA1891@bogus>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 7 Jan 2020 20:24:57 -0800, Sowjanya Komatineni wrote:
> OSC is one of the parent for Tegra clocks clk_out_1, clk_out_2, and
> clk_out_3.
> 
> This patch adds DT id for OSC clock to allow parent configuration
> through device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h        | 2 +-
>  include/dt-bindings/clock/tegra124-car-common.h | 2 +-
>  include/dt-bindings/clock/tegra210-car.h        | 2 +-
>  include/dt-bindings/clock/tegra30-car.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
