Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A09C32771
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 02:43:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4652206E6
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 02:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgAGCnf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 21:43:35 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:44315 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGCnf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 21:43:35 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 7 Jan
 2020 10:43:58 +0800
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Rob Herring <robh@kernel.org>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
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
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
 <20200104003210.GA29074@bogus>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <11875bd0-0248-4c68-964a-004e1d15ab83@amlogic.com>
Date:   Tue, 7 Jan 2020 10:43:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200104003210.GA29074@bogus>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 2020/1/4 8:32, Rob Herring wrote:
> On Fri, Dec 27, 2019 at 02:36:42PM +0800, Hanjie Lin wrote:
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>>  - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 57 +++++++++++++++++++---
>>  1 file changed, 51 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> index 4efb77b..6103cc2 100644
>> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> @@ -9,6 +9,8 @@ title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
>>  
>>  maintainers:
>>    - Neil Armstrong <narmstrong@baylibre.com>
>> +  - Hanjie Lin <hanjie.lin@amlogic.com>
>> +  - Yue Wang <yue.wang@amlogic.com>
>>  
>>  description: |
>>    The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
>> @@ -22,10 +24,14 @@ description: |
>>    The DWC3 Glue controls the PHY routing and power, an interrupt line is
>>    connected to the Glue to serve as OTG ID change detection.
>>  
>> +  The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
>> +  host-only mode.
>> +
>>  properties:
>>    compatible:
>>      enum:
>>        - amlogic,meson-g12a-usb-ctrl
>> +      - amlogic,meson-a1-usb-ctrl
>>  
>>    ranges: true
>>  
>> @@ -37,6 +43,11 @@ properties:
>>  
>>    clocks:
>>      minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
>>  
>>    resets:
>>      minItems: 1
>> @@ -47,17 +58,22 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>>    phy-names:
>>      items:
>>        - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
>>        - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
>>        - const: usb3-phy0 # USB3 PHY if USB3_0 is used
>>  
>> -  phys:
>> -    minItems: 1
>> -    maxItems: 3
>> -
> 
> Why the unnecessary move?
> 

I saw most "phys" attributes are front of "phy-names" in dts, maybe looks pretty no other reasons.

>> -  dr_mode: true
>> +  dr_mode:
>> +    description: usb mode for G12A
>> +    enum:
>> +      - host
>> +      - peripheral
>> +      - otg
> 
> No, this is a common property that doesn't need to be redefined here. It 
> was correct as-is.
> 

Ok, I will modify it.

>>  
>>    power-domains:
>>      maxItems: 1
>> @@ -80,9 +96,9 @@ required:
>>    - resets
>>    - reg
>>    - interrupts
>> -  - phy-names
>>    - phys
>>    - dr_mode
>> +  - phy-names
> 
> Again, unnecessary change.
> 

Ok

>>  
>>  examples:
>>    - |
>> @@ -124,4 +140,33 @@ examples:
>>                snps,quirk-frame-length-adjustment;
>>            };
>>      };
>> +  - |
>> +    a1_usb: usb@ffe09000 {
> 
> You are only adding a compatible. No need for a whole new example.
> 

Ok, I will fix it.

Thanks, 

Hanjie

>> +          status = "okay";
>> +          compatible = "amlogic,meson-a1-usb-ctrl";
>> +          reg = <0 0xffe09000 0x0 0xa0>;
>> +          #address-cells = <1>;
>> +          #size-cells = <1>;
>> +          ranges;
>>  
>> +          clocks = <&clkc_periphs 36>,
>> +                   <&clkc_periphs 85>,
>> +                   <&clkc_periphs 2>,
>> +                   <&clkc_periphs 3>;
>> +          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy",
>> +                        "xtal_usb_ctrl";
>> +
>> +          resets = <&reset 36>;
>> +
>> +          phys = <&usb2_phy1>;
>> +          phy-names = "usb2-phy1";
>> +
>> +          a1_dwc3: usb@ff400000 {
>> +                  compatible = "snps,dwc3";
>> +                  reg = <0xff400000 0x100000>;
>> +                  interrupts = <0 90 4>;
>> +                  dr_mode = "host";
>> +                  snps,dis_u2_susphy_quirk;
>> +                  snps,quirk-frame-length-adjustment = <0x20>;
>> +          };
>> +    };
>> -- 
>> 2.7.4
>>
> 
> .
> 
