From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add sdm660 pinctrl driver
Date: Sun, 12 Aug 2018 14:42:27 +0200
Message-ID: <2710770.4cMFGZ35A3@debian64>
References: <20180811162520.11641-1-ctatlor97@gmail.com> <2202961.SmUWKIdeCe@debian64> <4A3869BF-2069-409A-B291-427971AF89FA@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4A3869BF-2069-409A-B291-427971AF89FA@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday, August 12, 2018 9:18:19 AM CEST you wrote:
> On 11 August 2018 18:27:43 BST, Christian Lamparter <chunkeey@gmail.com> wrote:
> >On Saturday, August 11, 2018 6:25:19 PM CEST Craig Tatlor wrote:
> >> Add initial pinctrl driver to support pin configuration with
> >> pinctrl framework for sdm660.
> >> Based off CAF implementation.
> >> 
> >> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> >> ---
> >> 
> >> diff --git
> >a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> >b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> >> new file mode 100644
> >> index 000000000000..85e6c6c17c04
> >> --- /dev/null
> >> +++
> >b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> >> @@ -0,0 +1,195 @@
> >> +Qualcomm Technologies, Inc. SDM660 TLMM block
> >> +
> >> +This binding describes the Top Level Mode Multiplexer block found in
> >the
> >> +SDM660 platform.
> >> +
> >> +- compatible:
> >> +	Usage: required
> >> +	Value type: <string>
> >> +	Definition: must be "qcom,sdm660-pinctrl"
> >> +
> >> +- reg:
> >> +	Usage: required
> >> +	Value type: <prop-encoded-array>
> >> +	Definition: the base address and size of the TLMM register space.
> >> +
> >> +- interrupts:
> >> +	Usage: required
> >> +	Value type: <prop-encoded-array>
> >> +	Definition: should specify the TLMM summary IRQ.
> >> +
> >> +- interrupt-controller:
> >> +	Usage: required
> >> +	Value type: <none>
> >> +	Definition: identifies this node as an interrupt controller
> >> +
> >> +- #interrupt-cells:
> >> +	Usage: required
> >> +	Value type: <u32>
> >> +	Definition: must be 2. Specifying the pin number and flags, as
> >defined
> >> +		    in <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +- gpio-controller:
> >> +	Usage: required
> >> +	Value type: <none>
> >> +	Definition: identifies this node as a gpio controller
> >> +
> >> +- #gpio-cells:
> >> +	Usage: required
> >> +	Value type: <u32>
> >> +	Definition: must be 2. Specifying the pin number and flags, as
> >defined
> >> +		    in <dt-bindings/gpio/gpio.h>
> >> +
> >> +Please refer to ../gpio/gpio.txt and
> >../interrupt-controller/interrupts.txt for
> >> +a general description of GPIO and interrupt bindings.
> >You want to specify gpio-ranges here as well. The property is explained
> >in Section "2.1) gpio- and pin-controller interaction" in
> >../gpio/gpio.txt
> >
> >Without it, the gpio-hogs construct (part of ../gpio/gpio.txt) will
> >cause
> >the driver to fail during boot. (try it, ;-) )
> Would gpio-ranges make sense for this, as the gpio and pinctrl are in same block?
Yes, it's part of the ../gpio/gpio.txt which you link.
Here's a copy of the relevant section that explains this
gpio- and pin-controller interaction.


|2.1) gpio- and pin-controller interaction
|-----------------------------------------
|
|Some or all of the GPIOs provided by a GPIO controller may be routed to pins
|on the package via a pin controller. This allows muxing those pins between
|GPIO and other functions.
|It is useful to represent which GPIOs correspond to which pins on which pin
|controllers. The gpio-ranges property described below represents this, and
|contains information structures as follows:
|
|       gpio-range-list ::= <single-gpio-range> [gpio-range-list]
|       single-gpio-range ::= <numeric-gpio-range> | <named-gpio-range>
|       numeric-gpio-range ::=
|                       <pinctrl-phandle> <gpio-base> <pinctrl-base> <count>
|       named-gpio-range ::= <pinctrl-phandle> <gpio-base> '<0 0>'
|       pinctrl-phandle : phandle to pin controller node
|       gpio-base : Base GPIO ID in the GPIO controller
|       pinctrl-base : Base pinctrl pin ID in the pin controller
|       count : The number of GPIOs/pins in this range
|
|The "pin controller node" mentioned above must conform to the bindings
|described in ../pinctrl/pinctrl-bindings.txt.
|...

As for the reason why gpio-ranges is what it is, please look at the ML
discussion from the "pinctrl: msm: fix gpio-hog related boot issues" thread
on <https://patchwork.kernel.org/patch/10339127/> and the posts by 
Linus Walleij: <https://patchwork.kernel.org/patch/10339127/#21903101> and
Stephen Boyd: <https://patchwork.kernel.org/patch/10339127/#21867185>.
(It's quite a bit to take in)

> Seems no other qcom pinctrl drivers have it and I'm able to boot without it.
Ok, let's run an experiment. Please remove the gpio-ranges property and try
adding a test gpio-hog to your device's DTS:

something like (I randomly selected GPIO5, but it shouldn't
matter which gpio you select here. If you know a unused/NC
pin/gpio, then you can use it instead):

&tlmm {
	test-hog {
		gpio-hog;
		gpios = <5 0>;
		output-low;
		line-name = "test hog";
	};
};

compile&install it and then watch the kernel on the next boot:

without the gpio-ranges present, it will spew out something along the
lines of:

| requesting hog GPIO test hog (chip 3000000.pinctrl, offset 5) failed, -517
| gpiochip_add_data: GPIOs 0..114 (3000000.pinctrl) failed to register
| sdm660-pinctrl 3000000.pinctrl: Failed register gpiochip

The single gpio-hog causes havoc and takes down the sdm660-pinctrl with it.
And every driver that depends on the pinctrl to setup the pin muxing/config
will fail to load as well. (check out /sys/kernel/debug/pinctrl/, it will be
empty.)

Regards,
Christian
