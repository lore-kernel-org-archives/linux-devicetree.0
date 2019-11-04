Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25112CA9EC9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 23:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8A402080F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 23:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572909590;
	bh=0C2zsnNGZm0za2kd9FuTJF2Iff/iNg/oAXzSNDbq5BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PlpDsPF2OeTeAvQMIHualkrFufVWotmQJl4ZNwIOzw0MOwjMc9qkwYipa/1BMy+AL
	 zeUJiBYoHW47zdToBY6VzVitlESKb6rBwLgo4Iw+aF4DlUgo8Cg9l+y46YKVvyudal
	 toLOqkXq6oa3hoJyeaQzjfq0YLsk83JpSlUo8lH4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbfKDXTt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 18:19:49 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44060 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729701AbfKDXTt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 18:19:49 -0500
Received: by mail-ot1-f66.google.com with SMTP id n48so15971010ota.11
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 15:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B/7/LqF/CZv0nsjbB5eZTLdElnSnNe+StwJiRPxE/Ak=;
        b=EhGB59LoMmZlYOqWW4ImqzC8xDCwgkIanRE0emCkwBh/WaJAKM/6/7tJuwW6sYVNwT
         4xiFwhHaKSgWh9grXA6t0Rqkw5aauZuuHbN6JlHKEBT5OW+U2fAVSv3XVYZxNfOSpWjU
         qxDg8X/KnOrjRJNMXG/xtLQBPSEmWP6RDl3A0QdSgBW/pTASgw1FnRtL1T6JPjfIloV2
         WLIaIETQhgsCmQgb5bKe/+g0sLgS9R0D4DriQ8oxmOq6af08AJYCyCKlhpUwyNAN/Z6P
         mj5wTrB+k+QcCB9oTAIsHewSvnU362oUczQJdSXzpcDcHZnOuAMb284qyBYeiqPi4fjl
         rZVw==
X-Gm-Message-State: APjAAAUYkXPVZTysRbJpEkgZI7lWGHA/2gw18cTD5z+AeqdUVtu/erPQ
        tZz99pbKPNVrheyURuavAQ==
X-Google-Smtp-Source: APXvYqzx/aQY2H59hBWjZylMkWY/v6c1DRzRSAcSFDfU/519YbKFGnRvj51ymMTIFmIvqhroh5gmpA==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr3694236otj.88.1572909588162;
        Mon, 04 Nov 2019 15:19:48 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y145sm1219999oia.21.2019.11.04.15.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 15:19:47 -0800 (PST)
Date:   Mon, 4 Nov 2019 17:19:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2 v5] drm/panel: Add DT bindings for Sony ACX424AKP
Message-ID: <20191104231946.GA14609@bogus>
References: <20191103205459.24965-1-linus.walleij@linaro.org>
 <20191103205459.24965-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103205459.24965-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Nov 03, 2019 at 09:54:59PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the Sony ACX424AKP panel.
> Let's use YAML.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v4->v5:
> - Fix up all warnings etc incurred from the now working schema check
>   and DTS compilation.
> - I still have a vert annoying error message in the Sony
>   panel bindings that uses this schema:
>   sony,acx424akp.example.dt.yaml: panel@0: $nodename:0: 'panel@0' does not match '^dsi-controller(@.*)?$'
>   As this is modeled very closely to
>   Documentation/devicetree/bindings/net/mdio.yaml
>   and that one doesn't emit this type of warning for its ethernet-phy@0
>   etc I am pretty much clueless and just can't see what the problem
>   is.

I thought I told you what the problem is on the last version. See below.

> - If I can't figure this out the only viable next step is to drop the
>   ambition to create yaml bindings simply because I'm unable to do
>   it, and go back to traditional text bindings :(
> ChangeLog v3->v4:
> - Adjust to adjusted DSI bindings.
> ChangeLog v2->v3:
> - Put the example inside a dsi-controller so we have a complete
>   example that verifies to the DSI panel generic binding.
> ChangeLog v1->v2:
> - Suggest a stand-alone YAML bindings file for DSI panels in
>   a separate patch, and use that to reference the
>   boolean "enforce-video-mode" attribute for DSI panels
> ---
>  .../display/panel/sony,acx424akp.yaml         | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
> new file mode 100644
> index 000000000000..1c123139b80a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony ACX424AKP 4" 480x864 AMOLED panel
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: ../dsi-controller.yaml#

This schema is for a panel node, not the dsi-controller. You need to 
drop this line. It should be included by DSI controllers.

> +
> +properties:
> +  compatible:
> +    const: sony,acx424akp
> +  reg: true
> +  reset-gpios: true
> +  vddi-supply:
> +     description: regulator that supplies the vddi voltage
> +  enforce-video-mode: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi-controller@a0351000 {
> +        compatible = "ste,mcde-dsi";
> +        reg = <0xa0351000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "sony,acx424akp";
> +            reg = <0>;
> +            vddi-supply = <&foo>;
> +            reset-gpios = <&foo_gpio 0 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
> 
