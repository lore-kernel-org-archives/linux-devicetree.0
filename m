From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RESEND, PATCH v13 09/12] soc: mediatek: cmdq: define the
 instruction struct
Date: Tue, 27 Aug 2019 12:04:03 +0200
Message-ID: <c33f6829-b1f4-376f-5e12-38c811c370dd@gmail.com>
References: <20190820084932.22282-1-bibby.hsieh@mediatek.com>
 <20190820084932.22282-10-bibby.hsieh@mediatek.com>
 <486deaa3-d139-d4af-e0cf-e324b3270f3b@gmail.com>
 <1566879121.29523.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566879121.29523.8.camel@mtksdaap41>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org



On 27/08/2019 06:12, Bibby Hsieh wrote:

>>>  
>>>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>>>  {
>>> -	u32 arg_b;
>>> +	struct cmdq_instruction *inst;
>>>  
>>>  	if (event >= CMDQ_MAX_EVENT)
>>>  		return -EINVAL;
>>>  
>>> -	/*
>>> -	 * WFE arg_b
>>> -	 * bit 0-11: wait value
>>> -	 * bit 15: 1 - wait, 0 - no wait
>>> -	 * bit 16-27: update value
>>> -	 * bit 31: 1 - update, 0 - no update
>>> -	 */
>>
>> I have no strong opinion of CMDQ_WFE_OPTION but if you want to introduce it,
>> then please copy the comment over to include/linux/mailbox/mtk-cmdq-mailbox.h
> 
> Ok. let's move the descriptions to header.
>>
>> Just one question, why did you call it _OPTION? It's not really expressive for me.
> 
> Actually, _OPTION is come from our hardware design name...
> 

Ok, then I'll stop bike-shedding. I leave it up to you to rename it or not.

Regards,
Matthias
