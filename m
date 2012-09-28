From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH Resend 1/2] mmc: sdhci-spear: add device tree bindings
Date: Fri, 28 Sep 2012 15:19:30 +0530
Message-ID: <CAOh2x=mrL6ZT5xR1HMM-r_RQL+J6YE80hq56e9ykndxrEwaHUw@mail.gmail.com>
References: <viresh.kumar@linaro.org>
	<a42729885c593f61bb62c45f229174d9f7370c40.1348809217.git.viresh.kumar2@arm.com>
	<87lifuv7rm.fsf@octavius.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <87lifuv7rm.fsf@octavius.laptop.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: spear-devel@list.st.com, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sr@denx.de
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2012 at 2:33 PM, Chris Ball <cjb@laptop.org> wrote:
> On Fri, Sep 28 2012, Viresh Kumar wrote:
>> +- reg : Address range of the sdhci
>> +- interrupt-parent: Should be the phandle for the interrupt controller
>> +  that services interrupts for this device
>> +- interrupt: Should contain the sdhci interrupt number
>
> You don't have to mention reg/interrupts, because they're already
> covered in mmc.txt.

Ok.

>> +Optional Properties:
>> +- cd-gpios: card detect gpio, with zero flags.
>> +- power-gpio: specifies the power gpio pin with flags: active low:1, active
>> +  high:0
>> +- power_always_enb: power should be on before inserting the card and so can't be
>> +  switched off. Only valid when power gpio is supported.
>
> power-gpio should be "power-gpios" (even though there's only one), and
> power_always_enb should use hyphens instead of underscores,

Sure.

> but I have
> a more fundamental request:
>
> You should use a fixed regulator instead of this power-gpio hack.
> It's easy to hook up a fixed regulator to a gpio:
>
>         vmmc1: fixedregulator@0 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-supply";
>                 regulator-min-microvolt = <1800000>;
>                 regulator-max-microvolt = <1800000>;
>                 gpio = <&gpio1 16 0>;
>                 startup-delay-us = <70000>;
>                 vin-supply = <&parent_reg>;
>         };
>
> and then you can encode the regulator inside your SD host:
>
>         sdhci@fc000000 {
>                 compatible = "st,spear300-sdhci";
>                 reg = <0xfc000000 0x1000>;
>                 cd-gpios = <&gpio0 6 0>;
>                 vmmc-supply = <&vmmc1>;
>         };
>
> and the MMC core will take care of making sure that it's powered up
> only when needed.  What do you think?

We haven't used regulator framework till now for SPEAr and i am not much
knowledgeable in that.

Because i am not adding this power hack now and it had been there since ever,
i would request you to take this patchset as is..

@Shiraz: Can you please explore this a bit and provide a separate
patch for it in
future?

--
viresh
