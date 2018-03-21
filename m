From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 0/5] update Mediatek MT2712 clock and scpsys support
Date: Wed, 21 Mar 2018 10:11:09 +0100
Message-ID: <6c29df1f-f619-5e11-4160-b58e154f6592@gmail.com>
References: <20180312070342.4335-1-weiyi.lu@mediatek.com>
 <1521526068.13313.8.camel@mtksdaap41>
 <152153061465.254778.3061562183948751301@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152153061465.254778.3061562183948751301@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 03/20/2018 08:23 AM, Stephen Boyd wrote:
> Quoting Weiyi Lu (2018-03-19 23:07:48)
>> On Mon, 2018-03-12 at 15:03 +0800, Weiyi Lu wrote:
>>> This series is based on v4.16-rc1 and composed of scpsys control (PATCH 1-2) and clock control (PATCH 3-5).
>>> Basically, all changes are for the ECO design change of MT2712.
>>>
>>> changes since v1:
>>> - Avoid renumbering clocks. Append new clocks at the bottom of each own subsystem.
>>>
>> Hi Matthias & Stephen,
>>
>> Sorry to bother. Just saw patch 1/2 are already pushed to v4.16-next-soc
>> and patch 3/5 are applied onto clk-next. What about the patch 4(arm64:
>> dts: add clock device nodes of MT2712). Does there any problem remain or
>> it cause some problems? Many thanks.
> 
> Patch 4 can go via arm-soc? I'm not planning to apply that patch.
> 

I can take it through my branch, no problem. But I think it is too late for this
cycle. CCing Arnd to confirm.

Regards,
Matthias
