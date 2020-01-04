Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E66DC00523
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E81D7222C3
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578099559;
	bh=3rm119YoJXHsUb64u8/2k3m9Yk3lcWkLTk/qqf9JGAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MLEjSDR11t2prD4UBlKIMFvys7ExuDTWqV8+TOj/6q02ktAw7dx45PxaTwIHNE3TM
	 pW+m4JalNYX7T/uwRx1vnEk98IFFVAVVSURHn+crVCoInjbLxbk75rsTPloYgMfei9
	 dLL2Bx/myzVNaoKSDPET6NTHBjmgvL71iCoZbaCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgADA7S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:59:18 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40730 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgADA7S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:59:18 -0500
Received: by mail-io1-f66.google.com with SMTP id x1so43139043iop.7
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=he5w4xe5758mzPhyknWVdWn5blsV7hMVch+zol3itAA=;
        b=J+gr4jwmtgtdFKgjEqXoa1crOCmfrtLPXaunE/S5hWJGOKn2ThtiZwgF7E9FuzTve1
         H6TOun6skwhCEI+xBQj62CZcMQexl/6l/tBMUY2X5GpQP04NW4GtjKSqfb87lCo7zeoc
         PeB0MGZlczGQHoLBnQXRKf11HNYeAlU4m+pf3aBSaFE2hz/bLMWTWxQh4iN4AwkqZ68J
         moQOUoG5EOLH6gImdXar9MY9mBWA1GJmOJiiEcsKlDxOLb3dj8J6J8S+k2K3cb4DDMIf
         dywRPJATqaGV1Q567o2NZt5hKl0s6StVatE3s15fUR86BLMRvD0wK7XQpDFrPjoEffyK
         te/g==
X-Gm-Message-State: APjAAAVb8Slj6O4Tu0jqRogc945RS7dRt99Qj0GAtuSBuVpbphxDEv+j
        2mSK2wAwutTtRDPkcjmAkald5og=
X-Google-Smtp-Source: APXvYqw99QD9bvWpSlMYYqdlrd8vwKxWzze8PIIl7UZZosQGlHijWZJVRAiWStZ8403+0eR0JYmxyw==
X-Received: by 2002:a02:3f26:: with SMTP id d38mr72994184jaa.53.1578099557263;
        Fri, 03 Jan 2020 16:59:17 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p69sm21440872ilb.48.2020.01.03.16.59.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:59:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:59:15 -0700
Date:   Fri, 3 Jan 2020 17:59:15 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V3 3/5] dt-bindings: qcom: Add ipq6018 bindings
Message-ID: <20200104005915.GA14735@bogus>
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
 <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  3 Jan 2020 17:19:35 +0530, Sricharan R wrote:
> Document the new ipq6018 SOC/board device tree bindings.
> 
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
