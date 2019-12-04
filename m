Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1856FC2D0B1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 19:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFB702073C
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575488851;
	bh=zWpmvqT+mWP+E3qXpTmmp/0hZKC4SoxlloF49hylhnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sKIcFpraDb6CGAGjoMPbxe6ngopXVt5hRYSEKp+BkDEJVrAgcIZmq7flZqelVmHFH
	 0HCNF0L+sKPnpd9GDeUqvnns8ndeG4nVeB+TEArORZtYGhqSFiiMO3ThLTO36+1uHb
	 /cSpvEEO7SfEHbHvz9BWifxNFuM9jxgoChDMf78U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfLDTrb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 14:47:31 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33730 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbfLDTrb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 14:47:31 -0500
Received: by mail-ot1-f67.google.com with SMTP id d17so404541otc.0;
        Wed, 04 Dec 2019 11:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fSSVErsABcgNucVFgv5+Tl4j1dQ1k3yEdUF30rVKxw4=;
        b=VYKCU2jpcPNPvypurFBJJFtx6mZL479ZBJ01plaESMHd09d+C5do7nY2EEsjaJGxFt
         aPVEO9fewos+ejckeD7l646IrZ2pQT06HAdcMUwf75FP2L4cl9YgttEba9Dg+2JSivlT
         3XSac+rAzA5ZdwaRDDvX57B1DVU5aY61WWZ3n4a29cFFJNGTtbbKr60PnI+HI8KHG5Dx
         N1QUqu19JyXfvbSYyztbbsZKW3XhGI4nsKmgHjhMNQjJyGtbCvZ3DmoMURWkKRtBbvW5
         3Zo9SXR3qhhkMja7xs70bIZUAs3HcAGZISk+F437haYNESw64yFiBg7Yyy+PqFwoNnzD
         3ZVQ==
X-Gm-Message-State: APjAAAVni3C5w2jBcrwEMNy4vp/mTDGXJtS1+yj5uLKIU+1EaImkxYDa
        gQIYqDmQ7zWrpIYf4QLDcA==
X-Google-Smtp-Source: APXvYqxY2MsGzWJvDlpDlLINS+8WTf3i42eiHW+sHpQvD7zrhiISXrPtnUrz0ib1/oyxO1uD0zp+0w==
X-Received: by 2002:a9d:24c1:: with SMTP id z59mr3539199ota.207.1575488849689;
        Wed, 04 Dec 2019 11:47:29 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y24sm2637031oix.31.2019.12.04.11.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 11:47:28 -0800 (PST)
Date:   Wed, 4 Dec 2019 13:47:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
Message-ID: <20191204194728.GA21130@bogus>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <1574405757-76184-3-git-send-email-hanjie.lin@amlogic.com>
 <462c13a6-a2ea-44c7-d43d-46ac82d43bf7@baylibre.com>
 <5357b6c2-e10b-71a3-1e1b-2b641cf5e2df@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5357b6c2-e10b-71a3-1e1b-2b641cf5e2df@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 25, 2019 at 03:52:18PM +0800, Hanjie Lin wrote:
> 
> 
> On 2019/11/22 16:52, Neil Armstrong wrote:
> > Hi,
> > 
> > 
> > On 22/11/2019 07:55, Hanjie Lin wrote:
> >> The Amlogic A1 SoC Family embeds 1 USB Controllers:
> >>  - a DWC3 IP configured as Host for USB2 and USB3
> >>
> >> A glue connects the controllers to the USB2 PHY of A1 SoC.
> >>
> >> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> >> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> >> ---
> >>  .../devicetree/bindings/usb/amlogic,dwc3.txt       | 53 ++++++++++++++++++++++
> >>  1 file changed, 53 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> >> index 6ffb09b..63dc60b 100644
> >> --- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> >> +++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> >> @@ -128,3 +128,56 @@ Example device nodes:
> >>  				snps,quirk-frame-length-adjustment;
> >>  			};
> >>  	};
> >> +
> >> +Amlogic Meson A1 DWC3 USB SoC Controller Glue
> >> +
> >> +The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
> >> +host-only mode.
> >> +
> >> +Required properties:
> >> +- compatible:	Should be "amlogic,meson-a1-usb-ctrl"
> >> +- clocks:       The clocks needed by the usb controller
> >> +- clock-names:  Should contain the name of the clocks: "usb_ctrl", "usb_bus",
> >> +                "xtal_usb_phy", "xtal_usb_ctrl"
> >> +- resets:	a handle for the shared "USB" reset line
> >> +- reg:		The base address and length of the registers
> >> +- phys: 	handle to used PHYs on the system
> >> +	- a <0> phandle can be used if a PHY is not used
> >> +- phy-names:	names of the used PHYs on the system :
> >> +	- "usb2-phy0" for USB2 PHY if USBHOST port is used
> >> +
> >> +Required child nodes:
> >> +
> >> +A child node must exist to represent the core DWC3 IP block. The name of
> >> +the node is not important. The content of the node is defined in dwc3.txt.
> >> +
> >> +PHY documentation is provided in the following places:
> >> +- Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> >> +
> >> +Example device nodes:
> >> +	usb: usb@ffe09000 {
> >> +			status = "okay";
> >> +			compatible = "amlogic,meson-a1-usb-ctrl";
> >> +			reg = <0x0 0xffe09000 0x0 0xa0>;
> >> +			#address-cells = <2>;
> >> +			#size-cells = <2>;
> >> +			ranges;
> >> +
> >> +			clocks = <&clkc_periphs CLKID_USB_CTRL>,
> >> +				 <&clkc_periphs CLKID_USB_BUS>,
> >> +				 <&clkc_periphs CLKID_XTAL_USB_PHY>,
> >> +				 <&clkc_periphs CLKID_XTAL_USB_CTRL>;
> >> +			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
> >> +			resets = <&reset RESET_USBCTRL>;
> >> +			phys = <&usb2_phy0>;
> >> +			phy-names = "usb2-phy0";
> >> +
> >> +			dwc3: usb@ff400000 {
> >> +					compatible = "snps,dwc3";
> >> +					reg = <0x0 0xff400000 0x0 0x100000>;
> >> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> >> +					dr_mode = "host";
> >> +					snps,dis_u2_susphy_quirk;
> >> +					snps,quirk-frame-length-adjustment = <0x20>;
> >> +			};
> >> +	};
> >>
> > 
> > This seems very similar to the g12a bindings, seems you could update the yaml g12a bindings
> > with specific clocks and required for amlogic,meson-a1-usb-ctrl.
> > 
> > Neil
> > 
> > .
> > 
> 
> Hi Neil
> Thanks for the comment.
> 
> 1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
>    A1 has one usb2-phy0 phy and only support host mode.
>    
> 2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
>    G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
>    G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
>    G12A glue driver has a hard coding support phys while A1 only supports host mode.
>    	enum {
> 		USB2_HOST_PHY = 0,
> 		USB2_OTG_PHY,
> 		USB3_HOST_PHY,
> 		PHY_COUNT,
> 		};
>    G12A glue driver only supports one clock while A1 needs four clocks.
>    G12A and A1 phy drivers have different register configurations since hardware differences.
>    
> 3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
>    driver for A1 SoCs, so also dedicated dt-bindings.

Fair enough, I guess. But you're not sharing anything from the 
amlogic,dwc3.txt binding, so make a new doc. And please make it a DT 
schema.

Rob
