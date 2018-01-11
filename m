From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 17/44] dt-bindings: clock: Add bindings for DA8XX
 CFGCHIP gate clocks
Date: Thu, 11 Jan 2018 15:51:45 -0600
Message-ID: <fa5f1bff-42e7-0c1e-5f35-58493336ee74@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-18-git-send-email-david@lechnology.com>
 <20180111214516.quplp3kwwfrzocfp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180111214516.quplp3kwwfrzocfp@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/11/2018 03:45 PM, Rob Herring wrote:
> On Sun, Jan 07, 2018 at 08:17:16PM -0600, David Lechner wrote:
>> This adds a new binding for the gate clocks present in the CFGCHIP syscon
>> registers in TI DA8XX SoCs. There are actually other gate clocks in this
>> block that could be added in the future, but TBCLK is currently the only
>> one being used.
> 
> Like how many? 2 more?, then fine. 20 more, then perhaps cfgchip should
> be the clock provider.

Like, one more. Same goes for the mux clock. The USB PHY clocks are also
part of the CFGCHIP.

All of these clocks are randomly spread out, so I didn't really see a logical
way to make a single clock provider with #clock-cells = <1>.

> 
> In any case, I'd prefer to see all the cfgchip clocks documented in one
> doc.

I will do that.
