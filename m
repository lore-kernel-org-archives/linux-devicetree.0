Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3212CC2BAEE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 03:10:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 524122074E
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 03:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MymNgzFA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387718AbgCLDKD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 23:10:03 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36801 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387657AbgCLDKD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 23:10:03 -0400
Received: by mail-io1-f67.google.com with SMTP id d15so4174791iog.3
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 20:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7UlCPqaifwtaHRBNM9OlkA92uhGP3P8YtjrPHhM2qXA=;
        b=MymNgzFAjC7botrqgoNNcIOUuAsnEj/YaRhp929DK9qF9NTSCoVLgqQuyUlCuuWbmc
         xTX8qnat5Lhd0dx2+HvITd9I3p8W2oFWYYiLmPSxLhHu9VDmI3IenMvfEFdho/S8vd2I
         yuLM73a7S/wx1yoSfX+QL5qO2LsLHWifPuA0hRfAhHp4rftW0kW6WLVBjS4J0fyOpN3O
         7r/1++AmSjZryTn2MxF74XgpKzfez6QsJWgBfcCvVchXvT9agRNixKTJPc0eob3a5Q1X
         xoLsGG5eL0WYwn6be71SqmjgQeJZ5NZqTQtoyqlEcSz37jy3pIQVaP16SIN7GWzqFG9X
         3jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7UlCPqaifwtaHRBNM9OlkA92uhGP3P8YtjrPHhM2qXA=;
        b=sHBEJiD3SWPcbynHXzcf+Xp2+GVjou8KIkOONk00zy/ZGjE51DgctmXMddwbywEKRZ
         5AwkQI5O8Hh3ksEXwbzV5iH7a+lYaVqE5xX/efblW/TA/hahKdYB+sYSf0LSCRCaIW1n
         pykCa7GCfZh2u3h/5BAm3TGmh2ZekKuCXqsYlEH+hkFRXg1hANmeOLh842xaHsMrUkpE
         2KLiLeYTqQp/uPj8ouI6Xz4sWQXfN266CsEq/El7Qckv8pMhueaxxN70MOLwX2ZKg9cv
         x/Ipz+J26ury42+G+zztUn2pknsL7vkKUR7qGsAJszqxnu79dV6EoH6QLZun1v9c1QYK
         QVcQ==
X-Gm-Message-State: ANhLgQ1uQ0l8j10hJYgByBwmMkI62Sq1BxKpP4VQt1I0qCQ+6R2Tvo20
        PW2b6AmTLAIxEbEjSCi7WjYD5Q==
X-Google-Smtp-Source: ADFU+vs/imBUNrCpmlxjMLXtYVDj0Q3NbjhYgAeR0ptUEQhLsK2b4DLsRH6n4QvzTYidB9g45CZyjQ==
X-Received: by 2002:a6b:6606:: with SMTP id a6mr5411023ioc.8.1583982602672;
        Wed, 11 Mar 2020 20:10:02 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id y18sm12685362ilg.82.2020.03.11.20.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 20:10:02 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver (UPDATED)
To:     Dave Taht <dave.taht@gmail.com>
Cc:     David Miller <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dcbw@redhat.com>,
        Evan Green <evgreen@google.com>,
        Eric Caruso <ejcaruso@google.com>,
        Susheel Yadav Yadagiri <syadagir@codeaurora.org>,
        Chaitanya Pratapa <cpratapa@codeaurora.org>,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Linux Kernel Network Developers <netdev@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200306042831.17827-1-elder@linaro.org>
 <CAA93jw5enz6-h1m=7tGFToK+E+8z3aD80pBef4AYkFrS2u3hHQ@mail.gmail.com>
From:   Alex Elder <elder@linaro.org>
Message-ID: <e4f436b4-3dd7-970a-9b08-7601fc5428d2@linaro.org>
Date:   Wed, 11 Mar 2020 22:09:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAA93jw5enz6-h1m=7tGFToK+E+8z3aD80pBef4AYkFrS2u3hHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 3/9/20 11:54 AM, Dave Taht wrote:
> I am happy to see this driver upstream.
> 
>> Arnd's concern was that the rmnet_data0 network device does not
>> have the benefit of information about the state of the underlying
>> IPA hardware in order to be effective in controlling TX flow.
>> The feared result is over-buffering of TX packets (bufferbloat).
>> I began working on some simple experiments to see whether (or how
>> much) his concern was warranted.  But it turned out that completing
>> these experiments was much more work than had been hoped.
> 
> Members of the bufferbloat project *care*, and have tools and testbeds for
> exploring these issues. It would be good to establish a relationship with
> the vendor, obtain hardware, and other (technical and financial) support, if
> possible.
> 
> Is there any specific hardware now available (generally or in beta) that
> can be obtained by us to take a harder look? A contact at linaro or QCA
> willing discuss options?

There exists some hardware that could be used, but at the moment I have
not ported this code to operate on it.  It is a current effort however,
and I will be glad to keep you in the loop on progress.  There are a
couple of target environments we'd like to support but until last week
the primary goal was inclusion in the upstream tree.

I will follow up with you after the dust settles a little bit with
this patch series, maybe in a week or so.  In the mean time I'll
also find out whether there are any other resources (people and/or
hardware) available.

					-Alex
