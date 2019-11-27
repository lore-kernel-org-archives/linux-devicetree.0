Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC9AC432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 07:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC9C320656
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 07:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfK0HLJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 02:11:09 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:50345 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfK0HLJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 02:11:09 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 27 Nov
 2019 15:11:35 +0800
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
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
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
 <5c0029ec-7377-4c1a-0062-3b59a87f8dea@amlogic.com>
 <CAFBinCBypbB4W42GOAc8ejAYHVQLTDRdat_z_L92TZvC2p+5rQ@mail.gmail.com>
 <272a7442-38b3-346c-4749-2b163464bd01@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <5d364ce2-8851-0741-759a-baaac0a0fe14@amlogic.com>
Date:   Wed, 27 Nov 2019 15:11:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <272a7442-38b3-346c-4749-2b163464bd01@baylibre.com>
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



On 2019/11/26 21:11, Neil Armstrong wrote:
> On 25/11/2019 23:02, Martin Blumenstingl wrote:
>> Hi Hanjie,
>>
>> On Mon, Nov 25, 2019 at 8:53 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>>
>>>
>>>
>>> On 2019/11/22 15:52, Martin Blumenstingl wrote:
>>>> Hello Hanjie,
>>>>
>>>> On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>>> [...]
>>>>>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>>>>>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>>>>>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
>>>> drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
>>>> USB2 PHY you are introducing here.
>>>>
>>>>>   usb: dwc3: Add Amlogic A1 DWC3 glue
>>>> drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.
>>>>
>>>> I have two questions:
>>>> - how is the PHY and the dwc3 glue different from G12A (or SM1)?
>>>> - why do we need a separate set of new drivers (instead of updating
>>>> the existing drivers)?
>>>>
>>>> We try to use one driver for the same IP block, even if there are
>>>> several revisions with small differences (for example the SAR ADC
>>>> driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
>>>> because 80-90% of the code is shared across all revisions).
>>>>
>>>>
>>>> Martin
>>>>
>>>> .
>>>>
>>>
>>> Hi Martin,
>>>
>>> thanks for the comment.
>>>
>>> 1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
>>>    A1 has one usb2-phy0 phy and only support host mode.
>> dwc3-meson-g12a treats PHYs as optional
>> so if you only pass "usb2-phy0" and skip usb2-phy1/usb3-phy0 then it
>> will still work fine
>> (I didn't check whether the binding also reflects this)
> 
> Exact, a simple match data could make max-phys to 1 for A1.
> 
>>
>>> 2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
>>>    G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
>> dwc3-meson-g12a ignores the interrupt for HOST-only mode
>> (I didn't check whether the IRQ is optional in the dt-binding)
> 
> Interrupt support and OTG manual switch is optional and can be easily bypassed.
> 
>>
>>>    G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
>> my understanding is that whether a board has a VBUS regulator depends
>> on the board design. it has nothing to do with the SoC itself
>>
>>>    G12A glue driver has a hard coding support phys while A1 only supports host mode.
>>>         enum {
>>>                 USB2_HOST_PHY = 0,
>>>                 USB2_OTG_PHY,
>>>                 USB3_HOST_PHY,
>>>                 PHY_COUNT,
>>>                 };
>> this goes together with comment #1 - you can skip USB2_OTG_PHY and
>> USB3_HOST_PHY and the driver should still work fine
> 
> Exact
> 
>>
>>>    G12A glue driver only supports one clock while A1 needs four clocks.
>> indeed, the dwc3-meson-g12a needs to be updated to support this
>> I don't think that I have used it myself yet but there's the
>> clk_bulk_data framework
>> it seems to fit this use-case pretty well: define an arbitrary number
>> of clocks for G12A/B an another set of clocks for A1 - then use the
>> clk_bulk_data framework to enable/disable them all at once
> 
> Exact, a simple conversion to clk_bulk_* would be enough
> 
>>
>>>    G12A and A1 phy drivers have different register configurations since hardware differences.
>> other drivers have similar requirements: (mostly) identical register
>> layout but different values per SoC
>> here are two examples (I'm not sure if they are good examples though):
>> Lantiq/Intel SoC [0] and Allwinner SoCs [1]
>>
>> I compared your driver with phy-meson-g12a-usb2 and only found four differences:
>> 1) PHY_CTRL_R18_MPLL_DCO_CLK_SEL is set for A1
>> 2) PHY_CTRL_R13_UPDATE_PMA_SIGNALS is not set for A1
>> 3) PHY_CTRL_R21 is updated twice for A1 (once for earlier gen SoCs)
>> 4) A1 doesn't reference the "xtal" clock
>>
>> Difference 4) seems to be a general problem because there seems to be
>> a PLL inside the PHY registers and that PLL must be fed by some input
>> clock
>> So I believe that there is some clock input (which is currently
>> missing from your A1 USB2 PHY driver)
> 
> These differences are trivial to add with a match data structure.
> 
>>
>>> 3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
>>>    driver for A1 SoCs, so also dedicated dt-bindings.
>> I think we should separate the driver and dt-bindings
>>
>> Based on what I have seen so far my preference for the PHY is:
>> - use the existing dt-binding, because it seems to be the same IP
>> block with different register configuration
>> - use the existing driver because there are only three different
>> register values (to me it feels like a dedicated driver for these
>> means more overhead for little benefit)
>>
>> for the glue I think:
>> - extend the existing dt-bindings and make some of the PHYs and the
>> interrupt line optional. making the PHYs optional will be needed when
>> adding GXL/GXM/AXG support anyways
>> - use the existing driver and make the clock inputs depend on the SoC
>> - everything else should already work as is
>>
>> please let me know if I missed something:
>> comparing/reviewing the new and existing drivers is harder than just
>> copying the existing one and modifying that copy
>> (this is one of the reasons why I think that duplicating code makes
>> the drivers harder to maintain)
>>
>> I also thought about the negative consequences of extending the
>> existing driver(s).
>> modifying the existing code could break the driver for existing boards.
>> however, I think that is not a problem because BayLibre's Kernel CI
>> labs have good coverage for G12A, G12B and SM1.
>> so if you add some A1 boards there (or host your own lab with A1
>> boards) any breakage will be found early (the Kernel CI bot even does
>> git bisect and sends emails)
> The overall architecture is the same since the GXL SoCs, we also plan to
> move the GXL/GXM USB complex into the G12A usb-ctrl driver because the architecture
> is very similar.
> 
> For A1, the changes will be quite minimal, please try and post a RFC version so we
> can evaluate.
> 
> Thanks,
> 
> Neil
> 
>>
>>
>> Martin
>>
>>
>> [0] https://github.com/torvalds/linux/blob/d2912cb15bdda8ba4a5dd73396ad62641af2f520/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c#L47
>> [1] https://github.com/torvalds/linux/blob/c942fddf8793b2013be8c901b47d0a8dc02bf99f/drivers/phy/allwinner/phy-sun4i-usb.c#L862
>>
> 
> .
> 


Hi Neil:

Okay.
We will try to move A1 usb phy/ctrl driver into G12A driver and send a V2 patch later.

Thanks.
