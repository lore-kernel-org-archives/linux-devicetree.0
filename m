Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2023DC32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:33:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D661624653
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578173616;
	bh=7+jGGHJV6qP+A3Z9vIGvn7koJ+D4zh6a+42XTDGlfAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XkErIFKmsKXo5SO0vZLPxwCGPaMR1gqN0UTLNZI5Tzymq2MjpFGHmplmLXSzaMPuy
	 GXhSfLu9Zk3SBr31g4HJwwQ1+54A+LWtouTiNno17wh0RbBz0Pv0YUEwKH8AJucTRn
	 kZ0ke+X2BAx9sZSZLW8YsZVOJIoZiTFA5iKlsajU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgADVdg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:33:36 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:41241 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgADVdg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:33:36 -0500
Received: by mail-io1-f66.google.com with SMTP id c16so41196735ioo.8
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E086cLVBXwQ6vOtP7yO03NEZ/tAJB2ltt2lzCZgTgEA=;
        b=LpsApKwgZUNP2AFzJDgbIkcJCodaprifJYdGoj9ghE2lM5gcZ1x+TE4tqqZoNDUMaa
         oJbvEo/v+mxf/yeuA93yHUvotPVRWbFltyzdhF3fmaM5OBCLj5T7/wHzzuRCda3AGE0F
         wY4pkPsOXk8QVNagYKtezYowdgCWW/iwD++Yps3nEWtsLXarz++309gRKEbFY87TMSpd
         EdS1klbT/kxT2iB9UykvKfq2kjBLt+eqCXD5a0qUyBKSzzF1HLb7x1Q9YoGfs6sphC+N
         c7XscVX4wkUR6ulhuUeWpA2L68swE92755wZzOGX/HAsHm2R9nTBS8n5vWJ7lfESV9dY
         jpNg==
X-Gm-Message-State: APjAAAWMkzxD8cJ2n0CNy4bRQTHH8dP7nGzPm37z72sY7hxeELkbXgQF
        hnDWBPSwSbybHOM33X8bxmjHUis=
X-Google-Smtp-Source: APXvYqy1JsPWAz4B7JMrLveczx+QuORkdczObNGTD005dnObv2eXFbl9zd8bi/j7U5IBsJ88wf0png==
X-Received: by 2002:a6b:f617:: with SMTP id n23mr51599137ioh.155.1578173615149;
        Sat, 04 Jan 2020 13:33:35 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b22sm15969916iot.74.2020.01.04.13.33.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:33:34 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:33:32 -0700
Date:   Sat, 4 Jan 2020 14:33:32 -0700
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will@kernel.org,
        bjorn.andersson@linaro.org, olof@lixom.net, maxime@cerno.tech,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Message-ID: <20200104213332.GA19211@bogus>
References: <1577342743-25885-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577342743-25885-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 26, 2019 at 02:45:41PM +0800, Anson Huang wrote:
> Add binding doc for i.MX8MP pinctrl driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.txt        |  38 +

Please make this a DT schema.

>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     | 931 +++++++++++++++++++++
>  2 files changed, 969 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt
> new file mode 100644
> index 0000000..619104b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.txt
> @@ -0,0 +1,38 @@
> +* Freescale IMX8MP IOMUX Controller
> +
> +Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> +for common binding part and usage.
> +
> +Required properties:
> +- compatible: "fsl,imx8mp-iomuxc"
> +- reg: should contain the base physical address and size of the iomuxc
> +  registers.
> +
> +Required properties in sub-nodes:
> +- fsl,pins: each entry consists of 6 integers and represents the mux and config
> +  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
> +  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
> +  <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last integer CONFIG is
> +  the pad setting value like pull-up on this pin. Please refer to i.MX8M Plus
> +  Reference Manual for detailed CONFIG settings.
> +
> +Examples:
> +
> +&uart1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart1>;
> +};
> +
> +iomuxc: pinctrl@30330000 {
> +        compatible = "fsl,imx8mp-iomuxc";
> +        reg = <0x30330000 0x10000>;
> +
> +	pinctrl_uart1: uart1grp {

In particular, define some node naming pattern that you can match on. 
Perhaps "grp$" works.

> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX    0x140
> +			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX    0x140
> +			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS   0x140
> +			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS   0x140
> +		>;
> +	};
> +};
