Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C10DC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 16:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 405632146E
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583165662;
	bh=w6WkmcfVHAnsE40YG5gYJcvB1qMxD3OPcvQyOSPq0As=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=TGtCegnawGkkdJC5qwB8NVLHNsacaLUvggZdwJ5wXGjoTc9Gl6ZHh52Im31AFpUpO
	 /OvL5ttfUqiUd0+J2lI2Snwudrk4PTQzVvmXvWw3XRb4vTglY4DJwKcE5XAqldfPnQ
	 BdhzQPYUBu4HxRxvF173qrBJgC579VaXpfsogrQQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgCBQOV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 11:14:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:40748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgCBQOV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Mar 2020 11:14:21 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39B3C217F4;
        Mon,  2 Mar 2020 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583165660;
        bh=w6WkmcfVHAnsE40YG5gYJcvB1qMxD3OPcvQyOSPq0As=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1ucp8TCbPEjGfhiIzzvNO3H8HHPm911JYhN5U/Ic43laExCRh15MxLXdlOSHmPL6N
         WoblI4vC7Ty53F5oiLo7LlxuIJZcm6IIUmR0vA80ENop0TDblLA9rZNOXPCBwhNqvR
         /q3ktPnPmwy8mwCs7kSQ15HU8MTCRa27UKtT5KLo=
Received: by mail-qt1-f171.google.com with SMTP id n1so364769qtv.1;
        Mon, 02 Mar 2020 08:14:20 -0800 (PST)
X-Gm-Message-State: ANhLgQ0G09Y1yTabnwHpN0vm5INJCl2DcTGcm37NDDt4e+6kMzLbUrT1
        NE6X6ElqBJ2te8npbF5KMXcY2FBMzEXBbRtMeg==
X-Google-Smtp-Source: ADFU+vuf1MNiwAyfOKgKQujmhsvKGtlKMpzONlgeHPF8R3qB4GaXPRjw0DpaDnSMSax1rENeIANeMlRa2mBty/jFkBA=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr432309qtq.143.1583165659307;
 Mon, 02 Mar 2020 08:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20200227062754.19131-1-peter.chen@nxp.com> <20200227062754.19131-2-peter.chen@nxp.com>
 <20200227170810.GA2318@bogus> <VI1PR04MB5327992CC6BA891C199D39A08BE80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAL_JsqLQ+5iR_rTaS7D2cvS_psT0XKh=FLH0EmLo2EsE4cuXSA@mail.gmail.com> <20200302025849.GB3834@b29397-desktop>
In-Reply-To: <20200302025849.GB3834@b29397-desktop>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 2 Mar 2020 10:14:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+gVgsODWXCuJrD0ONNsSGTABYUpARDUPxMwePL6Ro82A@mail.gmail.com>
Message-ID: <CAL_Jsq+gVgsODWXCuJrD0ONNsSGTABYUpARDUPxMwePL6Ro82A@mail.gmail.com>
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

On Sun, Mar 1, 2020 at 8:58 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-02-28 07:37:14, Rob Herring wrote:
> > On Fri, Feb 28, 2020 at 3:29 AM Peter Chen <peter.chen@nxp.com> wrote:
> > >
> > >
> > > > >  .../bindings/phy/cdns,salvo-phy.yaml          | 47 +++++++++++++++++++
> > > > >  1 file changed, 47 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > > > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > >
> > > > warning: no schema found in file:
> > > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > > > /builds/robherring/linux-dt-
> > > > review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml: ignoring, error
> > > > parsing file
> > > > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-
> > > > 37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be
> > > > at root node
> > > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:  while scanning a
> > > > block scalar
> > > >   in "<unicode string>", line 39, column 5 found a tab character where an indentation
> > > > space is expected
> > > >   in "<unicode string>", line 41, column 1
> > > > Documentation/devicetree/bindings/Makefile:12: recipe for target
> > > > 'Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts' failed
> > > > make[1]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts]
> > > > Error 1
> > > > Makefile:1263: recipe for target 'dt_binding_check' failed
> > > > make: *** [dt_binding_check] Error 2
> > > >
> > > Hi Rob,
> > >
> > > After changing some format, I still got below errors, would you please point to
> > > what's wrong with line 40, column 12? Thanks.
> >
> > It is line numbers of the generated .example.dts you need to look at.

Sorry, it is the schema file line numbers.

> There is no cdns,salvo-phy.example.dts file at both source folder or

Because there's an error in the schema file.

> obj (-O) folder. I use https://github.com/robherring/dt-schema to
> create dt-doc-validate. The command I use to verify yaml file:
> make O=$OUTKNL dt_binding_check, OUTKNL is my kernel obj folder.
>
> I am sorry I get below error:
>
> make[1]: Entering directory '/home/b29397/work/projects/upstream/usb/outout/imx_v8'
>   CHKDT   Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> /home/b29397/work/projects/upstream/usb/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml:  while parsing a block mapping
>   in "<unicode string>", line 5, column 1
> did not find expected key
>   in "<unicode string>", line 42, column 5
> /home/b29397/work/projects/upstream/usb/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts' failed
> make[2]: *** [Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dts] Error 1
> /home/b29397/work/projects/upstream/usb/Makefile:1262: recipe for target 'dt_binding_check' failed
> make[1]: *** [dt_binding_check] Error 2
> make[1]: Leaving directory '/home/b29397/work/projects/upstream/usb/outout/imx_v8'
> Makefile:179: recipe for target 'sub-make' failed
> make: *** [sub-make] Error 2
>
>   1 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   2 # Copyright (c) 2020 NXP
>   3 %YAML 1.2
>   4 ---
>   5 $id: "http://devicetree.org/schemas/phy/cdns,salvo-phy.yaml#"
>   6 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>   7
>   8 title: Cadence SALVO PHY
>   9
>  10 maintainers:
>  11   - Peter Chen <peter.chen@nxp.com>
>  12
>  13 properties:
>  14   compatible:
>  15     enum:
>  16       - nxp,salvo-phy
>  17
>  18   reg:
>  19     maxItems: 1
>  20
>  21   clocks:
>  22     maxItems: 1
>  23
>  24   clock-names:
>  25     items:
>  26       - const: salvo_phy_clk
>  27
>  28   "#phy-cells":
>  29     const: 1
>  30
>  31 required:
>  32   - compatible
>  33   - reg
>  34   - "#phy-cells"
>  35
>  36 additionalProperties: false
>  37
>  38 examples:
>  39     -|

The indentation is wrong here. It should be 2 spaces, not 4. What
follows has to be indented more than the above line. Indentation is
how the end of the block is found.

>  40     #include <dt-bindings/firmware/imx/rsrc.h>
>  41
>  42     usb3phy: usb3-phy@5B160000 {
>  43         compatible = "nxp,salvo-phy";
>  44         reg = <0x5B160000 0x40000>;
>  45         clocks = <&usb3_lpcg 4>;
>  46         clock-names = "salvo_phy_clk";
>  47         power-domains = <&pd IMX_SC_R_USB_2_PHY>;
>  48         #phy-cells = <0>;
>  49     };
>
>
> --
>
> Thanks,
> Peter Chen
