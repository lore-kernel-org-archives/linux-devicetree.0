Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE65EC32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 20:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6E072064C
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579119501;
	bh=3JwOuqlpbcZev7CBGp3mv1rS1ZvhivhF/mQO8GzP09I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Sm/hDjmmj6z36hvW9meI/T2W4QvMViMZUADwUri1UKGj+4q84DTrojUwiaoZSZa7/
	 Q53fn/zBsUH9tFAdIvxaky5SFECc2RxunwgORs8wBS1iD+oIMgbf1lfb9BRvFk67Mg
	 Dph1NGU2zqTc1+XeeFsoWfUodB+5+KBvDkOCo+tU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAOUSU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 15:18:20 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33058 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOUST (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 15:18:19 -0500
Received: by mail-oi1-f196.google.com with SMTP id q81so1870560oig.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 12:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=15O0u5i/rLLeI7Psjs2fWQ8eJ8azzo914oeadZHzrto=;
        b=g/6rq8VoEsHOvKIWqMrjrtjUFhrwfrDNesMfEl2ASo/xoYhBklXsRaxWWxq0/xJBPK
         JcSRhcM41Vc3Dhiaa/GayB9lvUnfXV9E+bQrrz6Um4oin5aAhG9dh/FBFhVMsBPgEdMb
         XgnOPo8+TevmbiUBiuqqTf+op4mOgOju2z7nZ9jbCm7/OBy7gF+nke1a+ImEPsC5Sk+4
         eHT1b1Y6mlLVwknBcYqHmNcPqvZBzkoQT5WzCdO5CNCBWkT0qAQBVE1/IBY7T/t9NXA0
         JBgwIU2bWWuvNvPt1pDVTxZBvF9SnOC026WR9o2/EV2gU17w53rbpwERqKLryz6hvwWk
         5pOA==
X-Gm-Message-State: APjAAAWbSDDudRWzE+uvvCw+hJ7yi/WEvrA1pXB3JyniFxC+oL3HqdVb
        Ko1gPCy5eb62LJAqtc8EMGHXbiM=
X-Google-Smtp-Source: APXvYqxusQ7ZEE862ttDa1klMDkhac/IEHFv3XfRrDk4a68bsE1UGiukWPP/61vi8thkh3ASZBS5Tw==
X-Received: by 2002:aca:a883:: with SMTP id r125mr1393667oie.56.1579119498572;
        Wed, 15 Jan 2020 12:18:18 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r63sm5937178oib.56.2020.01.15.12.18.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 12:18:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22061a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 14:18:14 -0600
Date:   Wed, 15 Jan 2020 14:18:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jianxin Pan <jianxin.pan@amlogic.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jian Hu <jian.hu@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: power: add Amlogic secure power
 domains bindings
Message-ID: <20200115201814.GA28654@bogus>
References: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
 <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Jan 2020 19:30:29 +0800, Jianxin Pan wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 40 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 +++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
