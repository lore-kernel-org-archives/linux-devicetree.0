Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD807C352A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:48:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B53F8206DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581626893;
	bh=RgrJIJWa/NRFJlHjMytiRqtubEa7O/6BI1L2tR6ilJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VAzPTAiz3pyibCD1s6MU0/qUPBeBuHF0Pho7OXxEr4+RXVpuPdGfUXfwiR1y6sqjL
	 2g0ghbF5ofsiNk4SawL5YrPSz4klqHRs7rwUbaMZMIgp6DP6GLdoYTpQcv1ws2bk01
	 kcAFbRFmaUdZZ/H54NiWeYuqj/gjdqGUBzlhcBAU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgBMUsN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 15:48:13 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32955 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgBMUsM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 15:48:12 -0500
Received: by mail-oi1-f194.google.com with SMTP id q81so7246185oig.0
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 12:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g23uUEX59uGCYRgNVfEjNd/uv394+mhBP8SG+Rxtig0=;
        b=m96r44U/GKVsJ8c8Lp3PHoDID8hW33HuqSslLteks6ZrjkOER76mJkdgIiJ34EIaS/
         wd/HjGtoftvwv14W/35joVKd71fAyEQqCn/jSNWrSLE213CzCE+cIJq+y2AxuPDEQObR
         2viuFIxgzSrmbslNhJgp/c8seu8hK2JYmg2i0lFKgofWrcVNY6r727t5XBW7sAL2+Ntj
         5kKhUrMblqTEy6gSs9XMu/vC52vw66WBZsNY0gI4mVQRd96cF0k1+A5rB9NTPnSMtUrB
         RmMCgLbXkDkr2Fi30Ma1OvkRzf8JBWtX6+wzQbTg2PHDhiWi0gYedcWUftgdFJ4KFKdt
         Z73w==
X-Gm-Message-State: APjAAAWPs6qXZDSYOTZjZTK/8AXe5+ZciWVOCbAG4b/4/zZeA/ZaKKVl
        CJMcR2ojoDpTtAwUUqVT0Eua/Do=
X-Google-Smtp-Source: APXvYqxWrnb6ehqImVDwDcCsvZFQ3yUG6DrXv86xot7Alj3fpLbd+jZmZ5DG6VdMU6v72fNb4SxN3A==
X-Received: by 2002:a05:6808:8fc:: with SMTP id d28mr4348781oic.152.1581626892044;
        Thu, 13 Feb 2020 12:48:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p24sm1172493oth.28.2020.02.13.12.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 12:48:11 -0800 (PST)
Received: (nullmailer pid 4686 invoked by uid 1000);
        Thu, 13 Feb 2020 20:48:10 -0000
Date:   Thu, 13 Feb 2020 14:48:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: Add DT bindings for Integrator/AP logical
 modules
Message-ID: <20200213204810.GA4058@bogus>
References: <20200213124620.34982-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213124620.34982-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 13 Feb 2020 13:46:19 +0100, Linus Walleij wrote:
> This adds YAML device tree bindings for the Integrator/AP
> logical modules. These are plug-in tiles used typically for
> FPGA prototyping.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/bus/arm,integrator-ap-lm.yaml    | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: im-pd1@0,0: $nodename:0: 'im-pd1@0,0' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dt.yaml: uart@c0100000: $nodename:0: 'uart@c0100000' does not match '^serial(@[0-9a-f,]+)*$'

See https://patchwork.ozlabs.org/patch/1237467
Please check and re-submit.
