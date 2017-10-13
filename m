From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 0/9] Mediatek MT2712 clock and scpsys support
Date: Fri, 13 Oct 2017 16:50:43 +0200
Message-ID: <ac7940d1-e23d-add2-b4b6-bd7cf66fea34@gmail.com>
References: <1505793630-12590-1-git-send-email-weiyi.lu@mediatek.com>
 <20171012224540.GE18706@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012224540.GE18706@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 10/13/2017 12:45 AM, Stephen Boyd wrote:
> On 09/19, Weiyi Lu wrote:
>> This series is based on v4.14-rc1 and composed of
>> clock control (PATCH 1-4) and scpsys control (PATCH 5-9)
> 
> What's the merge plan? Can I apply the clk ones to clk tree and
> ignore the rest?
> 

Yes, please do so. I'll take scpsys, which depends on the clock patches.

Regards,
Matthias
