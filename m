Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24000C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 04:21:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0437020801
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 04:21:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/HAY6GA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgFAEVF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 00:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgFAEVE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 00:21:04 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C84C08C5C9
        for <devicetree@vger.kernel.org>; Sun, 31 May 2020 21:21:04 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v24so1658019plo.6
        for <devicetree@vger.kernel.org>; Sun, 31 May 2020 21:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0pWooxPmBrlgQ0LNPI090mpeVBdObo+y6HOQ/sjn93M=;
        b=o/HAY6GAL/o9D0bF49hI0zAx9I03e67slE/J69vOt7Z/VccdElcCDANHYaQkS9Lfe7
         Uspqlwni3/80XZIqsoxxkoVb+4P++uwAnUP9N47RVTxp2wscjk51IU8NAzv16HO81fJA
         pHd1UWFHm1kKUyYU6HAoeZfS4bbMf0WtqgbMyb9xlwLigL9grjMhLStMHLEFJYk2z5gP
         qU1JNbhmtFKNC8cR3Ml69qflav4STGcLjNU6BAKzBh1uYQjvz4ubq8iL51E2rY2IINmw
         oUqpJWQJeEkiqZ+6pB3Sp3F/jwJzVVg4wba2SrTI2WvFT6VjJ8iCelmsvX7zEd1FGQz+
         5QBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0pWooxPmBrlgQ0LNPI090mpeVBdObo+y6HOQ/sjn93M=;
        b=BK4/2OQhHSdv9oYY9clXbrjp1ks6KaJlloo4moI/SMoJ1IqMBIZ3qLyp0YCxXxE/A0
         FfwIw5bf8CgY1u8VzmtoiRV6yKliG+V7k4hjFDYiotXiNfEMdwUYDTOnC7tlsN0908sW
         4MwDCBmKblyw7xqiKmN72HgtYw3bWWJPQzzw/xAFCXceFWANAq+5OUMNVWYuaYdEzZ3b
         LKsimGA6lRXFIcXYHxmV9CfHY59p0fd4iElZAedRwXcgxEoEXiK3YE059Kgl0SQm6Y3Y
         j99DyfYuU6OKQW1ZyoRuHlnCVEpSrB5mKUieJ755osZKAgGitGrQruNMy5Uq0Y+/N8sq
         PdIA==
X-Gm-Message-State: AOAM5325rTqECZyKZkIDeltz1nxNXMi5qp8z16EuEqb5k6r81TMkqd3O
        rcwEFDx3+32PhfaRyXvWgymzwQ==
X-Google-Smtp-Source: ABdhPJwZZt2+S77vjfH5Yt9RxzONnKBH9FVd8j0bBSGTx4iHzb4Pl1xki3aDzKGPlCl/ZfHZJW6x6g==
X-Received: by 2002:a17:90a:b90:: with SMTP id 16mr21862974pjr.85.1590985264553;
        Sun, 31 May 2020 21:21:04 -0700 (PDT)
Received: from localhost ([122.172.62.209])
        by smtp.gmail.com with ESMTPSA id t4sm9749569pfh.5.2020.05.31.21.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 21:21:03 -0700 (PDT)
Date:   Mon, 1 Jun 2020 09:51:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-mips@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: dma: dw: Add max burst transaction
 length property
Message-ID: <20200601042102.cki4yww56puu4zt7@vireshk-i7>
References: <20200529144054.4251-1-Sergey.Semin@baikalelectronics.ru>
 <20200529144054.4251-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529144054.4251-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29-05-20, 17:40, Serge Semin wrote:
> This array property is used to indicate the maximum burst transaction
> length supported by each DMA channel.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Rearrange SoBs.
> - Move $ref to the root level of the properties. So do with the
>   constraints.
> - Set default max-burst-len to 256 TR-WIDTH words.
> 
> Changelog v3:
> - Add more details into the property description about what limitations
>   snps,max-burst-len defines.
> ---
>  .../bindings/dma/snps,dma-spear1340.yaml          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
