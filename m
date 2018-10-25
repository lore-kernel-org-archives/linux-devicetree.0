From: thesven73@gmail.com
Subject: Re: [PATCH anybus v1 2/4] dt-bindings: anybus-bridge: document devicetree binding.
Date: Thu, 25 Oct 2018 09:55:15 -0400
Message-ID: <20181025135515.8397-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Linus, thank you for the patch review !!

>> +  - pwms : the pwm connected to the bridge's 'pwm input'.
>
> That is really unintuitive and needs a detailed explanation. What
> is a bridge doing with a PWM? Is it 100% certain this is a PWM,
> it's not just a .... clock? A pwm is a pule WIDTH modulator and
> I can't for my life understand why a bus bridge needs a signal
> with variable pulse width, but surprise me! :D

You are 100% correct, this is a clock !
The hardware designers attached the bridge's clock input to an iMX pwm output,
and instructed us to provide a clock with 50% duty cycle and a certain freq.

The only way I know to activate a pwm is to connect it to a driver in the fdt,
then inside the driver enable the pwm, like so:

+       /* PWM */
+       pwm = devm_pwm_get(dev, NULL);
+       if (IS_ERR(pwm)) {
+               dev_err(dev, "pwm not found\n");
+               return -EINVAL;
+       }
+       pwm_get_args(pwm, &pargs);
+       period = pargs.period;
+       err = pwm_config(pwm, period/2, period);
+       if (err)
+               return err;
+       err = pwm_enable(pwm);
+       if (err)
+               return err;

This is why the bridge driver has a dependency on a pwm.
If the pwm could be enabled individually, I could drop this dependency.
Can you think of a way?

>> +               fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
>> +                               0x00000000 0xa0000240 0x00000000>;
>
> Is it just a copy/paste from
> Documentation/devicetree/bindings/bus/imx-weim.txt
> leftover?

No. We attach the bridge to the i.MX WEIM bus. Every fdt WEIM child node
requires a fsl,weim-cs-timing property, which provides the bus timing for
that particular chip select. It's the weim driver that requires this,
I'm only following its instructions.

Should I just leave this out in the example? In theory, the bridge can be
connected to any parallel bus, so fsl,weim-cs-timing is Too Much Information
for the example?
