From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: clock: mediatek: add missing
 required #reset-cells
Date: Sun, 18 Mar 2018 21:34:49 +0100
Message-ID: <836d5d6e-eafa-52b8-39dc-6422ebe32d82@gmail.com>
References: <cover.1518895232.git.sean.wang@mediatek.com>
 <7365f2286ff2cebcfb590715cb4a15dedd089046.1518895232.git.sean.wang@mediatek.com>
 <152123261872.225550.10226809804986023416@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152123261872.225550.10226809804986023416@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, sean.wang@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 03/16/2018 09:36 PM, Stephen Boyd wrote:
> Quoting sean.wang@mediatek.com (2018-02-17 11:54:36)
>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> All ethsys, pciesys and ssusbsys internally include reset controller, so
>> explicitly add back these missing cell definitions to related bindings
>> and examples.
>>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: linux-clk@vger.kernel.org
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 

added to v4.16-next/dts64
Thanks!
