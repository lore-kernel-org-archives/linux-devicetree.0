From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 43/44] ARM: da8xx-dt: switch to device tree clocks
Date: Fri, 19 Jan 2018 11:44:03 +0530
Message-ID: <1f0e81de-21c2-8f17-c85d-9e04648939cd@ti.com>
References: <1515378307-23718-1-git-send-email-david@lechnology.com>
 <1515378307-23718-4-git-send-email-david@lechnology.com>
 <8b30f1e6-74dc-3fd6-71a6-c9ceaf77a9d1@ti.com>
 <b9443e4c-b8c6-5388-955e-696d0f7b3151@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b9443e4c-b8c6-5388-955e-696d0f7b3151@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 19 January 2018 12:10 AM, David Lechner wrote:
> On 01/18/2018 09:27 AM, Sekhar Nori wrote:
>> On Monday 08 January 2018 07:55 AM, David Lechner wrote:
>>> This removes all of the clock init code from da8xx-dt.c. This includes
>>> all of the OF_DEV_AUXDATA that was just used for looking up clocks.
>>>
>>> Note: You need to have clocks defined in your device tree or your system
>>> won't boot after this patch.
>>
>> I am not sure we can do this then, as we cannot break DT compatibility.
>>
> 
> In the past, you have told me that you don't want the .dts changes and code
> changes in the same patch. In this case, if you apply either one

Thats still true.

> separately,
> it will break clocks. It does not matter which one is first.
> 
> So either we have to squash [PATCH v5 44/44] ARM: dts: da850: Add clocks
> into this patch or deal with the breakage.

I am not so much concerned about temporary breakage in the middle of the
series, but more about DT compatibility after the entire series is applied.

Thanks,
Sekhar
