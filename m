Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67838C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A64F206A1
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 09:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deM0ouJ2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgGIJ1K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 05:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgGIJ1J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 05:27:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA68C061A0B
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 02:27:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id q5so1576703wru.6
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9zbcH1ET6mTpiWM4s+enxGFR1R1N7AIvSGt4u+PK5Gg=;
        b=deM0ouJ2Ofrd/TtZmY2cqH50N6qrVDBpP6X8oXdeTC8ELze/OVs4b9MRfdyI9amfxJ
         VscnF7iCk7FvDwBtjoaErnn1TNbhfbniBxC+/cLmmZvzJeXDzbrHuDHBAyf6AHa0Q32e
         BR2UIfIOKJg0orXs/KZraI7loPPyUHAxfW4MllMfINw+nKmYZ2VyOl98aTbClfPquVu1
         87sneoL7eBQehOHrmyyYc597f4ZIyUshyuEI6fsiic8cE5tha5h2ZPnzOt/omBbM/KWz
         ChKvBgPzLvKpvuBQTl7GXwsjdKCkQKm09wwRW0phVPEOVLHYuRT+9XRdWyjprT+BeDou
         J0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9zbcH1ET6mTpiWM4s+enxGFR1R1N7AIvSGt4u+PK5Gg=;
        b=Mq9yjTPm8WP8oPUEEK17C2PlIju/CiFl2QlECmhhfTqldZoTI0lzm6Jmd68A7ZHKgP
         Cz314uAByvM5k+qCqpDWz6XJInfa4YUwDE6VT9zgWxOqsPsrFpSAaJm2Ru3haoX9RfHm
         EI1TODFunikhQOX3nJo72QYiIAwPOaX3iZtF+f5AWaS+ehIcXF4fUZKKMXLqg2PIAOGw
         bb+CNIRHgtM4x1XBiNj6Jugj9VKdFymK96j9F1kkHk+D0zWkNhppOnRRQpX/nUn9VPov
         32KAnL0u0xTF7XGywND8gvZnKHL3exyobIO6Pmt9go+8k7mDa/00ibtyS9C9zaXlIV3w
         Izmg==
X-Gm-Message-State: AOAM530jNH4119raeI+JZAiXTWuWlHhep2IQw4dTnZuZT5sh1Kqq/723
        I0DmE5g54V29l/kLaV0Gd97slg==
X-Google-Smtp-Source: ABdhPJzPjHBBz8yv52oXgA3W16ls5Wg2i8Tm7dIMYZJudQJQzVrpjfNq8dEzSUd61McW+eYmpbpeAw==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr64493990wrw.374.1594286827525;
        Thu, 09 Jul 2020 02:27:07 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c25sm3579138wml.46.2020.07.09.02.27.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:27:06 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
Date:   Thu, 9 Jul 2020 10:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 32c2cdb..04e34cc 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>   
>   Required properties:
>   
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
> +- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> +			  "qcom,lpass-cpu-sc7180"
>   - clocks		: Must contain an entry for each entry in clock-names.
>   - clock-names		: A list which must include the following entries:
>   				* "ahbix-clk"

Can you also list the clocks that are mandatory for this SoC.

--srini


> 
