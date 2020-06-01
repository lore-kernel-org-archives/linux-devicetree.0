Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE627C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 04:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDCF92076B
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 04:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEeMkr8V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFAEUw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 00:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFAEUv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 00:20:51 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B9DC08C5C0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2020 21:20:51 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id nm22so3727861pjb.4
        for <devicetree@vger.kernel.org>; Sun, 31 May 2020 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hMKh+B5RDPq+o7Oive8w/r87Zbfpk7DQQkXRUfW4IOg=;
        b=yEeMkr8V1c7yN+4qOTxaNQ2aaHNewu0hEjwsE4ztlBYLaxeAoUTDgbzHG/eNwqpA/P
         ADC6E0J1xwDpDPCI3hzLDl7hJc3DjP2FcwWAMTtAChrAFq2fzvIp6o2P4yHYNjEucjby
         2aa/lx1bNvFNzOasCR3b6SXbaqGnLqDHgqMDqKGnpAx0iCGMUcM+C54w12zv1ywDzbpB
         ZZGv6z+3pmzCiZplGNcXZZUySenCxB2gXecX/wJxb49TcOM+nyCZJwij1F0qCVM5mb/d
         wYMIC57zxKxJQp58gqL7cVOXdtkGbfVuvswMC8yXpR865usDWXl7UpqwjCLkn1J1mOSh
         PvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hMKh+B5RDPq+o7Oive8w/r87Zbfpk7DQQkXRUfW4IOg=;
        b=LMNbz8cg2/fECQ/XcXVDZviSUESVQX9k/Vdm6rgsFv4ctrvBQ96IUynRP6EUMzciYP
         NfklgpIwl4NgPkgWgzpUsJgmnJNNsWdYMn23h3bDtrGUFBWTcOXwfNM3igvy21jJ1Jt0
         fnfRiPHbft+9ewTFzoIQh+gMekiXpgjv+tnX3stH+ehxTREJxA0LpL0/wgto9t9t8DWu
         Z0+adQvmqHmPJQK0jUvjZIY+2nybW8rb2tKdi5Pc/MPJcF8OD/+trfHtynpw2/tGaH04
         eQbZrOvH3HK5MXJyAdyk1V1fCa8jlD7C4rVaLNOiyCh2DXexojOnkPkz/fC6iwYxhAcx
         rtCw==
X-Gm-Message-State: AOAM5314CAtXAa01p26PZUGs+MiKfjOzvJLLirrgOSzMoFdJqnAhBMze
        3WIGfUDPbobHdqPkT+0B4yuwcw==
X-Google-Smtp-Source: ABdhPJyaIPN0AabB07SDvg8FYmCd2w+PPO/BCoqJqMkvufUjUsRbWQviG1tVmqdXzOsE/DE1c0k1RA==
X-Received: by 2002:a17:90b:888:: with SMTP id bj8mr21322762pjb.148.1590985251318;
        Sun, 31 May 2020 21:20:51 -0700 (PDT)
Received: from localhost ([122.172.62.209])
        by smtp.gmail.com with ESMTPSA id x132sm12983751pfd.214.2020.05.31.21.20.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 21:20:50 -0700 (PDT)
Date:   Mon, 1 Jun 2020 09:50:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/11] dt-bindings: dma: dw: Convert DW DMAC to DT
 binding
Message-ID: <20200601042048.hk73khbz4wipevct@vireshk-i7>
References: <20200529144054.4251-1-Sergey.Semin@baikalelectronics.ru>
 <20200529144054.4251-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529144054.4251-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29-05-20, 17:40, Serge Semin wrote:
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with dt-schema. This commit replaces the Synopsis
> Designware DMA controller legacy bare text bindings with YAML file.
> The only required prorties are "compatible", "reg", "#dma-cells" and
> "interrupts", which will be used by the driver to correctly find the
> controller memory region and handle its events. The rest of the properties
> are optional, since in case if either "dma-channels" or "dma-masters" isn't
> specified, the driver will attempt to auto-detect the IP core
> configuration.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
