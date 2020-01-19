Return-Path: <SRS0=IhJs=3I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D4EC32771
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 03:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA374246A9
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 03:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgASDB1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jan 2020 22:01:27 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:26986 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbgASDB1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jan 2020 22:01:27 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sun, 19 Jan
 2020 11:01:54 +0800
Subject: Re: [PATCH v6 5/6] arm64: dts: meson: a1: Enable USB2 PHY
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
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
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com>
 <1579220504-110067-6-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCD9iwBHYArqU55kg_uG3xc=JnL=F1P0KW1+6BP2xHoN0g@mail.gmail.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <fef30562-2353-642c-7b9a-20ae81b5bf90@amlogic.com>
Date:   Sun, 19 Jan 2020 11:01:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCD9iwBHYArqU55kg_uG3xc=JnL=F1P0KW1+6BP2xHoN0g@mail.gmail.com>
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



On 2020/1/19 6:05, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> On Fri, Jan 17, 2020 at 1:22 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>
>> Enable USB2 PHY for Meson A1 SoC.
>>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
> personally I would squash this with patch 6/6 because it's only useful
> together with patch 6/6
> on the other hand: it's not worth sending a v7 just for this
> 
>> @@ -100,6 +101,18 @@
>>                                 #power-domain-cells = <1>;
>>                                 status = "okay";
>>                         };
>> +
>> +                       usb2_phy1: phy@40000 {
>> +                               status = "okay";
> we typically use one of the following patterns:
> - status = "disabled" in SoC.dts
> - status = "okay" in board.dts whenever the peripheral should be used
> (example: I2C, USB, ...)
> OR
> - no status property if the peripheral is mandatory on all boards (for
> example: clock controller, ...)
> 
> so for consistency with other Amlogic .dts I would either drop the
> status property or set it to disabled (and enable it in
> meson-a1-ad401.dts)
> same applies to patch 6/6
> 
> 
> Martin
> 
> .
> 

Hi Martin,

Of course, it will be more reasonable.

I have a bindings issue need to fix too, so I will do these together in v7.

Thanks,
Hanjie
