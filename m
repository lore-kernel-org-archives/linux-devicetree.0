Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D81C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 17:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E4BB21556
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 17:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+HMjmto"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgCERxD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 12:53:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55737 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgCERxD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 12:53:03 -0500
Received: by mail-wm1-f65.google.com with SMTP id 6so7383603wmi.5
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 09:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KcyqRvrpWHyXsg3I8LCAXPYVgW36m1Cq/+UDOpNaVeo=;
        b=g+HMjmtozjjhSxVZrLc4ZlEqwlIP5Yg+vjIf4mOfH206Navl+swLn6iWKn2xtVanr3
         vRXFfih6VU0JY+fNCbU4QMuffm+ogWSlbru2ro0rmbE+QNXF5ugQMzsR2kbwMFIVO0Ip
         97oUvOGquM3T+mg7eKjAkqifk1m5rOaGxYX5ycvl1JqIszq+O1eI2Mrzefx7aImTs75r
         3S7kIANr8koPWohZ7gC1A1L9lDQ/wOHWx50TQTTVPVYruQvhaSH7o3kHyqEhUitlEhDV
         o6D92P7M6KhG8O09XC7GWWB58m1XVkuE0Hm1VRWOh9d9SI6BHDnyGgyJpH7jpF3G0+e7
         j6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KcyqRvrpWHyXsg3I8LCAXPYVgW36m1Cq/+UDOpNaVeo=;
        b=TIarG30n3we6aA0Y9zbzjUpg9rrGuIEAQ1VaWeU10cUaR/ex8+kgQNNzqYj6QUbhlO
         tbC5ifh8Sh6bK92s4I84JjF9Ay3THxq2zdgmea8oR3Ab2kYIVK9+i2rdM6u40JoUzFJJ
         tdbwB1Dghz93umrL5oaxhKsRmLvrEDRpt2HA293DM8mxC5q4RCWsczA9WjDzZz6YgqAC
         JpUhRk1GuNqMZINU1VAvR/GS1FyubO1InL+wkquvavJaO7sL3HsosrXSvJzfonFlhSj2
         Ucguy2lchZL7EVx4dJjpk3yYWPEqes4XMQtWnwo5XRFXyPFtDotBOIsxXNH2wtETBLh7
         2HSA==
X-Gm-Message-State: ANhLgQ3jA17Mkm+F0NGRURxmX8ev6AUqTDxT0UPOC9HIaup7crVQhzAH
        sRBbpGEeZCNKUmc5ILYRdMrdJA==
X-Google-Smtp-Source: ADFU+vuW+uectjdhI4kDRkzGukNNpiJGlsIkqt4eAKS4/2+Q77zLj1vuhdIE1wBz2TDMOMKBN/x3IQ==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr11012702wmj.170.1583430779468;
        Thu, 05 Mar 2020 09:52:59 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id v14sm6568362wrr.34.2020.03.05.09.52.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 09:52:58 -0800 (PST)
Subject: Re: [PATCH v8 3/7] Bindings: nvmem: add bindings for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
References: <cover.1582905653.git.hns@goldelico.com>
 <37d3b9e4c60692215fff0e75a78ac1e7792aaf75.1582905653.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8d507b75-1c06-b38e-3b7a-8422f63a4959@linaro.org>
Date:   Thu, 5 Mar 2020 17:52:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <37d3b9e4c60692215fff0e75a78ac1e7792aaf75.1582905653.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 28/02/2020 16:00, H. Nikolaus Schaller wrote:
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> 
> This patch brings support for the JZ4780 efuse. Currently it only exposes
> a read only access to the entire 8K bits efuse memory.
> 
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> [converted to yaml]
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 45 +++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml

Applied thanks,
--srini
