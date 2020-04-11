Return-Path: <SRS0=gZHh=53=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BCDC2BBC7
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 20:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD3D920936
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 20:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6IKm4P6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgDKUjN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Apr 2020 16:39:13 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45074 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgDKUjN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Apr 2020 16:39:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id f8so3714112lfe.12;
        Sat, 11 Apr 2020 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dUvGhh7rtUygLtFL6NkahS3nxFZQQQrd2UgQKXcfbs8=;
        b=p6IKm4P6WSbEAcbj6S3ltnZ2NHV2t8qTSW0NL2+R1TTGZLa2zbXXAMYSPOg3HVBLlL
         B0yFCzrnvUvMCA115IQVPj0FnoUHUGTnoN2E9xgDUJlhqT2ELFNVI2zKmxrqx1KgPA44
         UM48pJIiGIqE+sZgpbvelQmutKABl6UJE8DP+wwgnfTiamSfHHZu7Cbaxqj0makocRSi
         Gib5ayNACzWZla1dCsAZi0BHo0ltCbFGSQw8nxkcsvEE61nImKKS9veEH2g+6hrXjGwb
         Dc9V+WHNF7ldjSXauscKvQNCzhQMlN4G6jUkSRkXs0C5elMngQ+xd/8Kx+av69ix8NH8
         d1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dUvGhh7rtUygLtFL6NkahS3nxFZQQQrd2UgQKXcfbs8=;
        b=EBcr89trwDBhipjacftYPV4nu1ShuduBdAEM+z4j7Wnn8PN2/ues6b2uZ0NX2UP9hJ
         Kv7d8nRtrj/X94dglN5yCYxjs51l+fLVkH2oiE77veLw79t+qBNRtDT0IQvSlacF1inw
         UDTTF9iJc6iBCO2KXmXdewhZgw85QqRC24Z0K1JkaORJhwIPWMiIpxLGgGsmuws8qHIQ
         f/biw4WPkavS/R0NGH4r+5CeIs/pQWgxZaQcjdKac5u8IIXIHS1T4FSJI8m8HRhWxKjL
         2/s3jRIRhgwXbOzhSxcpr5kLeqLi5pPczqeP4s/4lGeNrXhDO2bs57DRrQiT5oCyqVOK
         QdzA==
X-Gm-Message-State: AGi0PuYwmXixWnDyshg/pVB41CSq8RvcJKP9TvwnP4vRu4hpWJV1Afnn
        ETLm/VDYrHj5MPOuf41Bad0=
X-Google-Smtp-Source: APiQypITUq6qdmf7TaiDE8oKDktp99wvNTm7FyxMm+PVWG07LwV9SMzTF9rfMVSJnQ9VQ9hHrT6pog==
X-Received: by 2002:ac2:43b1:: with SMTP id t17mr6149082lfl.9.1586637550065;
        Sat, 11 Apr 2020 13:39:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u19sm2435448lji.61.2020.04.11.13.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 13:39:09 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
Message-ID: <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
Date:   Sat, 11 Apr 2020 23:39:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> ...
>> +#define TRIM_REG(chan, rank, reg, byte)					\
>> +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
>> +	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
>> +				 rank ## _ ## reg ## _INDEX]) >>	\
>> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
>> +	 +								\
>> +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
>> +	    byte ## _DATA_BRLSHFT_MASK &				\
>> +	    next->trim_perch_regs[EMC ## chan ##			\
>> +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
>> +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
>> +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
>> +
>> +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
>> +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
>> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) & \
>> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
>> +	 |								\
>> +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
>> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) & \
>> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))

What about replacing those barely readable concatenated macros with a
raw values?

Like:

TRIM_REG(brlshft_idx, ob_ddll_long_dq_rank_mask, ...)
