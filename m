From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 0/5] Add clk and scpsys support for MT6755
Date: Thu, 17 Aug 2017 12:19:51 +0200
Message-ID: <341316e9-d7ce-85f1-4e54-f872771f530f@gmail.com>
References: <1502180014-7995-1-git-send-email-mars.cheng@mediatek.com>
 <1502855993.4599.1.camel@mtkswgap22> <1502938079.4027.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502938079.4027.3.camel@mtksdaap41>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, cc.hwang@mediatek.com, wsd_upstream@mediatek.com, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, wendell.lin@mediatek.com
List-Id: devicetree@vger.kernel.org



On 08/17/2017 04:47 AM, Yingjoe Chen wrote:
> 
> 
> On Wed, 2017-08-16 at 11:59 +0800, Mars Cheng wrote:
>> Hi Rob, Stephen, Matthias
>>
>> gentle ping.
>>
>> Thanks.
>>
>> On Tue, 2017-08-08 at 16:13 +0800, Mars Cheng wrote:
>>> Mars Cheng (3):
>>>    clk: mediatek: add mt6755 clock ID
>>>    clk: mediatek: add clk support for MT6755
>>>    soc: mediatek: add MT6755 scpsys support
> 
> Hi Mars,
> 
> Sean reworked the scpsys driver to remove code duplication, see:
> http://lists.infradead.org/pipermail/linux-mediatek/2017-August/009687.html
> http://lists.infradead.org/pipermail/linux-mediatek/2017-August/009820.html
> 
> I think current driver will have conflict and can't merge as-is, you'll
> need to rebase to Matthias' for-next branch.
> 

Yes, please rebase, which should be trivial. Other then that the scpsys driver 
looks good.

Regards,
Matthias
