Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5629FC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 10:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ED8D207ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 10:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYc/PMH+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgERKpA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 06:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgERKpA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 06:45:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4708EC061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 03:45:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so9160693wrx.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hE6kxSlc/mEJ+YZKX8B1+sByxpuTTLbhqigf1AXAxVw=;
        b=hYc/PMH+QFxVF4H286qlDXrAO66M1kONtHWhqYKGHxITlJODYwexD7Xsjow3VJ1R1a
         cG/pRhf1ZghXtPCPbEJqHi9Qt1sLok0yTiFZmNxf4vP7ZdD2C6F4hvmVB6lC2AKGedaX
         wqgo18ftlCSOoCZJ2tjpT2gnrhEOVLab/ZxgKjAe4qT+f84bg0YehgHC2bP43GmaDM5h
         QNSpahnlU9Afm5EtPmBFTk3WWZku1PEx6iozm6zK2VmNqK5puae3YgeNYiQfVnvzfWXj
         ebS6GhnpqCC/oGgIDzOdqI+QJKFWRmdX1Iu/wHLI9s3PeEDbMSLcjxzZPU1zPzuBjgyv
         cKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hE6kxSlc/mEJ+YZKX8B1+sByxpuTTLbhqigf1AXAxVw=;
        b=kO/waVPn3Lr/VRaT4pdoy4J5QQeyqenQQk1xFg/4qCPvagmXRKdjLcVX0tbRVVjbWe
         YShR/KZoc6uAPcEOypt63bEEKVvRFXj5SVmfYkZUtkjif6SIWS/3nWF5nMvzMbRCiLGC
         3ttPENVm0aowQDKCReDpgOMp+/NFAdg9eYDinBYUWl8r2NGoggVdr3tfLY4kYaKEWo8D
         lTUZdyjvuQKxs2AJoz4hq9oD3wwu1jowR/obQFZmSWk6HL274pyyTQWyac5kua4SyAgk
         wUWP8pT7lLdMgUkEpeDRUflIoKKYuNDp7vDFdxLqJuMveepfNmsxU3aEa/NyiklhRPdY
         A9xw==
X-Gm-Message-State: AOAM532iQ64zB0lAeLUNa8oxwyrXoZpX0kpeqCHrzSINMLtkH06iGPHN
        rx9bEvMOnLL2Uv2WkBp9i6erWQ==
X-Google-Smtp-Source: ABdhPJyUpwNXd+W7hZ5l15SAjS0pLYzR8jaVAG7t4kQ6hcKvL6QFGJkllPqOzijkj/oMuxAZcPfAYw==
X-Received: by 2002:adf:fa47:: with SMTP id y7mr18123438wrr.337.1589798698943;
        Mon, 18 May 2020 03:44:58 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id d6sm17201443wra.63.2020.05.18.03.44.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 03:44:58 -0700 (PDT)
Subject: Re: [RFC v1 2/3] drivers: nvmem: Add driver for QTI qfprom-efuse
 support
To:     "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, c_rbokka@codeaurora.org,
        mkurumel@codeaurora.org, dianders@chromium.org
References: <1589307480-27508-1-git-send-email-rbokka@codeaurora.org>
 <1589307480-27508-3-git-send-email-rbokka@codeaurora.org>
 <ffaccce7-95c0-2f95-ad3b-55f1da42eaee@linaro.org>
 <14e1fa51-066c-6e1b-01a4-2103612de9e9@codeaurora.org>
 <d5902226-21b3-7941-6405-688d7a115142@linaro.org>
 <b80aaca0-0594-e04b-5320-b5b3c4478161@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d76e4eb2-fa6a-0b76-3912-83bce678bc96@linaro.org>
Date:   Mon, 18 May 2020 11:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b80aaca0-0594-e04b-5320-b5b3c4478161@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 18/05/2020 11:39, Ravi Kumar Bokka (Temp) wrote:
>>
> 
> Based on the compatible, do i need to separate probe function for 
> qfprom-efuse and maintain separate nvmem object to register nvmem 
> framework. Is this what you are suggesting to implementing this in to 
> one existing driver?

Yes for same driver we should add new compatible string and add support 
to this in existing qfprom driver.
Ideally we should allocate nvmem_config object at probe with different 
parameters based on compatible string.

> Do I need to maintain separate efuse dt node?

Not sure what you mean this w.r.t driver, but based on compatible string 
the device tree bindings might vary like clocks, regulators and so on.

--srini
> 
> Could you please suggest me to proceed further.
