Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E4C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 23:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5372021741
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 23:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtVdWw5U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgBGXtw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 18:49:52 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41635 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgBGXtv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Feb 2020 18:49:51 -0500
Received: by mail-wr1-f66.google.com with SMTP id c9so835225wrw.8
        for <devicetree@vger.kernel.org>; Fri, 07 Feb 2020 15:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KfDASmZsnfGOH8NUUmiKPl3PBbXCb2LGn10+n0ncVHA=;
        b=wtVdWw5Um8em6bZABj9trIml1d9jnPfQQwbNchYwkCuu5B/1w0+CA7CIAWyzlVKZRz
         yyHm6nKo7sL7zCLRH62eCvwBgQo/8X7U6W6RcLZyP0IuPXnj2LH82wV5SD0nNMHA58Ny
         KGwn6gmTmpdPr4QArp7Q89S3JNtQ5ODHlNjitPKvnXmLhxKSAxWYldLCXewQWkTQNj98
         SGZyVDKQXPLdALdTT87Xd2FwCxMiYzjgZppRmLMljtIewnjlvqQT2qaZPpZa6oWsUEGo
         wbmGvEs+qLLDNx30pq6Nk4VYc4yi0DEgH6yr6eXyieVmo5wOTmzntZshKj/TRjFt1Nb2
         FQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KfDASmZsnfGOH8NUUmiKPl3PBbXCb2LGn10+n0ncVHA=;
        b=tzNRAgS38ADvMSIUPl2HwPC15bRMmduGEp1HmoFKxIoEidUzNsAg4Qeza+Nkv6CgkA
         4s9PObLAAl/ehVeaQxEYzkGZ012l16xekVctNLvl86MD7gZhrZEnAAAhleJdMulo3Uhp
         zX+TaXFjsTJzF6SbNhQtLotWY3Z/Np/9rO6PG9HsWuppVtyvOw2poMs0NZA7AVms+GYi
         y8WkRlrdYiXB8zefRLYGXrGMh+k7WjT4QJyzU9K2+iOIPaNTzHlZXAuSYXEE7PzFuPJZ
         Ndrr2zFANC55p+5GgseHSXsZTEqwYy/oDC+UPJT6BRAlaPCtL0/KxUmT3Rv0vYvAWY2b
         Mesg==
X-Gm-Message-State: APjAAAXSFt19vARXDP5fF7MH1c5sDqKBLeSynE/H1kRerE4jd1Fi0Bf2
        02urbwbUmgYgyyKfJGyUoHM/dGhrRHM=
X-Google-Smtp-Source: APXvYqzTspi8f0hdsjZLazh9HFZc9VWwl0L0B3CqmgqqmchS7DnHA0IA+4HzYnMXOFF2Rf1kby3KXQ==
X-Received: by 2002:a5d:5647:: with SMTP id j7mr1398932wrw.265.1581119388067;
        Fri, 07 Feb 2020 15:49:48 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id t9sm5117292wmj.28.2020.02.07.15.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 15:49:47 -0800 (PST)
Subject: Re: [PATCH v5 10/18] usb: dwc3: Add support for usb-conn-gpio
 connectors
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
 <20200207201654.641525-11-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <18f8d6ab-e17f-390a-9160-2b67716e4cf9@linaro.org>
Date:   Fri, 7 Feb 2020 23:49:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207201654.641525-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 07/02/2020 20:16, Bryan O'Donoghue wrote:
> A device node label gpio_usb_connector is used to identify
> a usb-conn-gpio as a child of the USB interface.

This bit of the git log is stale now.

Needs updating
