Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B332C10F25
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 20:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03E7D2464B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 20:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be header.b="YuJ74zCS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgCIUz6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 16:55:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35799 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgCIUz6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 16:55:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id r7so13044147wro.2
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 13:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vhQE94JMdE+kOhEIbg2JbjKBD/IEFt/F1xmPKcV+cCA=;
        b=YuJ74zCSchT9R3Qw3rctLTy0ub6AzdBpEPLkSD80z+B+IQkXZa36AMPNVEM7doIeXL
         zd8Vpkkze/4ANcZsQ7e8Dr1Njf9f4PHcm7FKs+nm7r0UuFVfMQFa1Mrbpnw8xEZ9ZQ8v
         YfqZFMqOWMa+j/RfwTu4lYl9g14Srn1vG8+dTNYq6J0uQlTPQVPwCITtEfB8VSYBSzsH
         tyht4tdxYqCNSvFX0iMdVWadDTPODU60p/CoH123NYBypP+o6h/ypxiFNetmHzRnfYYs
         5VH1fYXNJFXiMp5VC8ZaOpHTtKCxTUuXMeb6O4EJ+kQYucaDX1WuNVEFqXrGKH3x5+cU
         afjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vhQE94JMdE+kOhEIbg2JbjKBD/IEFt/F1xmPKcV+cCA=;
        b=CumG4QpDpoq+HhMegYV02OGcS67I+QRVlgBxut1ZrYmI22r+pBdrIT6zv+N5X647Gb
         6e8OMiR67WI/TSGXEITpOO8/bqt7HU1kqmgMfEy9pvqJnXt6K7kI+5OjfMHDA2zaImtH
         WAi6zsjPTUVwS9Q6zcF9vUYBIfFaah5lFo0mHFSNfu6Mx0IcJknq49Qsmx5BWUHb2rC0
         WYhHeob1kS9ZiSFcAuwoTKgTMO8JfXUOaOFVY0eY+CVNcdqeC8gpEE97gENYgbR8rsU0
         zgxDKZzMuH3HgO59m3Uj6HxFibEDa7g0w9NqT1dXYlLhP0RLo+M9DlRaxwpLNJOTTFPx
         TJ8A==
X-Gm-Message-State: ANhLgQ37NL7Z/VI+pdF40ci537agaYOwpxWWjF7oQnGvE7EzINHOcIcm
        DTJ2vQKZ6k+zP1VSHqDcLj0s156CCZE=
X-Google-Smtp-Source: ADFU+vuzi/IVOqxjAG2WysJRD8gtQgdniJdh8UtOI2sGJBVKb2NSoZEAo9jXf68Q3PWHcOJjeJmg6A==
X-Received: by 2002:adf:9087:: with SMTP id i7mr14374888wri.120.1583787355688;
        Mon, 09 Mar 2020 13:55:55 -0700 (PDT)
Received: from ?IPv6:2a02:a03f:44b4:9700:886c:841d:dea2:ee2a? ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
        by smtp.gmail.com with ESMTPSA id i14sm10352273wrp.82.2020.03.09.13.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 13:55:55 -0700 (PDT)
Subject: Re: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
To:     Rob Herring <robh@kernel.org>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
 <20200308142509.27765-7-charles-antoine.couret@mind.be>
 <20200309203847.GA31358@bogus>
From:   Couret Charles-Antoine <charles-antoine.couret@mind.be>
Message-ID: <e537768b-9d46-afcf-f5b9-0552630cdff7@mind.be>
Date:   Mon, 9 Mar 2020 21:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309203847.GA31358@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Le 09/03/2020 à 21:38, Rob Herring a écrit :
> On Sun,  8 Mar 2020 15:25:09 +0100, Charles-Antoine Couret wrote:
>> Document the bindings for the tas5756m driver.
>>
>> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
>> ---
>>   .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/sound/tas5756m.example.dts:23.37-38 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml] Error 1
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1251057
> Please check and re-submit.

Hi Rob,

I don't understand this issue. My example is based on a real device tree 
and it works fine.

I don't have access to your 
"Documentation/devicetree/bindings/sound/tas5756m.example.dts" file so I 
can not reproduce it. I executed your script before sending the patch 
(but without extracting the example) and it was fine.

Can you explain the issue please?

Thank you in advance and have a nice day,

Charles-Antoine Couret

