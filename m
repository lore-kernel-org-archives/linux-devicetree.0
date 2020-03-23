Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD96EC54FCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 13:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85A6A206F8
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 13:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVXxLjLl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgCWNOY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 09:14:24 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40170 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728307AbgCWNOX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 09:14:23 -0400
Received: by mail-lf1-f68.google.com with SMTP id j17so10175455lfe.7;
        Mon, 23 Mar 2020 06:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E1CQtmDgklmhJ8UOqFgoAnNC1Hs9OG7/L9e38p9NJko=;
        b=cVXxLjLlZWbliitWGuklNFT8/b/ipWnER/MBOfcjIMh6YI2DcJv8Cyx9jCRtWTlFX3
         8aWb0xVZUcow9EfUHRy3WtM6HPg1oPk836709omTqABsL0Forp5JACWbxRI8++kjSIzC
         wrOo/5+HT5cgZSfM3tSXwty895eyCGY+SSforbkecWud+7Bj4zApFyUDQl/JcwxeGJUq
         xjglf2IYPC5ZQoCud4+sluk0Ba43iSiYtI3akVpKhQB4EKDbZzcyggCIseS2cMWwiNI0
         MkzPDPw2hazLDwi30/g7ayTZDBEBAatHOfs4FV4loFqVVBcbM/HU0T2F+l9VUf/2txtG
         va4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E1CQtmDgklmhJ8UOqFgoAnNC1Hs9OG7/L9e38p9NJko=;
        b=mBVkgtecUzZ8oxwL2V4B9NlA9r77SRDOLR8z3ncFoqyQiwYjXIMz9k9/G6+mbRr22+
         ApotJUR6xDEDhiIokdh4REay+xRu0N/pc0Evs2C3Zk8w5q8CIsh5mjnOXPR2WHEX6KI5
         iBqI6VT0wZVF6VnEetvUXhiVvxwsyVK43qNPkdg8+EhKq/ovj07adR8Pfn0JAyJWbelP
         i5d9un4/qgJtlzlh/zydtd5U49J47zIbjCVt3BIT7HCqeFYOdd0GXkHDqdTjQbF7j7XI
         MemhmUSXHUqv5ycEVxWzOh51H84cNF1AYL5D7KRl/Zs4QZXd3wlrxu3dIGjuX3nh7W9I
         g8qQ==
X-Gm-Message-State: ANhLgQ3dQYM5u0sQQil+gV1IIJ7RRUJ9YDO12RBVzE/rTAtkyq4vKuhk
        oAMoP//gArpi6htWMNUiEiE=
X-Google-Smtp-Source: ADFU+vsrHRmN74MSFYaqInYZvtueW7JY7IrqwVBW3ExHmXKgr3xW/dEG/H5kvPyo6PdChKHxXDQvNw==
X-Received: by 2002:a19:550e:: with SMTP id n14mr12877759lfe.141.1584969259348;
        Mon, 23 Mar 2020 06:14:19 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id e14sm8399787ljb.97.2020.03.23.06.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 06:14:18 -0700 (PDT)
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1@gmail.com>
 <20200323110531.GD3883508@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d57eaef9-65b9-23e5-e66b-9cea9df19fd5@gmail.com>
Date:   Mon, 23 Mar 2020 16:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323110531.GD3883508@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

23.03.2020 14:05, Thierry Reding пишет:
...
>>> +static const struct dev_pm_ops tegra210_emc_pm_ops = {
>>> +	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
>>> +};
>> What about to use the default suspend/resume level?
> 
> I don't understand. This is already the default suspend/resume level,
> isn't it?

Please use SIMPLE_DEV_PM_OPS, for clarity.
