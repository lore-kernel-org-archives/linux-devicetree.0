Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727FBC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 01:13:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45C2721744
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 01:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbgAMBN1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jan 2020 20:13:27 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:35320 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbgAMBN1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jan 2020 20:13:27 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 13 Jan
 2020 09:13:52 +0800
Subject: Re: [PATCH v5 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
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
 <1578634957-54826-2-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCA-w6GnPzFCbmUFNrOY3PeW3=74+ToC9CvXoSAWoe+VLw@mail.gmail.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <da8f7d0b-7bf8-5a7a-53a6-be2bdc1ca4c4@amlogic.com>
Date:   Mon, 13 Jan 2020 09:13:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCA-w6GnPzFCbmUFNrOY3PeW3=74+ToC9CvXoSAWoe+VLw@mail.gmail.com>
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



On 2020/1/12 4:54, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>
>> Add the Amlogic A1 Family USB2 PHY Bindings
>>
>> It supports Host mode only.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 62 ++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> there are only two differences to the existing
> amlogic,meson-g12a-usb2-phy.yaml binding:
> - different compatible string (the existing binding already has an
> enum, so that would be easy to extend)
> - new, mandatory power-domains property
> (Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> has examples how to make properties mandatory based on the compatible
> string)
> 
> have you considered merging this with the existing
> amlogic,meson-g12a-usb2-phy.yaml binding?
> this is not a "must have" in my opinion, I still want to hear your
> opinion on this topic!
> 
> 
> Martin
> 
> .
> 


Hi Martin,

Thanks for your advice.

Of course, it should looks much better to have merging this into the existing
amlogic,meson-g12a-usb2-phy.yaml.
I will try to do it by following the examples.

thanks,
Hanjie
