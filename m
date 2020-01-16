Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18519C32771
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 02:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC4AE2081E
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 02:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbgAPCLi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 21:11:38 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:14782 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730397AbgAPCLi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 21:11:38 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 16 Jan
 2020 10:12:04 +0800
Subject: Re: [PATCH v5 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        <linux-usb@vger.kernel.org>, Yue Wang <yue.wang@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlo Caione <carlo@caione.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-5-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCCFUDst_-QtSuNioAa3ckt5GzTFDAhZWh3zu42VRByPpw@mail.gmail.com>
 <40e5b638-0606-70e2-3bdf-cc4619726196@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <26139b4b-3ff7-ca43-4b27-f99946d4c23e@amlogic.com>
Date:   Thu, 16 Jan 2020 10:12:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <40e5b638-0606-70e2-3bdf-cc4619726196@baylibre.com>
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



On 2020/1/15 16:01, Neil Armstrong wrote:
> On 11/01/2020 21:45, Martin Blumenstingl wrote:
>> Hi Hanjie,
>>
>> On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>> [...]
>>> -       devm_add_action_or_reset(dev,
>>> -                                (void(*)(void *))clk_disable_unprepare,
>>> -                                priv->clk);
>>> +       ret = clk_bulk_prepare_enable(priv->drvdata->num_clks,
>>> +                                     priv->drvdata->clks);
>> I don't see clk_bulk_disable_unprepare in dwc3_meson_g12a_remove()
>> please test that the clocks are all disabled (see
>> /sys/kernel/debug/clk/clk_summary for example) when unloading all USB
>> related kernel modules
>>
>>> +
>>> +       if (!priv->drvdata->otg_switch_supported)
>>> +               goto setup_pm_runtime;
>> my brain doesn't like the goto in this place because this is not an
>> error condition. I was about to write that
>> usb_role_switch_unregister() is now skipped even though we're calling
>> usb_role_switch_register().
>>
>> I want to hear Neil's opinion on this because I got confused while
>> reading the code again.
>> my proposal is to move all of this OTG related code from
>> dwc3_meson_g12a_probe() into a new function, for example called
>> dwc3_meson_g12a_otg_init()
>> then only call that function when OTG switching is supported
> 
> Indeed it's not cleanest way to do that, if you respin a v6, put all the OTG
> setup and role switch register in a separate function.
> 
> with that and :clk_bulk_disable_unprepare() in remove:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil
> 

Ok, 

I will do it in v6 patch.

Thanks,
Hanjie

>>
>>
>> Martin
>>
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 
