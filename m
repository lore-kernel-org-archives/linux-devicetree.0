Return-Path: <SRS0=IhJs=3I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F75C32771
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 02:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64104246A0
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 02:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgASCyV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jan 2020 21:54:21 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:18424 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbgASCyV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jan 2020 21:54:21 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sun, 19 Jan
 2020 10:54:47 +0800
Subject: Re: [PATCH v6 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Rob Herring <robh@kernel.org>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
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
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-3-git-send-email-hanjie.lin@amlogic.com>
 <20200117163219.GA25603@bogus>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <12c5287e-61af-0712-ae5b-019b8495055b@amlogic.com>
Date:   Sun, 19 Jan 2020 10:54:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200117163219.GA25603@bogus>
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



On 2020/1/18 0:32, Rob Herring wrote:
> On Fri, 17 Jan 2020 08:21:40 +0800, Hanjie Lin wrote:
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>>  - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> ---
>>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 38 ++++++++++++++++++++--
>>  1 file changed, 35 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml:  while parsing a block mapping
>   in "<unicode string>", line 107, column 7
> did not find expected key
>   in "<unicode string>", line 111, column 8
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dts] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1224563
> Please check and re-submit.
> 
> .
> 

Hi Rob,

Sorry, I missed a blank and didn't notice it.
I will fix it in next version, and also pay more attentions to these problems later.

Thanks,
Hanjie 
