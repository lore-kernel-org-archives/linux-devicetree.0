From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [RESEND PATCH v2 02/13] drivers: clk: st: Simplify clock binding
 of STiH4xx platforms
Date: Fri, 8 Jul 2016 11:12:35 +0200
Message-ID: <577F6E83.3080006@st.com>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
 <1466068833-5055-3-git-send-email-gabriel.fernandez@linaro.org>
 <20160619150458.GA26824@rob-hp-laptop>
 <146794221378.73491.2803164814485320331@resonance>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <146794221378.73491.2803164814485320331@resonance>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linar>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On 07/08/2016 03:43 AM, Michael Turquette wrote:
> Quoting Rob Herring (2016-06-19 08:04:58)
>> On Thu, Jun 16, 2016 at 11:20:22AM +0200, Gabriel Fernandez wrote:
>>> This patch reworks the clock binding to avoid too much detail in DT.
>>> Now we have only compatible string per type of clock
>>> (remark from Rob https://lkml.org/lkml/2016/5/25/492)
>>>
>> I have no idea what the clock trees and clock controller in these chips
>> look like, so it's hard to say if the changes here are good. It still
>> looks like things are somewhat fine grained clocks in DT. I'll leave
>> it up to the platform maintainers to decide...
> Is this series breaking ABI? If yes, why not do what Maxime did for the
> Allwinner/sunxi clocks and just fully convert over to a
> one-node-per-clock-controller binding? This one-node-per-clock stuff is
> pretty unfortunate, and if we're deprecating platforms (patch #1) then
> now might be a good time to re-evaluate the whole thing.

The goal of my patchset was to be aligned with DRM / KMS development and 
to offer
the possibility to make a correct video playback on STiH407/STiH410 
platform.
Our milestone is the 4.8 for that.

Currently people need these patches to work.
I'm not sure it's a good time to re-evaluate the whole thing.

Is it possible to re-evaluate later ?

Best regards,
Gabriel

> Regards,
> Mike
>
>>   
>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>>> ---
>>>   .../devicetree/bindings/clock/st/st,clkgen-mux.txt |  2 +-
>>>   .../devicetree/bindings/clock/st/st,clkgen-pll.txt | 11 ++--
>>>   .../devicetree/bindings/clock/st/st,clkgen.txt     |  2 +-
>>>   .../devicetree/bindings/clock/st/st,quadfs.txt     |  6 +--
>>>   drivers/clk/st/clkgen-fsyn.c                       | 41 ++++++--------
>>>   drivers/clk/st/clkgen-mux.c                        | 28 ++++------
>>>   drivers/clk/st/clkgen-pll.c                        | 62 ++++++++++------------
>>>   7 files changed, 65 insertions(+), 87 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>>> index 4d277d6..9a46cb1d7 100644
>>> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>>> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>>> @@ -10,7 +10,7 @@ This binding uses the common clock binding[1].
>>>   Required properties:
>>>   
>>>   - compatible : shall be:
>>> -     "st,stih407-clkgen-a9-mux",     "st,clkgen-mux"
>>> +     "st,stih407-clkgen-a9-mux"
>>>   
>>>   - #clock-cells : from common clock binding; shall be set to 0.
>>>   
>>> diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>>> index c9fd674..be0b043 100644
>>> --- a/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>>> +++ b/Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>>> @@ -9,11 +9,10 @@ Base address is located to the parent node. See clock binding[2]
>>>   Required properties:
>>>   
>>>   - compatible : shall be:
>>> -     "st,stih407-plls-c32-a0",       "st,clkgen-plls-c32"
>>> -     "st,stih407-plls-c32-a9",       "st,clkgen-plls-c32"
>>> -     "sst,plls-c32-cx_0",            "st,clkgen-plls-c32"
>>> -     "sst,plls-c32-cx_1",            "st,clkgen-plls-c32"
>>> -     "st,stih418-plls-c28-a9",       "st,clkgen-plls-c32"
>>> +     "st,clkgen-pll0"
>>> +     "st,clkgen-pll0"
>> Repeated. Supposed to be 0 and 1? This seems a bit generic, too.
>>
>>> +     "st,stih407-clkgen-plla9"
>>> +     "st,stih418-clkgen-plla9"

