Return-Path: <SRS0=Jntx=27=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7093DC32771
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 01:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E50D206ED
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 01:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730570AbgAJB1Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 20:27:24 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:35351 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730557AbgAJB1Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 20:27:24 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 10 Jan
 2020 09:27:47 +0800
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
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
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-2-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCDt97E4236obhm0GV58MtoC2qYAZbqPoJd8tyROGW4cvw@mail.gmail.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <9fc103f4-a388-a65e-f621-846f03f77b3a@amlogic.com>
Date:   Fri, 10 Jan 2020 09:27:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDt97E4236obhm0GV58MtoC2qYAZbqPoJd8tyROGW4cvw@mail.gmail.com>
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



On 2020/1/10 1:12, Martin Blumenstingl wrote:
> On Thu, Jan 9, 2020 at 3:30 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xtal_usb_phy
> the "usb_phy" part of "xtal_usb_phy" seems redundant to me:
> it's the XTAL clock input (this is what I'd expect as clock-name) of
> the USB PHY (this is already part of the node name).
> in addition to keeping the reset-names consistent (as Neil suggested)
> please also use the same clock-names as G12
> 

Of course.

I will use "xtal" name in next version.

Thanks,
Hanjie

> 
> Thank you!
> Martin
> 
> .
> 
