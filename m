Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B1CC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 01:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D07B821556
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 01:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgAMBX2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jan 2020 20:23:28 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:45425 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgAMBX2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jan 2020 20:23:28 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 13 Jan
 2020 09:23:53 +0800
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <52566105-cbee-01d6-9110-f9954eabe22f@amlogic.com>
Date:   Mon, 13 Jan 2020 09:23:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com>
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



On 2020/1/12 4:50, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> @@ -37,6 +43,11 @@ properties:
>>
>>    clocks:
>>      minItems: 1
>> +    maxItems: 4
> the driver parses one clock for G12A/G12B/SM1 and three clocks for A1
> if there is a fourth clock: do we need to manage it in the driver?
> (note: dt-bindings always represent the hardware, so if there's a
> fourth clock which the driver doesn't need then it's perfectly valid
> to describe it here. a comment which clock this is helps in the
> code-review process)
> 

Hi Martin,

Sorry for this confusing, I moved xtal_usb_phy clock from glue driver to phy,
but I missed this binding modification. 
So actually A1 do only need these three clocks and no fourth clock exist, clock
and clock-names maxItems should be three here for A1.

>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> I let Rob comment on this, personally I prefer naming the clocks explicitly
> also I think clock-names has to be a mandatory property for A1 (see
> Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> for an example which makes properties mandatory depending on the
> compatible string)
> 
> 
> Martin
> 
> .
> 

Thanks for your patient and detailed advice.

Do you mean something like this:

+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-g12a-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+         minItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-a1-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+          items:
+            minItems: 3
+       clock-names:
+          items:
+            - const: usb_ctrl
+            - const: usb_bus
+            - const: xtal_usb_ctrl
+      required:
+        - clock-names


Hanjie
