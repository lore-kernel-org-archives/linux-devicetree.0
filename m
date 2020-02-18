Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1DEC3404D
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 23:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41DED22B48
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 23:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXfuzBzw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgBRXfB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 18:35:01 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:36800 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727962AbgBRXfB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Feb 2020 18:35:01 -0500
Received: by mail-wr1-f45.google.com with SMTP id z3so26105025wru.3
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 15:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2jfZn7HgijJcwCVtPKO+3froana8bPYhk7cFugVBd9k=;
        b=oXfuzBzwgbbcaxtCA0rwbdhtXClKld69lVwUded5y/tvutAyYEy220phgEeiutYHZo
         LGEcuhjUCQB5q/faEjWnxjYFVU/9Z3siMIBCLvgnxX7rBN8eA4e84HpCQVH2ijp0Bzzo
         2jl3IO79g9+gvDB7z66BlgCFcseSgnN8JDnekAQx/q/tA36X5MQX9bkiF8Tovbqet8TV
         yos6rsTBYib0wgCAJEqImx/jDSQQr8qCixqSUDmY/uevWOOYOA10Qc4hOQdlWyyEFkHi
         LRBsGZaCuPzXskuEvKEMxUn2U2cbRdENoQFFyehzUFrv2/wks4yv1hvaD+dGPESsVOcm
         /rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jfZn7HgijJcwCVtPKO+3froana8bPYhk7cFugVBd9k=;
        b=KjjhG4UflXQXD6BJbsNWEPNB9EnjEejoXkaU+D+nF8hz3W95oTwV6t+QPbAjdLsoHe
         T0qgnQ13WL4YyNL9iKnUs1pmqUOYj6rHhIiDVrKG5/AgSCB6jDgIOUly8tMrq/iAZGR6
         xJqfMK2IhLyBze4yK8ZqcDTD/CP5yyopoFfjbMPcrdX0h79q7tMk8c1x5QhlSFwhrD2H
         xzWjpkmapxg62y1mOQ4e5AyGvjKFJDIe3jsJYTMt7ej7eRh7b3Vr+KiWeoGEk5bfvl31
         3zeK1kfRC5hL/FcHFoNs1c4b8uCkx89R3KTiGcEHLNfcjCgL3jEb1091HWm3UTKUxkn8
         +vWw==
X-Gm-Message-State: APjAAAUcus7Rar+xJrQ5sMEWunPI7SlMZVbut8ubimg1+WY3uvVl7TcB
        7j4EA0XysWEpYwZoJt7N7ZsQkttkWZmJ9A==
X-Google-Smtp-Source: APXvYqz7abx4IsR23n+MfNd9cDZHQJRsQFOsZ4S9ShnuWZIFGqFxGYZm9BB8iqJIAEVXqHQ95n68RA==
X-Received: by 2002:a5d:4289:: with SMTP id k9mr32507475wrq.280.1582068899769;
        Tue, 18 Feb 2020 15:34:59 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id r5sm325750wrt.43.2020.02.18.15.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 15:34:59 -0800 (PST)
Subject: Re: [PATCH v6 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
 <20200210120723.91794-5-bryan.odonoghue@linaro.org>
 <20200218204558.GA5022@bogus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <bb39f51c-1285-a93d-006d-f1dcd3877925@linaro.org>
Date:   Tue, 18 Feb 2020 23:35:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218204558.GA5022@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 18/02/2020 20:45, Rob Herring wrote:
>> +      - qcom,usb-ssphy
> Pretty generic... Only 1 SS USB PHY in all of QCom forever?
> 
> IOW, this needs an SoC specific compatible.
> 

Analog IP doesn't generally move across different litho nodes without 
tweaks. I take your point.

I'll take another look at the naming convention here.
