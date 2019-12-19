Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03C4C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7777A24650
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfLSIiC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:38:02 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:13260 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLSIiB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 03:38:01 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Dec
 2019 16:38:33 +0800
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
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
References: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
 <1576636944-196192-3-git-send-email-hanjie.lin@amlogic.com>
 <daa67976-e2ad-e114-b5fd-87eb5ae00eeb@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <c159449b-f266-2b90-fd1b-fc8988bef9e6@amlogic.com>
Date:   Thu, 19 Dec 2019 16:38:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <daa67976-e2ad-e114-b5fd-87eb5ae00eeb@baylibre.com>
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



On 2019/12/18 21:13, Neil Armstrong wrote:
> Hi,
> 
> On 18/12/2019 03:42, Hanjie Lin wrote:
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>>  - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 32 ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> index 4efb77b..9740027 100644
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
>> @@ -124,4 +130,30 @@ examples:
>>                snps,quirk-frame-length-adjustment;
>>            };
>>      };
>> +  - |
>> +    usb: usb@ffe09000 {
>> +          status = "okay";
>> +          compatible = "amlogic,meson-a1-usb-ctrl";
>> +          reg = <0x0 0xffe09000 0x0 0xa0>;
>> +          #address-cells = <2>;
>> +          #size-cells = <2>;
>> +          ranges;
>>  
>> +          clocks = <&clkc_periphs CLKID_USB_CTRL>,
>> +           <&clkc_periphs CLKID_USB_BUS>,
>> +           <&clkc_periphs CLKID_XTAL_USB_PHY>,
>> +           <&clkc_periphs CLKID_XTAL_USB_CTRL>;
>> +          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
>> +          resets = <&reset RESET_USBCTRL>;
>> +          phys = <&usb2_phy0>;
>> +          phy-names = "usb2-phy0";
>> +
>> +          dwc3: usb@ff400000 {
>> +                  compatible = "snps,dwc3";
>> +                  reg = <0x0 0xff400000 0x0 0x100000>;
>> +                  interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>> +                  dr_mode = "host";
>> +                  snps,dis_u2_susphy_quirk;
>> +                  snps,quirk-frame-length-adjustment = <0x20>;
>> +          };
>> +  };
>>
> 
> I doubt this passed the dt_binding_check !
> 
> 
> Please add the clock-names only for amlogic,meson-a1-usb-ctrl,
> set the phys maxItems to 1 for amlogic,meson-a1-usb-ctrl,
> and set dr_mode as host in the example or make it required only
> for amlogic,meson-g12a-usb-ctrl.
> 
> Neil
> 
> .
> 

Hi Neil,

It does report errors by dt_binding_check, I will check the list again.

Thanks

Hanjie.lin

