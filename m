Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB054C2BA19
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 19:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FE5C208FE
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 19:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzZx14fO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgDITAS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 15:00:18 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40926 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgDITAS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 15:00:18 -0400
Received: by mail-lf1-f67.google.com with SMTP id j17so468593lfe.7;
        Thu, 09 Apr 2020 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xSPvBLVxXTk7r4uWb9GSydHFAj4ViQiiOpEJD7YvZqM=;
        b=HzZx14fOthqThXVovSEdzT9xxI/iYxCiakr7ChDEkTRBPbeg+0FtTsefFhjKcZbYso
         08oR6Rv5DR5KJG/uJO42ACFWlWAw+D2taHz/o03ai1SgRLwNOQ0Apvc+nzMplJ1rU8RN
         aHctEtXnwIhH5KRdLzylxrGAWrtuDctU8dbyJUhk9kw3NVGwzUw+Uz49grdCQrKslpTY
         7bszUiajBg2cvJ7mkFzAP0Um88WcRGkZkzvRehzuEp6oySTCZohqWJhvM1xQde/ihFmP
         h5a9SWQ051tA/0yCGkjSvy4KTySxs0VMcf6/RWSAgk6pGbaomPF3JgFIac5bW6UOhoIR
         aacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xSPvBLVxXTk7r4uWb9GSydHFAj4ViQiiOpEJD7YvZqM=;
        b=mFYJDSF2GuWZIVg8pXQiCZaloBS7QPjcfhVQXnoMrlMxDphWiRVtgZ9guevFd1ulM3
         h2C253MiltL5VDwwdFxrufq/yAviljFXDOWhVVW33jKd2Dm2qqzZcNqnDNwvnPkQQUby
         qOoqvV/xq6ipkrWatbrNXmFied4erUNS0/Wr0oM+tCLzlh9SMV/X1mU+dc205KCAYb2y
         xus4ODYbfnvR1MMA3em39TKvHU1/uImJPmX46Cx2uKIwsr/VY5fK97HexdJONOQHzK2V
         dzSURLv/iWZHK9CoVQqjvfrThUdA4HuhYOs/IhegkdqqWlBqhlBeUD1DwvDTyxNE7kMZ
         0cqA==
X-Gm-Message-State: AGi0PuYVFMSAOZvDJORIMOeoz6+G6JLZsvnCRm7Zf+rVzrfvTQ45HoXw
        3hzooyKWTk1FhSvQ+C/oc+4=
X-Google-Smtp-Source: APiQypIO0LHOpLrwPbAk/A6S3Mr6+az19yessXD75VrxMB9u640PipFFtRLBWK2axQvYqRJHAuHoVw==
X-Received: by 2002:ac2:4c21:: with SMTP id u1mr394852lfq.99.1586458814856;
        Thu, 09 Apr 2020 12:00:14 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id e12sm20086369ljl.36.2020.04.09.12.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 12:00:14 -0700 (PDT)
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
Message-ID: <7b2f8a7c-94f1-08d0-b0ce-c61f4eb0a436@gmail.com>
Date:   Thu, 9 Apr 2020 22:00:13 +0300
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
...
> +static void tegra210_emc_debugfs_init(struct tegra210_emc *emc)
> +{
> +	struct device *dev = emc->dev;
> +	unsigned int i;
> +	int err;
> +
> +	emc->debugfs.min_rate = ULONG_MAX;
> +	emc->debugfs.max_rate = 0;
> +
> +	for (i = 0; i < emc->num_timings; i++) {
> +		if (emc->timings[i].rate * 1000UL < emc->debugfs.min_rate)
> +			emc->debugfs.min_rate = emc->timings[i].rate * 1000UL;
> +
> +		if (emc->timings[i].rate * 1000UL > emc->debugfs.max_rate)
> +			emc->debugfs.max_rate = emc->timings[i].rate * 1000UL;
> +	}
> +
> +	if (!emc->num_timings) {
> +		emc->debugfs.min_rate = clk_get_rate(emc->clk);
> +		emc->debugfs.max_rate = emc->debugfs.min_rate;
> +	}
> +
> +	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
> +				 emc->debugfs.max_rate);
> +	if (err < 0) {
> +		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
> +			emc->debugfs.min_rate, emc->debugfs.max_rate,
> +			emc->clk);
> +		return;
> +	}
> +
> +	emc->debugfs.root = debugfs_create_dir("emc", NULL);
> +	if (!emc->debugfs.root) {
> +		dev_err(dev, "failed to create debugfs directory\n");
> +		return;
> +	}
> +
> +	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, emc,
> +			    &tegra210_emc_debug_available_rates_fops);
> +	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> +			    emc, &tegra210_emc_debug_min_rate_fops);
> +	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> +			    emc, &tegra210_emc_debug_max_rate_fops);

I assume you used the checkpatch before sending the patches, no?

I sent out a patch recently to make the permissions readable, please
take a look if you haven't seen it yet.

https://patchwork.ozlabs.org/patch/1254301/
