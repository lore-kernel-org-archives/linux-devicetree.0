Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B11C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 13:37:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EE73246AE
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582897048;
	bh=3QTsf6yxc7rs1GNJzVvRB6S0uuiy+3lK2e9AhBjgK9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=I/FiWm5TD+teVUTu4qEvrdBfCFSwRisOF+hQNOKIs7USBBZwj3U7rM6PA4i3aTZCh
	 Hlvg0B1yo385UDEnOTBknn/BS0ZOqbEILVCoebf7MEMmTiO1tJR7+rEOMFie0kvZqD
	 h8dY0PWL+0cGKpT5ZSSC016BAeIK4nKEZCkMODcw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgB1Nh2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 08:37:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:47268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgB1Nh2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Feb 2020 08:37:28 -0500
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16DAA246B2;
        Fri, 28 Feb 2020 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582897047;
        bh=3QTsf6yxc7rs1GNJzVvRB6S0uuiy+3lK2e9AhBjgK9U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PYW1elnCmO11I8yypoUm++QOvuS5mjo4qjQS3WJsoYbB8ouH57FD1Zn+AsHR6BxYh
         uVzJ46ki3kR1P4j1XLTDhlPxJ9Naig6YinLcn3i69w/rkFDyzdiyu+i4WTcH2M9Vba
         CObmYdWF8gL1UScf3zzKgVoPscBnBZUBtirabons=
Received: by mail-qk1-f181.google.com with SMTP id z12so2873793qkg.12;
        Fri, 28 Feb 2020 05:37:27 -0800 (PST)
X-Gm-Message-State: APjAAAUq8X+rZ+44pmYwC/qy8okbFcJOi+c7go+nJxQl9XNZdR+XWsEQ
        qWXkWigoIWgmq14la6Xfs5GW0Zw8H7/Q72tpmg==
X-Google-Smtp-Source: APXvYqxv7Nvxn3gC9nka19zmNC3LNW+zYXn12WGYx0IvQ/8zlbcZx2PSeIw5Jyoc0EsM8EUw7UFcSWSt1Qu2jKo6TFU=
X-Received: by 2002:a05:620a:12a3:: with SMTP id x3mr4553853qki.254.1582897046187;
 Fri, 28 Feb 2020 05:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20200227062754.19131-1-peter.chen@nxp.com> <20200227062754.19131-2-peter.chen@nxp.com>
 <20200227170810.GA2318@bogus> <VI1PR04MB5327992CC6BA891C199D39A08BE80@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5327992CC6BA891C199D39A08BE80@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 28 Feb 2020 07:37:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLQ+5iR_rTaS7D2cvS_psT0XKh=FLH0EmLo2EsE4cuXSA@mail.gmail.com>
Message-ID: <CAL_JsqLQ+5iR_rTaS7D2cvS_psT0XKh=FLH0EmLo2EsE4cuXSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "kishon@ti.com" <kishon@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>,
        Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 28, 2020 at 3:29 AM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> > >  .../bindings/phy/cdns,salvo-phy.yaml          | 47 +++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > warning: no schema found in file:
> > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml: ignoring, error
> > parsing file
> > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-
> > 37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be
> > at root node
> > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:  while scanning a
> > block scalar
> >   in "<unicode string>", line 39, column 5 found a tab character where an indentation
> > space is expected
> >   in "<unicode string>", line 41, column 1
> > Documentation/devicetree/bindings/Makefile:12: recipe for target
> > 'Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts' failed
> > make[1]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts]
> > Error 1
> > Makefile:1263: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> Hi Rob,
>
> After changing some format, I still got below errors, would you please point to
> what's wrong with line 40, column 12? Thanks.

It is line numbers of the generated .example.dts you need to look at.

>
>  31 required:
>  32   - compatible
>  33   - reg
>  34   - "#phy-cells"
>  35
>  36 additionalProperties: false
>  37
>  38 examples:
>  39     -|
>  40     usb3phy: usb3-phy {

Needs a unit address.

>  41         compatible = "nxp,salvo-phy";
>  42         reg = <0x5B160000 0x40000>;
>  43         clocks = <&usb3_lpcg 4>;
>  44         clock-names = "salvo_phy_clk";
>  45         power-domains = <&pd IMX_SC_R_USB_2_PHY>;

Need to include the header for this define.

>  46         #phy-cells = <0>;
>  47     };
