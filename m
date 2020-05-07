Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FD0C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68D2020838
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDrvA3KO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEGQFh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 12:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726074AbgEGQFg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 12:05:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D4DC05BD09
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 09:05:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so7446709wmh.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c3Yn1uFhyeEGKm1qKqAVff7fEGoJ/U2annZo6utmYLY=;
        b=nDrvA3KOu4XURf6fZXpzyjFwAtf+wCmEuhlyxvCcjxZwioHQxVZHzlIj1vE9zWNRrn
         EYTIMuo/iOK7oUBGVsWpE3OQh9Bdu+ehlCEZHMwWIzqx94ELhwiAfqpHnBcpoojM96me
         HgCz+xoagRLL8HRLDa9gyunNHf9nuCiw95Ui+la7DaGE319zsfLs732IpZcvs9xCued+
         jmeAivaRjVxT6T0AGON4HvQLegDcyxidgaTQH4+dUBxZlXvIN9BeMHF6ibK4J8GFsoTj
         Xh/3EgHd8pJKLSBZXv737EHoIsQ8rb3dJsZvuw2N3tYHnk/sLzk5nQLXy07Ch2ZMd19W
         5MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c3Yn1uFhyeEGKm1qKqAVff7fEGoJ/U2annZo6utmYLY=;
        b=erH2T7gVcyc54/ZNxFRdNp1gKvgiuesp6z2mAyUo5HYQ9b2Mar0HwAxlHjPXiDXdbZ
         4s8dy6g1OfwG9TRl44Zr9bIEp834TQaHCaK/AXa8GMmNMrfmJ3G0BVG1alHJOC9D06wz
         DUJtHiINx1xJ37AgzuwFRHefX1xewiDlHhXFWRRjywllZFN5l0GmzeIv9q1e9Bvjt4Fy
         3tGSlWfmeJmsP48zbLEAvVKAZ6BjBnpmeMzDEH612XTCbUF7xHyl0P9bBYUEY5W5lx3N
         VpTITbmS8TY+lsoYgtDDkQ1KtYy+8hk8ZVGYnSuC9fTvpkXDowFQG83krt/+vOM02iVz
         zQDQ==
X-Gm-Message-State: AGi0PuZRljH+FpNWAhLSDZ3Onfy6MSh90pmSKvJZn1mHV2siqksR+CwR
        d4kiz8PmREUmcOMsqQ2Tn3KcZQ==
X-Google-Smtp-Source: APiQypKC++tE4E5WgpsRRRcTc2tzFjmw+OZutPp4rNBCIQY0PQvVGm/yjn/jsgGhwbmB9q6GbEpP5Q==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr1625040wmc.158.1588867534735;
        Thu, 07 May 2020 09:05:34 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id l1sm9150398wrc.24.2020.05.07.09.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 09:05:34 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] Add Qualcomm MSM8939 GCC binding and driver
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Konrad Dybcio <konradybcio@gmail.com>
References: <20200423103406.481289-1-bryan.odonoghue@linaro.org>
 <e9d181a9-938c-a69b-8325-2aabeefd0934@nexus-software.ie>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <90cda746-2caa-cb79-9304-17a97886f1fc@linaro.org>
Date:   Thu, 7 May 2020 17:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e9d181a9-938c-a69b-8325-2aabeefd0934@nexus-software.ie>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 07/05/2020 16:57, Bryan O'Donoghue wrote:
> On 23/04/2020 11:34, Bryan O'Donoghue wrote:
>> V3:
>> This update removes the old clock name arrays which I forgot to prune in
>> the previous V2.
>>
>> git diff bod/clk-next+msm8939 bod/clk-next+msm8939-v2.1
> 
> I should have mentioned.
> 
> If you want to test this you'll need to do the following to your 
> msm8939.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi 
> b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index 996425a70014..2d54ad7f99b6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -673,6 +673,10 @@ gcc: clock-controller@1800000 {
>                          reg = <0x1800000 0x80000>;
> +                       clock-names = "xo",
> +                                     "sleep_clk";
> +                       clocks = <&xo_board>,
> +                                <&sleep_clk>;
>                  };
> 
> "xo" and "sleep_clk" names can be resolved.
> 
> ---
> bod

and this...

clocks {
     xo_board: xo_board {
         compatible = "fixed-clock";
         #clock-cells = <0>;
         clock-frequency = <19200000>;
     };

     sleep_clk: sleep_clk {
         compatible = "fixed-clock";
         #clock-cells = <0>;
         clock-frequency = <32768>;
     };
};

