From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH v2 07/15] ndings: clock: milbeaut: add Milbeaut clock
 description
Date: Thu, 14 Feb 2019 09:43:03 +0900
Message-ID: <38afb1e0-2af9-0eb1-9d1b-4ff7273e25ab@socionext.com>
References: <1549628823-31388-1-git-send-email-sugaya.taichi@socionext.com>
 <155008053444.115909.15767350529461671558@swboyd.mtv.corp.google.com>
 <155008127539.115909.8938099989804942@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155008127539.115909.8938099989804942@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/02/14 3:07, Stephen Boyd wrote:
> Quoting Stephen Boyd (2019-02-13 09:55:34)
>> The subject seems to have been cut off? "ndings"?
>>
>> Quoting Sugaya Taichi (2019-02-08 04:27:03)
>>> diff --git a/Documentation/devicetree/bindings/clock/milbeaut-clock.txt b/Documentation/devicetree/bindings/clock/milbeaut-clock.txt
>>> new file mode 100644
>>> index 0000000..bcfc5df
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/milbeaut-clock.txt
>>> @@ -0,0 +1,49 @@
>>> +Milbeaut SoCs Clock Controller Binding
>>> +----------------------------------------
>>> +Milbeaut SoCs Clock controller is an integrated clock controller, which
>>> +generates and supplies to all modules.
>>> +
>>> +This binding uses common clock bindings
>>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>>> +
>>> +Required properties:
>>> +- compatible: should be one of the following:
>>> +    "socionext,milbeaut-m10v-ccu" - for M10V SoC
>>> +- reg: shall contain base address and length of clock registers
>>> +- #clock-cells: shall be 1
>>> +- clocks: shall be an external clock
>>> +
>>> +Example: Clock controller node:
>>> +
>>> +       clk: m10v-clk-ctrl@1d021000 {
>>> +               compatible = "socionext,milbeaut-m10v-clk-ccu";
>>
>> I thought there was some length limit on compatible string names. 32
>> bytes? Just barely under!
>>
> 
> Ah I'm wrong. Compatible is 128. Good.
> 
> Seems I was thinking of DT property names.
> 

Sorry confusing you.
I accidently deleted "dt-bi" from subject when committing.
I repair the string in the next version.

Thanks,
Sugaya Taichi
