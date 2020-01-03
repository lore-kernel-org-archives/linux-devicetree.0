Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EA5C00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D91A9227BF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578090569;
	bh=cagGhZOxCV0Mw3q8og/AhdWgRjglOTxAWlraDkYvhTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FxEdw/MnCPC3GktKEhEMOCxIzBkbaaUjWGIBV3U0MwauPKuBmFokyFX6RcH4duTND
	 UUw2BVKwX3VZMBwkE9TFvmhLTAF+i7jKPlz30K+U9WDXqn88N5Wu+ic8H7C37S3L5q
	 ZMOE8lK/C3sO0pS4TH0AQ3R2kqgi+Mp0liVY0qdo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgACW33 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:29:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:42131 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgACW32 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:29:28 -0500
Received: by mail-io1-f67.google.com with SMTP id n11so36180042iom.9
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TFDz39ekdeb/43sN0oag/MOWFARZHq5KPLmY9cO79x8=;
        b=PLg7DtfELH0x1zlo5Asxm0okZObjCpWJyXS1kmrgKcP+4A3xrnRZihzgEppBSzWR3F
         GQ+tGhZXn7ADAYsbNmivCv0FNKjXPlcPwg+Sc8fcyfcbNVPZGov3K9x7LLass4+FDk3w
         cb2pLtJ0OWuFTLEUG5KeXkla0LblGpeGw3KU5ztr62JtVf+8iXY76a+bUcbGoUPrYl7X
         h819pOdbJW/rtR78jkmrncgFBoFgWl3WBZgNhQy5bQPZiCr8tHpnotR3hcngrfMOUUsb
         Jy9h3fD4K1Z7A1c/p43JFb9aZ5tAMGQ0B2Z8EeLDMbQhO5RtD8g4MRY1xVeMao7uOnEx
         s4KA==
X-Gm-Message-State: APjAAAWBxSBYMjdKVx/u4yN4LYgwRpYkJMVLEFcyqt63VCRsJj+UZLRN
        56aUl8Bg/jShelqxSHBqW7cncPE=
X-Google-Smtp-Source: APXvYqw8IrceXjHucLLA5+fe1QcLgda4DvssK7lwxJzHBeYSNUC3UyuwhNqhWDEqYbV9HK1t/mozJA==
X-Received: by 2002:a02:c942:: with SMTP id u2mr72698741jao.49.1578090568005;
        Fri, 03 Jan 2020 14:29:28 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t15sm21407374ili.50.2020.01.03.14.29.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:29:27 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:29:25 -0700
Date:   Fri, 3 Jan 2020 15:29:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jian Hu <jian.hu@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20200103222925.GA654@bogus>
References: <20191227094606.143637-1-jian.hu@amlogic.com>
 <20191227094606.143637-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227094606.143637-2-jian.hu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 27 Dec 2019 17:46:02 +0800, Jian Hu wrote:
> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 54 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
