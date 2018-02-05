From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 17/41] dt-bindings: clock: Add bindings for DA8XX
 CFGCHIP clocks
Date: Mon, 5 Feb 2018 15:12:35 +0530
Message-ID: <f57cae4e-560a-0ea4-16dd-bdf8696d4f7b@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-18-git-send-email-david@lechnology.com>
 <572e31a2-ac18-512b-03bb-82fffcf4d228@ti.com>
 <26fd0f01-ed14-6544-7443-e88c69ca9acb@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26fd0f01-ed14-6544-7443-e88c69ca9acb@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 02 February 2018 11:20 PM, David Lechner wrote:
> On 02/02/2018 12:20 AM, Sekhar Nori wrote:
>> On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
>>> +EMIFA clock source (ASYNC1)
>>> +---------------------------
>>> +Required properties:
>>> +- compatible: shall be "ti,da850-async1-clksrc".
>>> +- #clock-cells: from common clock binding; shall be set to 0.
>>> +- clocks: phandles to the parent clocks corresponding to clock-names
>>> +- clock-names: shall be "pll0_sysclk3", "div4.5"
>>
>> Is this clock really referred to as aysnc1 in documentation? I don't get
>> hits for async1 in OMAP-L138 TRM.
>>
> 
> It looks like it is only called ASYNC1 in the datasheet, not the TRM.
> 
> Table 6-5. Maximum Internal Clock Frequencies at Each Voltage Operating
> Point

I see it now. Its fine to use async1 then.

Thanks,
Sekhar
