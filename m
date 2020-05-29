Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF8AC433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 08:49:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB7E12072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 08:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="kaFjl6ha"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgE2Itb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 04:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2Ita (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 04:49:30 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924E4C03E969
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 01:49:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k5so1594374lji.11
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1l4xtGOxhqqlxgIkGPyKhx55xNwxZ5usjoQR3ai/dCs=;
        b=kaFjl6haj8O8E8+DmE686PPUoSGeVZy1HTTpnNUDRBpxA/k+lKvri2wRisWgT2iT2y
         FVKLgHhA10JSdaHrsa+l2lQXc9FLLoHrOqQ0zr5/4PL+ZemuzIFMFMe7aYdCnLSIIH9w
         UuceE594b7VMWDsCtVStURZka3tsH9a4a64zzX9Cw2fizZalzwZnQhFwrnuGla08HZV+
         2TxIq4Zmk5oq2Y7/UPSUkPKe2A7rHEV7qxIuz2z7gS+xakAlKAsi/vqsq28SyAgPSHjF
         KqTlfO7kMhzOBOBgxvy4KyFKzshw/66MYuiLhXcsYo2Hds8lD9tN+I3Hdl3t3ORl9dOt
         a80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1l4xtGOxhqqlxgIkGPyKhx55xNwxZ5usjoQR3ai/dCs=;
        b=XUhGXTGpvFb3XIIrV7TGRfjsZH38EqRlZPKwjYVu6YkZs3EaS5GFP7gGVpouTK+4oB
         OuAq/wvL9HyNfz1LozB53xsKpZSZi5EREr20WxcsO02BaCE2Os3EpCS2xZ8xqyeV7EA9
         WWx3D/2EFSfyINNG4Rr0S1CqYdINdinVHJfzcBqVdWqRUfFM4v2+dw1Q8ydlwcx6w2WQ
         OqvM5Z8baufwevaogN9schZn56o1rrpcOUWmqV9L5zrE52YTTiE4Z2ThX4Hem2sO9+9p
         zY8Eds1DH+IJo+pSKW09IQUWPib0IlAgQnA6Jhmo3WF4BE6c2rt6wfhGzrk5JL46PUYA
         D4iQ==
X-Gm-Message-State: AOAM533wyA607lGngbQM/XytLt35YdNOO6rUmUCi1fuP+YVvBPqm8aN7
        8u3b1OgwUIFn0rLJCIm1eAWtBA==
X-Google-Smtp-Source: ABdhPJzXUde5z0UiZwHiMG/jkD4n9ZihV6t4jN0gXDun6HT126YSr0NDTPIAn28I3N14iaTVHdMcYg==
X-Received: by 2002:a2e:7f08:: with SMTP id a8mr3840705ljd.332.1590742168088;
        Fri, 29 May 2020 01:49:28 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2d5:373e:50fc:221d:1226:f18a? ([2a00:1fa0:2d5:373e:50fc:221d:1226:f18a])
        by smtp.gmail.com with ESMTPSA id l16sm2119454lfg.2.2020.05.29.01.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 01:49:27 -0700 (PDT)
Subject: Re: [PATCH v5 01/16] spi: dw: Set xfer effective_speed_hz
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Mark Brown <broonie@kernel.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, Feng Tang <feng.tang@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200529035915.20790-1-Sergey.Semin@baikalelectronics.ru>
 <20200529035915.20790-2-Sergey.Semin@baikalelectronics.ru>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <afdf414a-df95-b130-85e8-cda5bf4e9405@cogentembedded.com>
Date:   Fri, 29 May 2020 11:49:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529035915.20790-2-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 29.05.2020 6:58, Serge Semin wrote:

> Seeing DW APB SSI controller doesn't support setting the exactly
> requested SPI bus frequency, but only a rounded frequency determined
> by means of the odd-numbered half-worded reference clock divider,
> it would be good tune the SPI core up and initialize the current
                   ^ to?

> transfer effective_speed_hz. By doing so the core will be able to
> execute the xfer-related delays with better accuracy.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Feng Tang <feng.tang@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
[...]

MBR, Sergei
