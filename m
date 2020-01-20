Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34401C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 11:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F07E020882
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 11:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACny3NmZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgATLcV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 06:32:21 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40886 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgATLcV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 06:32:21 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so33465351ljk.7
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 03:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6yN8rrBozzeVpfvRSnw+AQgoJD0VnaLplFU5RF4Y2Vg=;
        b=ACny3NmZH7iidHVGHMN3wWIqF0pjOfC2dUdbky+biZc7WclVwxCt2x/tTKgiCJ6RWn
         njuQvx3gKoQRCW71tXIs9CSexDZ25+xBjKE1PWKzJWKeFnQTeedcLG7nSc5CpCDbheQn
         R9Lrjwg4PTMY/Yak96ZZGhew/Jz5ZLd7jn+mkL+T2bu+vpBWa0MUEOVxKCaZJll9NQaJ
         NGP2J84vmhjORySTN8fMS+JGc2ZpZ+Ezu3yktsisLQXiwUlFrN7cLT1x6jhTo4eparfA
         aVG9+u5obgKBPAw0debT3clxdtXP+0GNgMyui7CYUr1xHumBNCqEvrAdqFD5QgHj2ZNl
         MH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6yN8rrBozzeVpfvRSnw+AQgoJD0VnaLplFU5RF4Y2Vg=;
        b=Oe5bWOf7ryAIgS1f1fHl7WGfDXjHp/z+CktKHdMryiWuix6Jgs+cWKU9THO2ukcwwn
         +eC8axdovXqzBwEw+a2Lw1ph50BZgoDDVPLYvN1di4677fm8/FqqKVGvOO6b3oXPDOLk
         MaLUPxiqGdjbdx2cwSb7GklFhHrEYglU1jIXY7+/yOn4KCIS+ewMp877SYxjUyXL4kEA
         5i9R5+PNP1nfsMEuWkeH74F7TA+hiormEoD92x9ormbEd6Fddq5B5sTpt6DzDcxu3I7j
         C2Xcox5/+RpJL+OTRbaqM1Lzp6N2iWZCXWRJMQoSVNsKR37gLr/rWubRW+mUpbfvLVcQ
         tVcg==
X-Gm-Message-State: APjAAAWe6GozmeRizED0GbLV+xqCd5QCAyGn4TxKHc3jStjEKp+xIPaU
        WXc71dpxOC/u9fRPmNcWAASGiQ==
X-Google-Smtp-Source: APXvYqzpZHsNMqkhc8//7+4uCR2cMHw8gPUn7Bg778TisN4U/v606rVqaXvySXmhAr1RK2lAbo75xw==
X-Received: by 2002:a2e:8698:: with SMTP id l24mr13037034lji.94.1579519938886;
        Mon, 20 Jan 2020 03:32:18 -0800 (PST)
Received: from [10.5.21.230] (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.gmail.com with ESMTPSA id r6sm16451437ljk.37.2020.01.20.03.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:32:18 -0800 (PST)
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@iki.fi, peter.griffin@linaro.org,
        dave.stevenson@raspberrypi.com, ezequiel@collabora.com
References: <20200120081558.25258-1-andrey.konovalov@linaro.org>
 <20200120081558.25258-2-andrey.konovalov@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
Date:   Mon, 20 Jan 2020 14:32:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120081558.25258-2-andrey.konovalov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v3 of this patch got "Reviewed-by" from Rob Herring.
But unfortunately, as one more property had to be added afterwards, my understanding
is that that "Reviewed-by" doesn't apply to v4.

Thanks,
Andrey

On 20.01.2020 11:15, Andrey Konovalov wrote:
> Add YAML device tree binding for IMX219 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>   .../devicetree/bindings/media/i2c/imx219.yaml | 114 ++++++++++++++++++
>   MAINTAINERS                                   |   8 ++
>   2 files changed, 122 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> new file mode 100644
> index 000000000000..32d6b693274f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +
> +description: |-
> +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> +  with an active array size of 3280H x 2464V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx219
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.8 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.2 volts
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation.
> +              If this property is omitted four-lane operation is assumed.
> +              For two-lane operation the property must be set to <1 2>.
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.
> +
> +          link-frequencies:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies.
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx219: sensor@10 {
> +            compatible = "sony,imx219";
> +            reg = <0x10>;
> +            clocks = <&imx219_clk>;
> +            VANA-supply = <&imx219_vana>;   /* 2.8v */
> +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
> +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
> +
> +            port {
> +                imx219_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <456000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf6ccca6e61c..aae83699e146 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15351,6 +15351,14 @@ S:	Maintained
>   F:	drivers/media/i2c/imx214.c
>   F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>   
> +SONY IMX219 SENSOR DRIVER
> +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	drivers/media/i2c/imx219.c
> +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +
>   SONY IMX258 SENSOR DRIVER
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>   L:	linux-media@vger.kernel.org
> 
