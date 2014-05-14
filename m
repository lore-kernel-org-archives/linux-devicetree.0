From: Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Subject: Re: [PATCH v3 2/6] clk: Add clock driver for AXM55xx SoC
Date: Thu, 15 May 2014 00:22:16 +0200
Message-ID: <CAE0=X_3WA5ZzEE1NespeScmnMkr9oxNMc1=+X86i5NpSffiUnA@mail.gmail.com>
References: <cover.1400072260.git.anders.berg@avagotech.com>
	<a83c5e1272d7a3242701504f238789592c2ec80f.1400072260.git.anders.berg@avagotech.com>
	<20140514200845.19795.80794@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140514200845.19795.80794@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anders Berg <anders.berg-M7mHMAq9Yzo@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 14, 2014 at 10:08 PM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Anders Berg (2014-05-14 11:37:57)
>> +Example:
>> +
>> +       clk_ref0: clk_ref0 {
>> +               compatible = "fixed-clock";
>> +               #clock-cells = <0>;
>> +               clock-frequency = <125000000>;
>> +       };
>
> Hi Anders,
>
> The driver looks good. As for the DT binding, I am starting to request
> that bindings for new hardware move away from the one-clock-per-node
> method. I am not forcing anyone with stable bindings to migrate that
> way, but it tends to make maintenance easier in the long run (e.g.
> setting per-clock flags, etc).
>
> Your clk_ref0 example looks good, assuming that it is an off-chip clock
> that feeds into the rest of the clock generator.
>
>> +
>> +       clk_cpu_pll: clk_cpu_pll@2010022000 {
>> +               compatible = "lsi,axxia-pll-clock";
>> +               #clock-cells = <0>;
>> +               clocks = <&clk_ref0>;
>> +               clock-output-names = "clk_cpu_pll";
>> +               reg = <0x20 0x10022000 0 0x2c>;
>> +       };
>
> I assume the rest of your clocks are part of a clock generator IP block
> inside of your chip. Have you looked at the QCOM binding? It is my
> favorite binding these days. Here are some highlights:
>
[...]
>
> Using this type of binding you only need to declare your clock generator
> IP node in dts, and then define a mapping in the DT include chroot. Then
> you can define your per-clock data inside of your clock driver instead
> of putting all of the details inside of DT.
>
> If you have a strong reason to do it the way that you originally posted
> then let me know.
>

No strong reason... I just happened to pick the keystone-clocks.dtsi
as an example when I wrote this. But I can rework this according to
your suggestions. I'll post it as a separate patch (thus dropping the
clk patch from this series). Ok?

Thanks,
Anders
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
