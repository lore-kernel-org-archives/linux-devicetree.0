From: Jongsung Kim <neidhard.kim@lge.com>
Subject: Re: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
Date: Mon, 4 Jul 2016 10:48:06 +0900
Message-ID: <5779C056.3020209@lge.com>
References: <20160621005910.GN1521@codeaurora.org>
 <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
 <20160628205518.GF3737@rob-hp-laptop>
 <146714872010.89261.1969853552594659808@resonance> <5773736D.3060405@lge.com>
 <20160702002030.GF27880@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160702002030.GF27880@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chanho Min <chanho.min@lge.com>
List-Id: devicetree@vger.kernel.org

On 2016=EB=85=84 07=EC=9B=94 02=EC=9D=BC 09:20, Stephen Boyd wrote:
> On 06/29, Jongsung Kim wrote:
>> On 2016=EB=85=84 06=EC=9B=94 29=EC=9D=BC 06:18, Michael Turquette wr=
ote:
>>> Quoting Rob Herring (2016-06-28 13:55:18)
>>>> On Fri, Jun 24, 2016 at 01:12:52PM +0900, Jongsung Kim wrote:
>>>>> There is no way to set additional flags for a DT-initialized fixe=
d-
>>>>> factor-clock, and it can be problematic i.e., when the clock rate
>>>>> needs to be changed. [1][2]
>>>>>
>>>>> This patch introduces an optional dt-binding named "clock-flags" =
to
>>>>> be used for passing any needed flags from dts.
>>>> I don't think we want this in DT. If we did, the flags would need =
some=20
>>>> documentation about what the flags mean.
>>> Flags are specific to Linux implementation, so I agree with Rob. Be=
tter
>>> to create a compatible string for your hardware that bakes in the f=
lags.
>> Thank you for your comment, Mike. This conversation starts from lack=
ing method to set CLK_SET_RATE_PARENT from DT. I understand compatible =
string can be a solution. But.. if someone starts talking about lacking=
 method to set another flag, i.e., CLK_SET_PARENT_GATE, then we'll need=
 another compatible string list.
>> How do you think about defining possible required subset of the flag=
s and using some more neutral flag-names acceptable in DT?
> Do you actually have an IC on the board that is doing some fixed
> factor calculation? Or is this a clk driver design where we are
> listing out each piece of an SoC's clk controller in DT?
>
The SoC has several PLLs of identical design, and one of them is divide=
d
to half and used for CPUs. The fixed-factor-clock represents the divide=
r.

