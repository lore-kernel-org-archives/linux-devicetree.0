Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3E5C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E6A424672
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578348926;
	bh=LZfMVj2YhUxgU1ZOH8tV7oa54JqPatxvcoKoH0h3Glc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dpRCK2QF92H60YeQituy8FRVvURJceSBKhyE6iRNyXdWFbtqPLaLIwaCaAANcflde
	 LfmYT1dDGRxJ/aZ5Wc+8H1Tiizp6f9MgUiyzgfy9DJ8NevB47t/ci1pKOErpJz0fZd
	 3ibOCKNhiSZXXnTgXM0NwL80ns/hleCZu7OORVQc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgAFWPY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:15:24 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43927 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgAFWPX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:15:23 -0500
Received: by mail-ot1-f65.google.com with SMTP id p8so37142567oth.10
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CLp8AWOq/ppcpPg4zoNMmXmjnqf4+B8gtYz+J6bqL0A=;
        b=G0JDxgF3UhYQh5C4qnMlK5ci/LfovSWKegH6d3rrLQRQ3y5F8zfGwpidhk5sR4ZbK2
         ZLvN9oY8/ef0/k1WpXvfsd8CF7X/NxJdDDK94Ev/IMPRpauuz263alQtRA8Cpvcf61dW
         2Zz+38KFMWPe8cX4UbvvVzmsXWn+bRdOnRe+85Xr9kZ8hgU8u0yFvjBzpdvgi9v28jIH
         b3BB0GtBP2YBv1BTDqsA6KXjZlpYiu0l0Jg+UBLTAPDdAjlektfybEwEL41y62DKdIeG
         lEn8RcNqFifE4kVaEEBHMH638m40wDQ9gtO13J5KbhU96HIeqvnQ8SHKcbPF3Ff7cjGn
         IRwg==
X-Gm-Message-State: APjAAAXq6mHTrEckVxPLG2YlzKDH6VGe8CuAkvU4UY18YMYQY2BzTwZo
        OMSdRmSvpptuRCj6TLa80mBAZuM=
X-Google-Smtp-Source: APXvYqyaeUyQI69zb7se3JekVirzyUS3jvjRdSgSomMrml8E0sG0M37SpeI34aXu/a1tbtfeX8O4HQ==
X-Received: by 2002:a05:6830:20d3:: with SMTP id z19mr110486279otq.330.1578348922481;
        Mon, 06 Jan 2020 14:15:22 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id a24sm11365036oic.10.2020.01.06.14.15.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:15:21 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:12:46 -0600
Date:   Mon, 6 Jan 2020 16:12:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will@kernel.org, abel.vesa@nxp.com,
        bjorn.andersson@linaro.org, olof@lixom.net, maxime@cerno.tech,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Message-ID: <20200106221246.GA17055@bogus>
References: <1578302992-5723-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578302992-5723-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 06, 2020 at 05:29:50PM +0800, Anson Huang wrote:
> Add binding doc for i.MX8MP pinctrl driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> ---
> Changes since V2:
> 	- use DT schema instead of txt for binding doc.
> ---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       |  65 ++
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     | 931 +++++++++++++++++++++
>  2 files changed, 996 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> new file mode 100644
> index 0000000..cdb6c21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mp-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale IMX8MP IOMUX Controller
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +description:
> +  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> +  for common binding part and usage.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-iomuxc
> +
> +# Client device subnode's properties
> +patternProperties:
> +  '-grp$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      fsl,pins:
> +        $ref: /schemas/types.yaml#/definitions/string

string or...

> +        description:
> +          each entry consists of 6 integers and represents the mux and config

integers?

> +          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> +          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> +          be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last
> +          integer CONFIG is the pad setting value like pull-up on this pin. Please
> +          refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
> +
> +    required:
> +      - fsl,pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    iomuxc: pinctrl@30330000 {
> +        compatible = "fsl,imx8mp-iomuxc";
> +        reg = <0x30330000 0x10000>;
> +
> +        pinctrl_uart2: uart2grp {
> +            fsl,pins = <
> +                MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x49
> +                MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x49

Run 'make dt_binding_check'. Doesn't build:

Error: Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.example.dts:23.21-22 syntax error
FATAL ERROR: Unable to parse input tree

> +            >;
> +        };
> +    };
> +
> +...
