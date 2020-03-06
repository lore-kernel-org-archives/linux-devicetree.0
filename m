Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422C0C3F2D6
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 10:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19D5420848
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 10:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="eHClCP1d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgCFKqO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Mar 2020 05:46:14 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35742 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFKqO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Mar 2020 05:46:14 -0500
Received: by mail-wm1-f65.google.com with SMTP id m3so1857162wmi.0
        for <devicetree@vger.kernel.org>; Fri, 06 Mar 2020 02:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d9hiWNQ6J5n3j61Fv/V6tZE2JLkQSqjWYDVkkP/+6yE=;
        b=eHClCP1d12t4vlxl6n7r39rqsL2C7OiH/LXFAM/DgTnYYvZJm3QDPnuKZyuXrv15/V
         0TW0q676MD43QFcX8P/UcUVTRGV3T2Dtc0k8eM8NGh/bvFz779Bc0F3UfQAg51D8Jd/v
         B7QPKgFmd3ebbKD0/xYQGeR/udzkH+4t+LCRBlP9neskFizDKLBfssG9HJdF9ktIGDfo
         7ZSGzm+GfTPaFH97ubJ67Xi+EUBSqOsgEtSm8upPNm6C5h5Oa8EDidDycVKzMouwn0fF
         mYD1G9KXWU8g5yG/xmlhn+lZ8A6mrcVhSlqCcCdC/aA1X5dHF7wG8mBOFoNi6KzafVrC
         K1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d9hiWNQ6J5n3j61Fv/V6tZE2JLkQSqjWYDVkkP/+6yE=;
        b=ItrB6iy38ZIpm62kh+a8WeZ/5ZYpJ2VkEWwJdJHp9uCTRJl5kfgmHLDUCakdkJ7yB4
         Da7E0nVRdIjyZwU1Av5EwzCSvMdl/BESYUkQrZvu1caCM5EnsbQyEc306ifgOeE/b0M0
         K/khGiJU3byeyy1dl4fb+8cAB476/roNrHIYu+NoEwbiVU4GzvD9KZkVgQEHYP4aQCck
         sc/GMmRHYfyRFaHfUsEt6n7mnINMHAMSv6OeGge2D2REgsHPQtud67vrEGSKFc1M1ozH
         iTGsyhpBdrn9BWMnWDIXeDcIj8CtcC9apBiTC7gt6NNdEmBeanN0YBFT85L9CTOlR9IK
         8UUQ==
X-Gm-Message-State: ANhLgQ0fr94fywkKBS3zRWr+sB8a1/BZhe0wSUwAvXsii4BUpuXDmm3G
        OrpVVrC1hk2SdVv59d/+AqV/xQ==
X-Google-Smtp-Source: ADFU+vtyuUNlJMUe6+PBiy69yoy09fo5sBeHo942glDD+YgiDtuy/FwybcSRvw5ZFgPFJU/dlDmHzg==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr3509384wma.86.1583491571878;
        Fri, 06 Mar 2020 02:46:11 -0800 (PST)
Received: from ?IPv6:2a00:1098:3142:14:3ca7:8f7d:279:5ab9? ([2a00:1098:3142:14:3ca7:8f7d:279:5ab9])
        by smtp.gmail.com with ESMTPSA id i14sm972437wmb.25.2020.03.06.02.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 02:46:11 -0800 (PST)
Subject: Re: [PATCH 00/10] Raspberry Pi vmmc regulator support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        f.fainelli@gmail.com, linux-kernel@vger.kernel.org
References: <20200306103857.23962-1-nsaenzjulienne@suse.de>
From:   Phil Elwell <phil@raspberrypi.com>
Message-ID: <b33aadf7-d481-10db-c290-6e53b696b2d4@raspberrypi.com>
Date:   Fri, 6 Mar 2020 10:46:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306103857.23962-1-nsaenzjulienne@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nicolas,

On 06/03/2020 10:38, Nicolas Saenz Julienne wrote:
> The series snowballed into adding a new quirk, as I reliased
> sdhci-iproc's behaviour is not that uncommon.
> 
> Based on Phil Elwell's work in the downstream Raspberry Pi kernel.

There are a few typos in the commit messages ("reliased" -> "realised",
"trough" -> "through"), but otherwise:

Reviewed-by: Phil Elwell <phil@raspberrypi.com>

Phil
