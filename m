Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8808C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 06:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8045220715
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 06:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHnstMwQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgERGSG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 02:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgERGSG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 02:18:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DBEC061A0C
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 23:18:04 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so4529647pjb.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 23:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M5n9pR8YrcNGB5Twdpxaglw1ExqBVeZzm3ypCn0PPMc=;
        b=DHnstMwQFGeIHpwRXsQCLJAkSNRVmDDGdUFKxiLJy74upnbawfn7dQnkZM0IiIiaZO
         i2YohVkDOY5B4KNM9xk5sHADOEWJ3IJz0/fRzPCg+kkRimTJU7qOC0obJwLQbkIPxYJ6
         omDZifamvwez3z2PdiCJE7dBhU2ziZ69HD+gPhojclA/renBHrtSD9rOqBxvOsV78ry3
         nr/ITYcrlOxaDiCSIsaw7v/f1r/aAs1EsEpgbn2UGyLl6CxmGFsdisCXgYhWwOHY3Z9M
         +rkfi0jokBWL+sbXsv79kBIsE5Ee5cD+Bf4CGbmDTYJUe2EY6Nm+vjSty9VjUny9zwc5
         h5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M5n9pR8YrcNGB5Twdpxaglw1ExqBVeZzm3ypCn0PPMc=;
        b=M877MfoQqNh23+R47QuRJZOPMEH8xoumoyHGStAIg0uLSW3cUszpm0IB5X7ni0Cr6R
         IdUAErw/4uTvb3CkcXH+Q0/N50MXtPkYIRrimoj8uGaoZWBw3ODz4FVyzcd6ICg3jnoT
         9PgdqM/rrqrFUBm+JJ13ddiMl7xR6mrj3c6uS1OXuU9d9jV8+jfvXw+4+k5uTmu+dmCg
         yvUYLtwDof7erKgkUbRMa3MK9Ci81NG9J1X/S70Nta8J6yepDaLGXL4CvAfN1ycMAvbq
         XYQTGKtFILjHAX9ciDmMJYjhIhiLfcVWG6MbdAunUNWVItGt/ALbfCn4LoeeaKBi1Obi
         ZGSQ==
X-Gm-Message-State: AOAM533hBivcSabQg6RLewGcEVQhrBhLugMhh1jWnO7bxCmR59mbwuhe
        RXLu4PumCcH+zchtwlgiO+meQhsnLA==
X-Google-Smtp-Source: ABdhPJyxTNnwHhkx79KytdDT7I/oyy+aWpUyx9e1VX+AOmVzNnaJnertusFfu8KQ0oRzutonEF1f/Q==
X-Received: by 2002:a17:90a:dd44:: with SMTP id u4mr16383713pjv.132.1589782684078;
        Sun, 17 May 2020 23:18:04 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id w7sm7468032pfw.82.2020.05.17.23.18.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 May 2020 23:18:03 -0700 (PDT)
Date:   Mon, 18 May 2020 11:47:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Amit Tomer <amittomer25@gmail.com>
Cc:     =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>, cristian.ciocaltea@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 8/9] arm64: dts: actions: Add MMC controller support
 for S700
Message-ID: <20200518061755.GA25113@mani>
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
 <1589472657-3930-9-git-send-email-amittomer25@gmail.com>
 <b2ad8a81-619f-5f35-9596-c2061ae15e4c@arm.com>
 <CABHD4K9yjUGuo0w-RfhdZQJm3Wtj6bU2H4DXcp4Jjp=e0fFeyA@mail.gmail.com>
 <2cd3cdaf-826e-9d12-9fd4-9f7e2a517ecd@arm.com>
 <CABHD4K-OaQ4Vf_+dg9FMR97ocLeUkDswyEnChPV=H=VcbyUhkg@mail.gmail.com>
 <abbef32c-84d2-7dac-c667-49610d014710@arm.com>
 <CABHD4K-MHs4jhL_9otJJ_xjC1uv1N20mnHqT39b2kob7WjZcVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABHD4K-MHs4jhL_9otJJ_xjC1uv1N20mnHqT39b2kob7WjZcVQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 0518, Amit Tomer wrote:
> Hi,
> 
> > I recommend reading the DT spec, chapter 2.3.1 "compatible":
> > https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf
> 
> My point is more about, DT validation is not happy about this situation.
> For instance when I run dt-validate, do see following:
> 
> /home/amit/work/kernel_work/linux/arch/arm64/boot/dts/actions/s700-cubieboard7.dt.yaml:
> mmc@e0210000: compatible: Additional items are not allowed
> ('actions,s700-mmc' was unexpected)
> 
> and I am not sure if this is because DT and driver has different
> number of compatible strings.
> 

Yeah, the DT YAML validation tool doesn't allow this. And there were patches
removing the additional compatible from DTS.

I don't know if the DT fallback is discouraged or not.

Anyway, is enough investigation done to justify that we need SoC specific tweaks
in the driver? I think I did look into the downstream code for s700/s500 while
upstreaming this driver and convinced myself that the same driver could be
reused without modifications.

Thanks,
Mani

> Thanks
> Amit
