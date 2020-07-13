Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79729C433E6
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 10:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FCE320773
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 10:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="nA4viPOJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgGMKSx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 06:18:53 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38103 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727035AbgGMKSp (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 06:18:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594635524; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HbTO1RWO0AYCBF7885LW5yU3nqXfLVBq9W9UdB+eByI=;
 b=nA4viPOJzHWCyPolFOoHgaSwWq+EXZmdgXheEaaXH7SGufr3yGNN/Jixe/zdqtSVcbSgmt1V
 9VUGZ5FEqlI2VJlX01c98mN/TioqY00fvjNiIFKbTKsscbCRu8mpklYGVPRE9su6vHZ2VzSN
 zROXBQfqiZY8mlKIfzpHl0f1X5w=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f0c3503c7a053446aa7478b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 10:18:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82D0AC433CA; Mon, 13 Jul 2020 10:18:42 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D426DC433C8;
        Mon, 13 Jul 2020 10:18:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 13 Jul 2020 15:48:41 +0530
From:   kalyan_t@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: enumerate second cursor pipe for
 external interface
In-Reply-To: <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
References: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
Message-ID: <c10c0f70988d42037ccaccc6b5474942@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-07-10 22:19, Rob Clark wrote:
> On Thu, Jun 25, 2020 at 5:46 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> Setup an RGB HW pipe as cursor which can be used on
>> secondary interface.
>> 
>> For SC7180 2 HW pipes are enumerated as cursors
>> 1 - primary interface
>> 2 - secondary interface
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 8f2357d..23061fd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -117,10 +117,10 @@
>>                 .reg_off = 0x2AC, .bit_off = 0},
>>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>>                 .reg_off = 0x2AC, .bit_off = 8},
>> -       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>> -               .reg_off = 0x2B4, .bit_off = 8},
>>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
>> -               .reg_off = 0x2BC, .bit_off = 8},
>> +               .reg_off = 0x2B4, .bit_off = 8},
>> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
>> +               .reg_off = 0x2C4, .bit_off = 8},
> 
> It looks like you shifted the register offset here from 0x2bc to
> 0x2c4, was that intentional?
> 
> BR,
> -R
Yes Rob, the offset was wrong which i corrected in this patch.
> 
>>         },
>>  };
>> 
>> @@ -272,10 +272,10 @@
>>                 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, 
>> DPU_CLK_CTRL_VIG0),
>>         SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>>                 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_DMA0),
>> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_DMA1),
>> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  
>> DMA_CURSOR_SDM845_MASK,
>> +               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_CURSOR0),
>>         SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  
>> DMA_CURSOR_SDM845_MASK,
>> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_CURSOR0),
>> +               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_CURSOR1),
>>  };
>> 
>>  /*************************************************************
>> --
>> 1.9.1
>> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
