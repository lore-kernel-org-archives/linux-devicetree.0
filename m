Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EB3C2BB86
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 14:28:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D09722137B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 14:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vb+IEAC9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgDJO20 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 10:28:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34086 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgDJO20 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 10:28:26 -0400
Received: by mail-lf1-f66.google.com with SMTP id x23so1502440lfq.1;
        Fri, 10 Apr 2020 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=114DepywJbkKU/kNK8ifxFxs4xFQzPNOTcqxhW01gig=;
        b=vb+IEAC9JkmoBHpGwKsz0ASSJblQcwkss5tbEZrtPTg9+AUTqKOuJ45fe1+AnyMYL5
         Tc0TT8YjluJfHOZk6aHSWSIt6J2lwEFAzns+Z26BNdGZo50LlLEy+nte46mBQYq9XlR4
         Erh2NVUxmWuLIlA0WGNEuKx4P7G1fWFKNUAwxZHaaqMddS9wt29OKkwNuBQlqLab9W2K
         AJzFosMzctfnHY0/kJpgNgKU8VniE0FScHP4SPYJX9l8R5a5qBdjtJrHaPNY7u9Q6f1O
         4PiwFumFlLTF/S43L+8hGL2dmZqHy00kHSed3woKNhL12tlGBRDCEaTqqhwyWkeIOkl+
         n36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=114DepywJbkKU/kNK8ifxFxs4xFQzPNOTcqxhW01gig=;
        b=NuMLRHDq1W6Mtnw2xmDRjiXgAjSHcMsshwOweCkpkKpd0joYSSDr9R3aOUkFU9ARGI
         KMYgtJEjSKZQWFJk3EjpVczWkqrND3V0ddkUflPlrCXwJXxsQye+5Fj71cWtda8jTixn
         tDc5GtSdo9fBYYI9AQWsCgJJr7sedlNF7Ykd0DjGRfmvZ8C8EqPhWa0+mV6zNjLCqSXv
         W2jadipmFfOqZ8L7qdfrkpLyEWKn48AxNjrfGlyI/lsBVLM1EWIdZK4hkuogedCLOJBR
         bwQ71/e1tYp3AWNUReK8D/m8eBRn3J/ygW/y8AUodJPAZ6fx1SiJOd65rckOQ/qJrfEo
         OJUg==
X-Gm-Message-State: AGi0Pub01PNR/pR91ybA07wLhDUCu3wsS+0f7G4BvNi8JuODUPtVpCTr
        kGlQRTCw+TU1hsqKZtuo0cs=
X-Google-Smtp-Source: APiQypK+DeCHy8Q90LIm8WJtFHRQdsbxGiBMPZhDXTTciugISnAqkYYnxNBFX0eNC3l+386WkJSWwA==
X-Received: by 2002:a19:d84:: with SMTP id 126mr2840495lfn.35.1586528904234;
        Fri, 10 Apr 2020 07:28:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k4sm1351793lfo.47.2020.04.10.07.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 07:28:23 -0700 (PDT)
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
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
 <20200409175238.3586487-12-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <937a1aa6-473a-f6c5-729a-4f34e4ee3abb@gmail.com>
Date:   Fri, 10 Apr 2020 17:28:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-12-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> -enum tegra210_emc_dram_over_temp_state {
> -	TEGRA210_EMC_DRAM_OVER_TEMP_NONE = 0,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X2,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X4,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
> +enum tegra210_emc_refresh {
> +	TEGRA210_EMC_REFRESH_NOMINAL = 0,
> +	TEGRA210_EMC_REFRESH_2X,
> +	TEGRA210_EMC_REFRESH_4X,
> +	TEGRA210_EMC_REFRESH_THROTTLE, /* 4x Refresh + derating. */
>  };

What about to avoid all the unnecessary renamings?
