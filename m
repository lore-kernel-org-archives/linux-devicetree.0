Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873BBC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:56:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 644822076A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZAXeH8R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440718AbgDPH4v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440705AbgDPH4n (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:56:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30831C061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:56:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y24so3714311wma.4
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4wXkP4Jg2SpgPLNlNFxv80H5dUcR070Yf66C9Z6HJMk=;
        b=YZAXeH8R6EFGR93FoMZPfjyXgVNnyB0Hj/WwXWZygT+Ji3pVWI+parN1ZoWtEhaDl9
         Q5U1HRaEdkgXXziWJzOXdmEnQi+Ixv+kRHTfAOXqNtvoy5Y+ULWZLjJOMVe48WEcB6Px
         9IjKWu91KhFbHP2oBSRpE5zJPUhJjO8yUaqypUToh0XIemuI5LSKcMExLW5++px7ylp4
         Q+G4EnPTSv1BEBVGHaPxUAOG1bAwEQlhBiphm65QiixLfh+8iQHpxgvRp4rmmVbCiXgP
         +G4eE2PpKXkDAwInyc0+aM47axZ8RYq2j82JaF++aF79ay7+PFxVbO97/5J+1l6VOgsI
         vETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4wXkP4Jg2SpgPLNlNFxv80H5dUcR070Yf66C9Z6HJMk=;
        b=d2XV6xDZJbd/Wc5xRBEv5YPcEEhw6xvNSbTKQ3HCuwzEKnKK+NYIL358rwkIvyxWJl
         9//FGLYXmoqPnG+sVkwwSZFcSw26eQJU/xR6IoBmIFDMkpbKu3ShpTbA/84oa76uOmKa
         nvwjYUuxIiTTREwk2E9BaxVtt0bDLNQmbizLeGNpLDcjF0dmnEDPt00Wfhao161zsiom
         UYgzN+iWCSEicgxGyUagYwW1yQRYkvg0IGbSh9yE15TB53m4W4BR0S5q6tof8WFJrP/x
         1gfCoQWmCKV+amKGdZ6gTwQtZfTK+OyRcq8NvGxM05IzullUzCsguW84Q6tEWBAHkcgh
         l7Qw==
X-Gm-Message-State: AGi0PuZclDe00jQ+BBIgAuFw38/F0TMMOwaTf0pyqQwwdANeP0F/Nb1h
        AQ8MK3uMiwHyZI2SoM6Cx59tLHLp9yk=
X-Google-Smtp-Source: APiQypJ2lrl6otM+G6nBiL9EeuYXvwsGAiqWvjGN+NlyKiETI4Foz9VmV53MzLWFGIjTfPzr5oJS6Q==
X-Received: by 2002:a1c:2007:: with SMTP id g7mr3478215wmg.70.1587023800838;
        Thu, 16 Apr 2020 00:56:40 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id l16sm11451926wrp.91.2020.04.16.00.56.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 00:56:40 -0700 (PDT)
Subject: Re: [PATCH 07/11] Documentation: dt-bindings: sound: Add details for
 new dai properties
To:     Ajit Pandey <ajitp@codeaurora.org>, alsa-devel@alsa-project.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        plai@codeaurora.org, bgoswami@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, tiwai@suse.com, stephan@gerhold.net
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-8-git-send-email-ajitp@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d7ed94e7-639e-9c94-6092-e769a2fc6ad1@linaro.org>
Date:   Thu, 16 Apr 2020 08:56:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1586592171-31644-8-git-send-email-ajitp@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 11/04/2020 09:02, Ajit Pandey wrote:
> Add changes related to new sub node defining MI2S dai's properties. Such
> properties needs to be configured via board specific dts files.
> 
+Adding Stephan Gerlhold

Have a look at https://www.spinics.net/lists/alsa-devel/msg107224.html 
patches from Stephan Gerlhold which has better version of specifying sd 
line mask and is inline with DSP based solution too.

--srini

> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index a87a406..727ec03 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -16,6 +16,8 @@ description: |
>     configure Low-Power Audio Interface(LPAIF) core registers across different
>     IP versions.
>   
> +  See also dt-bindings/sound/qcom,lpass.h.
> +
>   properties:
>     compatible:
>       enum:
> @@ -69,6 +71,30 @@ properties:
>     '#sound-dai-cells':
>       const: 1
>   
> +  dai-name:
> +    - description: Each node represents an MI2S dai and conatins dai specific
> +        properties that may change with board layout & dai connections.
> +    - type: object
> +    - properties:
> +      id:
> +        - description: dai id among one of value defined in header
> +        - type: u32
> +      qcom,spkmode-mask:
> +        - description: mask defining data lines used for speaker
> +        - type: u32
> +      qcom,micmode-mask:
> +        - description: mask defining data lines used for mic
> +        - type: u32
> +      qcom,wssrc-mask:
> +        - description: mask defining word-select source internal/extrnal on dai
> +        - type: u32
> +      qcom,loopback-mask:
> +        - description: mask defining loopback enable/disable on dai
> +        - type: u32
> +
> +      required:
> +        - id
> +
>   required:
>     - compatible
>     - reg
> @@ -101,3 +127,10 @@ examples:
>   	#sound-dai-cells = <1>;
>   	qcom,adsp = <&adsp>;
>   
> +        prim-mi2s@0 {
> +		id = <MI2S_PRIMARY>;
> +		qcom,spkmode-mask = <SD1>;
> +		qcom,micmode-mask = <SD0>;
> +                qcom,wssrc-mask = <INTERNAL>;
> +                qcom,loopback-mask = <DISABLE>;
> +	};
> 
