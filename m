Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD393C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 14:26:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84FA82137B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 14:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA+iWDJg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDJO00 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 10:26:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43420 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgDJO00 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 10:26:26 -0400
Received: by mail-lf1-f66.google.com with SMTP id k28so1457698lfe.10;
        Fri, 10 Apr 2020 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eP1CO0zGVUJFrw2vQ17jzVOGCXEZoCCDlgiA/dukixo=;
        b=SA+iWDJgHgqKxiZjc7a4bINFbu4LD1mNNw2l3RzaoQYtqAqI1xWmAJ+eBTj5Mbea82
         6WbZeC+TilzYoOorcJUlUgMfozG6bZnKBqPUgvYMY5bABKH3TDIFREk7ZTgXOI7xULb6
         pDY0g/1cBeAy/kiUAXame3tPbhyY1/SNjUmIhQmtprS2eW0xjJRPz9iRo4ro92OFq7PG
         wU04rhARJgrZ3302FjRUS1k2V8opkQ4QtH9EFRzsAjPitvHsv+vRWkRXVRNz1+HQXZm0
         fj5Np+bqd+PvLF1DZ5TYwQsrHccW+rj3ECnAC2V0sHUrnt8INgfz31zEeCKca0aIVllP
         j+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eP1CO0zGVUJFrw2vQ17jzVOGCXEZoCCDlgiA/dukixo=;
        b=UybYg9Rjo1vVRoNVrAjipPQGHf4MvrzBBfBslgopIP2ki290vw9WgAIKqkID6cYvuR
         6tkz7SYAAfJJ02omEhOQIohq9hPtkLVnTWL0eSuN/g+R9P13ZEWyRksh/KsBl7R03OUo
         q8QtsHB29I11CXRiN7HPEylsDNiXIHAULn+hjeituoN05sD6mlsz0L7+rEOSretATI6/
         BnRDwLIbK1grBb9E1OBFCD+fOLnV5SRSqUNXUWGXYaPx+bFFwDoRXSMFri6gF8IFsrzA
         X2Hv40wTnoRc4AG0cGDEWsq4ZjioV1kEy8Y0p4Wec/X38y8ab6b3rUXMLxQr+XL60Lib
         85tg==
X-Gm-Message-State: AGi0Pua5I2ZfQ/pZtJ8Et+Zox6Pk2PW31/+OV7SFdIaBwDg9FA6OXTW9
        NTYdPlpSs6Tq1/2JqZJVecQ=
X-Google-Smtp-Source: APiQypJjSCss7oyD5NKjhDOjY/E17oNYKt/g/ZmGjxSAjNO65in/+HIwZOtH40f3PA4BP2qbY2M0nw==
X-Received: by 2002:a19:7411:: with SMTP id v17mr2821387lfe.27.1586528784423;
        Fri, 10 Apr 2020 07:26:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id f26sm1153831lja.102.2020.04.10.07.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 07:26:23 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <14cfd13a-5fde-f167-64cb-a61cba119a97@gmail.com>
Date:   Fri, 10 Apr 2020 17:26:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> +static int tegra210_emc_table_device_init(struct reserved_mem *rmem,
> +					  struct device *dev)
> +{
> +	struct tegra210_emc *emc = dev_get_drvdata(dev);
> +	unsigned int i;
> +	void *table;
> +
> +	table = memremap(rmem->base, rmem->size, MEMREMAP_WB);
> +	if (!table) {
> +		dev_err(dev, "failed to map EMC table\n");
> +		return -ENOMEM;
> +	}
> +
> +	emc->timings = (struct tegra210_emc_timing *)table;

No need to cast the void.
