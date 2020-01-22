Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E66C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 21:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84F1A21835
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 21:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com header.b="H9XnJlKW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAVVXx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 16:23:53 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35540 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgAVVXx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 16:23:53 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so257360wmb.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 13:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IfD2sHXmnb5cZ2BXcNlg3xzWx12/juW/q1PvLrq1TZQ=;
        b=H9XnJlKW4NrgkMp+lXkcd6lO4sOIqVZnBgc2PueEujdvis3tmMnfU2ktFlnj42WlQP
         A8ombJkMpgULZZvwCK/JzWWg1hAt+qNoYm2EFTG7f5nfTf59lEk6pelR4gpKyFMhVpLK
         YDo1iPLOJw9ya3NU0VbLwL/NU4G1ATt96mt/OEqt8MT686s9sP6Ay1E7e+SSr0Oufy/A
         bV3cC5tZcwj9LNEBDU1QpZ8F1IkHzMavNsgq66m4KsJ1YOGESGM9dngO/ewPCl+KCo6F
         VqYm+uyXskyf9Ksqf0kp7xgnyIvbHAMATfXMb+O+C9FUQ/xJUDGA7QRvpnPUWLlZW29u
         /ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IfD2sHXmnb5cZ2BXcNlg3xzWx12/juW/q1PvLrq1TZQ=;
        b=XjqPXdB0aoMCGvnyhTGm0haCFOU/PRiTWD4SEeGrB4YXMdf4xxQ5kKNg6iLtTAsMY6
         FlCIsrHhotowlrcDBmzd0VYZPPF5fMNW6brsgF4P55vOPUa7Zzx95jPT8kh1n7JlU3KG
         bl5soaXaeAeePn2Io8BDpkq+e0dHyXbFwndkL4su+OHVpEtygeT/JwTB3bamYqUeGCSA
         h1c/xq7ppxKbWqOs0ty20nhHkyAkwaJcAikxepu44jksFslIe6/DZF0e7+Wh7SLKPn89
         14Quvwy/ui25r0kBzg/L5hX9ObQCtnvc0KBjnQwEm2i3BAQ7JnTtb9f0fmwbXSJZMoMx
         +yyA==
X-Gm-Message-State: APjAAAXElz4WqeyG/Sg9X88C2Hm5BV0m3Iu62tueoxugLsCF91HQcIQt
        4lwicwzwuA5/4kh5z0r56tbv9dGXkUE=
X-Google-Smtp-Source: APXvYqxoggoKrFJNKmAQWnzaQAnuGlTPtEnN1r7uEC5uuzgffZ8D0zbX6WZZNa+0jD+evxM7/mAWxQ==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr140330wmg.169.1579728230635;
        Wed, 22 Jan 2020 13:23:50 -0800 (PST)
Received: from [192.168.1.37] ([109.129.20.95])
        by smtp.gmail.com with ESMTPSA id q15sm116575wrr.11.2020.01.22.13.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 13:23:50 -0800 (PST)
Subject: Re: [PATCH 2/2] ASoC: tas5756m: Add DT binding document
To:     Rob Herring <robh@kernel.org>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
 <20200118092315.10384-2-charles-antoine.couret@essensium.com>
 <20200122161556.GA23997@bogus>
From:   Couret Charles-Antoine <charles-antoine.couret@essensium.com>
Message-ID: <6bc84a35-b389-dc83-3e0b-6fae05ce2133@essensium.com>
Date:   Wed, 22 Jan 2020 22:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122161556.GA23997@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Le 22/01/2020 à 17:15, Rob Herring a écrit :

> Can you make this a DT schema.
Ok, thank you for the notice.
>> +Optional properties:
>> +
>> +  - mute-gpio : GPIO wired to the mute pin.
> mute-gpios is the preferred form.
I will fix it.
>> +  - hybridflow : an integer between 1 and 9 to select the HybridFlow program.
>> +      if not supplied default DSP program is used.
> Needs a vendor prefix.
>
> Is this something fixed for the life of a board or something users would
> want to change at runtime?

This shouldn't be changed on runtime. It is possible but it does not 
make sense to me.

Firstly we have to stop the device before switching the hybridflow.

Then it changes the available ALSA commands at runtime. The hybridflow 
must be chosen to match requirements of the speaker behind (like 2.1, 
woofer or tweeter).


Thank you for your advices.

Regards,

Charles-Antoine Couret

