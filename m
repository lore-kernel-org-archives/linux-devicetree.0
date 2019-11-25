Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDBBC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 07:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E8302071A
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 07:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfKYHvz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 02:51:55 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:18618 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfKYHvz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 02:51:55 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 25 Nov
 2019 15:52:19 +0800
Subject: Re: [PATCH 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <1574405757-76184-3-git-send-email-hanjie.lin@amlogic.com>
 <462c13a6-a2ea-44c7-d43d-46ac82d43bf7@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <5357b6c2-e10b-71a3-1e1b-2b641cf5e2df@amlogic.com>
Date:   Mon, 25 Nov 2019 15:52:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <462c13a6-a2ea-44c7-d43d-46ac82d43bf7@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 2019/11/22 16:52, Neil Armstrong wrote:
> Hi,
> 
> 
> On 22/11/2019 07:55, Hanjie Lin wrote:
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>>  - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../devicetree/bindings/usb/amlogic,dwc3.txt       | 53 ++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> index 6ffb09b..63dc60b 100644
>> --- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> @@ -128,3 +128,56 @@ Example device nodes:
>>  				snps,quirk-frame-length-adjustment;
>>  			};
>>  	};
>> +
>> +Amlogic Meson A1 DWC3 USB SoC Controller Glue
>> +
>> +The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
>> +host-only mode.
>> +
>> +Required properties:
>> +- compatible:	Should be "amlogic,meson-a1-usb-ctrl"
>> +- clocks:       The clocks needed by the usb controller
>> +- clock-names:  Should contain the name of the clocks: "usb_ctrl", "usb_bus",
>> +                "xtal_usb_phy", "xtal_usb_ctrl"
>> +- resets:	a handle for the shared "USB" reset line
>> +- reg:		The base address and length of the registers
>> +- phys: 	handle to used PHYs on the system
>> +	- a <0> phandle can be used if a PHY is not used
>> +- phy-names:	names of the used PHYs on the system :
>> +	- "usb2-phy0" for USB2 PHY if USBHOST port is used
>> +
>> +Required child nodes:
>> +
>> +A child node must exist to represent the core DWC3 IP block. The name of
>> +the node is not important. The content of the node is defined in dwc3.txt.
>> +
>> +PHY documentation is provided in the following places:
>> +- Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>> +
>> +Example device nodes:
>> +	usb: usb@ffe09000 {
>> +			status = "okay";
>> +			compatible = "amlogic,meson-a1-usb-ctrl";
>> +			reg = <0x0 0xffe09000 0x0 0xa0>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			clocks = <&clkc_periphs CLKID_USB_CTRL>,
>> +				 <&clkc_periphs CLKID_USB_BUS>,
>> +				 <&clkc_periphs CLKID_XTAL_USB_PHY>,
>> +				 <&clkc_periphs CLKID_XTAL_USB_CTRL>;
>> +			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
>> +			resets = <&reset RESET_USBCTRL>;
>> +			phys = <&usb2_phy0>;
>> +			phy-names = "usb2-phy0";
>> +
>> +			dwc3: usb@ff400000 {
>> +					compatible = "snps,dwc3";
>> +					reg = <0x0 0xff400000 0x0 0x100000>;
>> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>> +					dr_mode = "host";
>> +					snps,dis_u2_susphy_quirk;
>> +					snps,quirk-frame-length-adjustment = <0x20>;
>> +			};
>> +	};
>>
> 
> This seems very similar to the g12a bindings, seems you could update the yaml g12a bindings
> with specific clocks and required for amlogic,meson-a1-usb-ctrl.
> 
> Neil
> 
> .
> 

Hi Neil
Thanks for the comment.

1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
   A1 has one usb2-phy0 phy and only support host mode.
   
2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
   G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
   G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
   G12A glue driver has a hard coding support phys while A1 only supports host mode.
   	enum {
		USB2_HOST_PHY = 0,
		USB2_OTG_PHY,
		USB3_HOST_PHY,
		PHY_COUNT,
		};
   G12A glue driver only supports one clock while A1 needs four clocks.
   G12A and A1 phy drivers have different register configurations since hardware differences.
   
3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
   driver for A1 SoCs, so also dedicated dt-bindings.

