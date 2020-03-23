Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF8CC54EEB
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 15:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0999C20786
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584975689;
	bh=Mjdpt986T1ldJ2PNgdEirefW8V7WMUse0VBqyvInzLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=FSfPlq1rltQ4rJC7Z00jkKcxJ4aP5Vp01dNjsiRcYhSmxzmk0+FscYR1PvXhTfetF
	 MYRt5ujRcz2LApZKzW76U5ZOBr4D0LKAIHnTDty/ajmXJTcEHKGzxVyu4nJr78AQn0
	 UEMQGaRnml6eTcOohITwLGlKXI60DNQ8ynDXII6A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgCWPB2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 11:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727137AbgCWPB2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Mar 2020 11:01:28 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 50BBC20786;
        Mon, 23 Mar 2020 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584975687;
        bh=Mjdpt986T1ldJ2PNgdEirefW8V7WMUse0VBqyvInzLU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pELNKQSZ9Y+jFTB6libgzw5LAWeDFHfMHaw0wkv4fDv16L8sXkqYPfiDUYd4ISu1L
         S2CQ6CdYIikhpgU4Hand0bKB2XPc96n53ZOQ4K32UzxgbaU+LF7WUFT2xMM90XR4TM
         +CEousIEJ5pOt0ERW8p2KExA2jCuNbYAkp9SjLOU=
Received: by mail-qk1-f180.google.com with SMTP id v7so5940207qkc.0;
        Mon, 23 Mar 2020 08:01:27 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1SGw9Do3vZqMQ3V7SS5UMIm2fP2G1zo6becrzpeD54J5WfRgwS
        GLF57tKrlB+fnqWFnUbBUO2QsFs0DEI2Lr1mMg==
X-Google-Smtp-Source: ADFU+vsovYcJxQ824FGfTINBlN6a1LZTevyBZnOGABDqJt8w2Vtx25cz5oGGlXvhb6efVa1u++1ai+JN0Faai4b1ePw=
X-Received: by 2002:a37:8502:: with SMTP id h2mr21650361qkd.223.1584975686359;
 Mon, 23 Mar 2020 08:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200314093941.2533-1-peter.chen@nxp.com> <20200314093941.2533-2-peter.chen@nxp.com>
 <20200318220420.GA15468@bogus> <20200319064655.GB11834@b29397-desktop>
 <CAL_JsqLF6cPCXqZiSOr6DPQad60w9Hd4yemEAmmCAR2TU86CqQ@mail.gmail.com> <AM7PR04MB7157C5F70FCC9C1DD204C8BF8BF50@AM7PR04MB7157.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7157C5F70FCC9C1DD204C8BF8BF50@AM7PR04MB7157.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 23 Mar 2020 09:01:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL+H3mNrS1-vuFhGK6O_T9ibRG3r9fCv-0OvxmCA=NOzA@mail.gmail.com>
Message-ID: <CAL_JsqL+H3mNrS1-vuFhGK6O_T9ibRG3r9fCv-0OvxmCA=NOzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 19, 2020 at 7:29 PM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> > > On 20-03-18 16:04:20, Rob Herring wrote:
> > > > On Sat, 14 Mar 2020 17:39:41 +0800, Peter Chen wrote:
> > > > > Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> > > > > and is only used for USB3 and USB2.
> > > > >
> > > > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > > > ---
> > > > > Changes for v2:
> > > > > - Fix kinds of yaml style issue
> > > > >
> > > > >  .../bindings/phy/cdns,salvo-phy.yaml          | 49 +++++++++++++++++++
> > > > >  1 file changed, 49 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > > > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > >
> > > > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dt.yaml:
> > usb3-phy@5B160000: 'power-domains' does not match any of the regexes: 'pinctrl-
> > [0-9]+'
> > >
> > > The 'power-domains' is described at:
> > > Documentation/devicetree/bindings/power/power_domain.txt
> >
> > .txt files don't generate warnings.
> >
>
> I mean why dt_bind_check report below:
>
> usb3-phy@5B160000: 'power-domains' does not match any of the regexes: 'pinctrl-
> [0-9]+'
>
> It is 'power-domains', and not related to pinctrl.

This means that you haven't defined 'power-domains' as a property for
this binding. The error message just prints out possible regex's.

> > And you might want to be up to date with your kernel tree.
> >
> > >
> > > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings
> > > > /phy/cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000:
> > > > #phy-cells:0:0: 1 was expected
> > > >
> > >
> > > #phy-cell could be 0 if it is a dedicated PHY, eg single function PHY.
> > > See below comments from drivers/phy/phy-core.c
> > >
> > > /**
> > >  * of_phy_simple_xlate() - returns the phy instance from phy provider
> > >  * @dev: the PHY provider device
> > >  * @args: of_phandle_args (not used here)
> > >  *
> > >  * Intended to be used by phy provider for the common case where
> > > #phy-cells is
> > >  * 0. For other cases where #phy-cells is greater than '0', the phy
> > > provider
> > >  * should provide a custom of_xlate function that reads the *args* and
> > > returns
> > >  * the appropriate phy.
> > >  */
> >
> > What's your point? You have an error either in the schema or the example. You
> > must fix it.
>
> I mean #phy-cells can be 0, but your script said it should be 1.

No, your schema said it must be 1:

+  "#phy-cells":
+    const: 1


> I run dt-binding-check at local, no issue is reported, the cdns,salvo-phy.yaml is at the last two.
>
> b29397@b29397-desktop:~/work/projects/upstream/usb$ ./mk.sh dt
> make[1]: Entering directory '/home/b29397/work/projects/upstream/usb/outout/imx_v8'
>   CHKDT   Documentation/devicetree/bindings/arm/cpus.yaml
>   CHKDT   Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
>   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
>   CHKDT   Documentation/devicetree/bindings/arm/fsl.yaml
>   CHKDT   Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
>   CHKDT   Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>   CHKDT   Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-osc-clk.yaml
>   CHKDT   Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-gt-clk.yaml
>   CHKDT   Documentation/devicetree/bindings/display/bridge/anx6345.yaml
>   CHKDT   Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>   CHKDT   Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
>   CHKDT   Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
>   CHKDT   Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
>   CHKDT   Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
>   CHKDT   Documentation/devicetree/bindings/dma/ti/k3-udma.yaml
>   CHKDT   Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
>   CHKDT   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>   CHKDT   Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
>   CHKDT   Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>   CHKDT   Documentation/devicetree/bindings/leds/common.yaml
>   CHKDT   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
>   CHKDT   Documentation/devicetree/bindings/media/ti,cal.yaml
>   CHKDT   Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
>   CHKDT   Documentation/devicetree/bindings/mfd/max77650.yaml
>   CHKDT   Documentation/devicetree/bindings/mmc/mmc-controller.yaml
>   CHKDT   Documentation/devicetree/bindings/net/mdio.yaml
>   CHKDT   Documentation/devicetree/bindings/nvmem/nvmem.yaml
>   CHKDT   Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
>   CHKDT   Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml

There's 2 stages. Checking the schema as above and then checking the
examples. It's the example that's failing.

If there's an unrelated failure, you need to run 'make -k' to keep
going on error.

Rob
