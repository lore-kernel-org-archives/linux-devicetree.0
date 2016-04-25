From: Martin Sperl <kernel@martin.sperl.org>
Subject: clk: bcm2835: what is the best way to limit the selection of parent
 clocks in the device-tree
Date: Mon, 25 Apr 2016 10:01:20 +0200
Message-ID: <571DCED0.9010008@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi!

On the raspberry pi the pcm (and other) clock has multiple parent
clocks that the driver may select from to get the "best fit" clock.

This list of parents of valid for each clock is hard-coded in the driver.

But this "standard" list of parents includes some clocks that are
independently controlled by the firmware with - unfortunately for
now - no notification of changes going back to the linux kernel.
This is mostly needed for powermanagement and ARM clock
modifications as well as to avoid overheating.

So how is the best way to define those parent clocks one wants to
use for an individual clock?

As far as I can tell none of the default dt-properties really fit.

So I wonder if something like the following would be acceptable:
cprman: cprman@7e101000 {
     compatible = "brcm,bcm2835-cprman";
     #clock-cells = <1>;
     reg = <0x7e101000 0x2000>;
     clocks = <&clk_osc>;
     /* limit parent clock selection for the PCM clock */
     pcm_clk@BCM2835_CLOCK_PCM {
         reg = <BCM2835_CLOCK_PCM>;
         clock-parent-names = "gnd", "xosc", "plla_per", "plld_per";
     };
};

As an alternative it could also be defined on the consumer side:
i2s: i2s@7e203000 {
     compatible = "brcm,bcm2835-i2s";
     reg = <0x7e203000 0x24>;
     clocks = <&cprman BCM2835_CLOCK_PCM>;
     clock-parent-names = "gnd", "xosc", "plla_per", "plld_per";
};
This variant might need to be made "clock-parent-names-0",
"clock-parent-names-1", ... (analogous to "pinctrl-0") to allow
distinct parents for distinct clocks.

Is something like this acceptable?

If not, what approach could be taken to achieve the required
(except for hard-coding the selection it in the driver)?

If it is the second, then I guess the implementation would need
to go into the core framework while for the first the logic could
also stay within the driver.

Thanks,
                 Martin

