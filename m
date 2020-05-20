Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643DDC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 14:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4446F207C4
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 14:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZsaZMuyU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgETOi1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 10:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgETOi1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 10:38:27 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A20C061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 07:38:26 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id e125so2475732lfd.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=znHUMaP0WqalUm3z5ilzUoUiYdwHWCOzV+xNGyMse2E=;
        b=ZsaZMuyUG/c63T71KQnutZMRMecTwOQ9e+xZo1mwtMXh/HnEKFNpg6iTh0kD/x2p5P
         R+bkxFYJyI7Rb+p865Qe8h6ykpOUJMNvSyu0U3V/pLTMtebveBAZzBJLA2YlswiT/HiW
         3JEGWZi825qVMDTxy3uqUD51ogVTMWXV4IvuxYVsspGIrM68xA5o+KYz3ArvMqW0Ejp+
         Q+fj6ENz3L28xOqXgMxs5JyrVfE4PGh2nI/xLwkHNxbruBYJxETKiI00SYx4eAZZL5CG
         pwLHe19EutHqmeSHTOSnis/KoZgVnrqJ7j07FAeJdcUIsXQEcjZbolyR1Bkbb0uQhsn9
         RMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=znHUMaP0WqalUm3z5ilzUoUiYdwHWCOzV+xNGyMse2E=;
        b=RxQSGnZByLSOtdOfINNWI8j8rffid80N4p7zX80oZYjGecJ/OBEIbC5u/pu18U1Jys
         WJcp0ZBoh0Iec0plhWvDgxAbFKNlPnNnl2Qc18WRn1dwP5VQT2/VyKgenWIJ+Q4LY6qf
         Re8XVw+Jtn7OGUUIScjG2gw2nnzHnqFCo6WeD7dvtIcor0+rXpao31orKwG3pOt6akii
         sK5Z0xwDH3Wh8Rqdxf07Ep2JIx3pWrOvjueoNdtdOahfxNwrNx+5hsZbrzn0Sp/kYS8L
         54xYYpCsyvWKT6ZoNDCq6l86pi9xD9Vp5LkESl727LE4VTIJYhThUfRV4/+avlkfBK0S
         QzOA==
X-Gm-Message-State: AOAM532ZS1Usd4VlWmT/eOhm0X8GquzEW81M1eylH5v771v7JzRAibzI
        NyQ2OfUMk7SV8+wzmlWTN+TfQg==
X-Google-Smtp-Source: ABdhPJycRSmEi00KXgljA417fS6M4KKf8K3xhBn/6ZZOQ6UlRRZvGO2YKvURO4P1Mi9nL2IPvfdrUg==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr2685185lfi.47.1589985505282;
        Wed, 20 May 2020 07:38:25 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4e2:ae96:6d06:66d1:d6f1:88dc? ([2a00:1fa0:4e2:ae96:6d06:66d1:d6f1:88dc])
        by smtp.gmail.com with ESMTPSA id s8sm1116394lfc.83.2020.05.20.07.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 07:38:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-spi@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
        linux-mtd@lists.infradead.org
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
 <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
 <20200501212547.GB15294@bogus>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5359d5a2-5d28-058e-ce37-bc91e1aa7988@cogentembedded.com>
Date:   Wed, 20 May 2020 17:38:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501212547.GB15294@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 02.05.2020 0:25, Rob Herring wrote:

>> Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
>> HyperFlash connected to the SoC to be accessed via the external address
>> space read mode or the manual mode.
>>
>> Document the device tree bindings for the Renesas RPC-IF found in the R-Car
>> gen3 SoCs.
>>
>> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 2:
>> - rewrote the bindings in YAML.
>>
>>   Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++
> 
> Not where we normally put SPI flash controllers...

    RPC-IF is not exactly SPI flash controller, it's bimodal.

MBR, Sergei
