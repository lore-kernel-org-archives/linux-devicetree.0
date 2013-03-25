From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v9 4/4] ARM: dts: Add FIMD DT binding Documentation
Date: Mon, 25 Mar 2013 12:56:32 +0100
Message-ID: <51503B70.8040506@samsung.com>
References: <1363960608-23825-1-git-send-email-vikas.sajjan@linaro.org>
 <1363960608-23825-5-git-send-email-vikas.sajjan@linaro.org>
 <CAJuYYwQZKXXVNNbDS20d8i6mybzyRc_Y8BQs73NSw6mUVwsGwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <CAJuYYwQZKXXVNNbDS20d8i6mybzyRc_Y8BQs73NSw6mUVwsGwQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

On 03/25/2013 12:10 PM, Thomas Abraham wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> @@ -0,0 +1,68 @@
>> +Device-Tree bindings for Samsung SoC display controller (FIMD)
[...]
>> +- interrupts : should contain a list of all FIMD IP block interrupts:
>> +  FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier format depends
>> +    on the interrupt controller used.

Since the interrupt order is supposed to be defined by the binding, perhaps
it could be rephrased to something like:

- interrupts : should contain a list of all FIMD IP block interrupts in
  order: FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier format
  depends on the interrupt controller used.

>> +- interrupt-names : should contain the interrupt names: "fifo", "vsync",
>> +       "lcd_sys", in the same order as they were listed in the interrupts
>> +        property.
>> +
>> +- pinctrl : property defining the pinctrl configurations with a phandle
>> +
>> +- pinctrl-names : "default" state needs to be specified in the fimd node
>> +               The pinctrl bindings defined in
>> +               ../../../pinctrl/pinctrl-bindings.txt must be used to define a
>> +               pinctrl state named "default".

The path should be ../pinctrl/pinctrl-bindings.txt. It probably makes to sense
to either have this one sentence or pinctrl/pinctrl-names properties listed
with their description. So for example

- pinctrl : pin control group to be used for this controller;
- pinctrl-names : should contain "default" entry;

or

The pinctrl bindings defined in ../pinctrl/pinctrl-bindings.txt must be used
to define a pinctrl state named "default".
