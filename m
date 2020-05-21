Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9094CC433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 10:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F2682070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 10:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="1jUzGc+Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgEUKZk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 06:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgEUKZi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 06:25:38 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB43C061A0F
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 03:25:38 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x22so4167065lfd.4
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w+ByA/OU5zd2HMXcW33Jii/680uEnjVLKLXSM+qMuT0=;
        b=1jUzGc+YDrJFcyLWByQXrO3ofl3UrpgyKZhhQxlXT+meY1I/UarNoNTc89o/tNMBwY
         jUa01vrHcm0mY2fVTltFtMtx7PkXE4Jr1joD2n0lEo47DbSUegwOoUo8nZdbd9+ueovb
         IbL556guwW3C51r6g0+pNvoLDytfto4LKFK+GgVwpSLEnfspEr0Rpzf3mR837pjBF7yi
         mOgdcvvHofBpHizmBRMYxa7UT4bXM9SJfW0NvlcDqbQg+dUlbIYEEYulOtafXHs9rQrE
         +PgbljBTD5yikV97HjcGOaQ6G2YtaCerXWRXWwQSDv0FQzXVqCGG307OYR+TTRNRDm+x
         8V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w+ByA/OU5zd2HMXcW33Jii/680uEnjVLKLXSM+qMuT0=;
        b=QeiHc/+3zG8rs2talAEBghoVbd0v/cFutZW3UIZlfKdDo+Ct4YCnKoRaaKsm41EKDs
         0l8dfojqvOz8UcdS2UWrRfsCmv2/nZKz0sd/R8A4ixSxctAPBrJ5/LUQMoJ12zXAAGs5
         kG1TxEIsgbJN0UL6af3V++0H5DgCDgrDbrT1IIdAQIXp6VnwaXLDbA8VSW4oLr8xw/GZ
         kici4MivI2gbPzX8uS6wJ8dpnp/DGHgrG62FqMbVt0yq5VG06Eyk1rkYzdB1qA/SBl/q
         6g+FL/FoLPXoaQ92UZR0FDL7BYpOJVE2d3nPKmWteDxUbfVG8nDn9eBQpszkB3fA7TvJ
         qsdA==
X-Gm-Message-State: AOAM532T7FoLs0q7P0kRV8OAsxrht35qoxZg2xtsW5FRt88i+Qwd1SmS
        llfHKx9RATrntVBjonfYIKnlMg==
X-Google-Smtp-Source: ABdhPJw/oUYhrJ3sVEgOUQmz+s8MlpdJbN3BdtwCOCxaIzqwQAuJWpVMJjEsrbgCWpgWVlimG3X4Pw==
X-Received: by 2002:ac2:4295:: with SMTP id m21mr4687225lfh.164.1590056735286;
        Thu, 21 May 2020 03:25:35 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2e7:f767:fc67:94af:6414:5968? ([2a00:1fa0:2e7:f767:fc67:94af:6414:5968])
        by smtp.gmail.com with ESMTPSA id i4sm1637149ljn.8.2020.05.21.03.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 03:25:34 -0700 (PDT)
Subject: Re: [PATCH v3 11/14] bus: cdmm: Add MIPS R5 arch support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        David Lechner <david@lechnology.com>,
        John Garry <john.garry@huawei.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
 <20200521003443.11385-12-Sergey.Semin@baikalelectronics.ru>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9ad8383b-8199-1006-cf91-d760bace705e@cogentembedded.com>
Date:   Thu, 21 May 2020 13:25:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521003443.11385-12-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 21.05.2020 3:34, Serge Semin wrote:

> CDMM may be available not only MIPS R2 architectures, but also in
                                 ^ on              -re, it's singular

> newer MIPS R5 chips. For instance our P5600 chip has one. Lets mark
> the CDMM bus being supported for that MIPS arch too.
> 
> Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
[...]

MBR, Sergei
