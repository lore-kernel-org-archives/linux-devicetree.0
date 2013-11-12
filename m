From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 5/6] ARM: hi3xxx: add smp support
Date: Tue, 12 Nov 2013 15:00:52 -0800
Message-ID: <87txfhmdi3.fsf@linaro.org>
References: <1383813691-31587-1-git-send-email-haojian.zhuang@linaro.org>
	<1383813691-31587-6-git-send-email-haojian.zhuang@linaro.org>
	<527B6BCA.2010606@gmail.com>
	<CAD6h2NRTc42YAKr6zLdMpiYbpBLatA9HNpZeFa3pZZpvJXBuCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD6h2NRTc42YAKr6zLdMpiYbpBLatA9HNpZeFa3pZZpvJXBuCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Haojian Zhuang's message of "Tue, 12 Nov 2013 16:49:42 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "tglx@linutronix.de" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Shaojie Sun <shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On 7 November 2013 18:30, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> On 11/7/13 2:41 AM, Haojian Zhuang wrote:
>>> From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> Enable SMP support on hi3xxx platform
>>>
>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Tested-by: Zhang Mingjun <zhang.mingjun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Tested-by: Li Xin <li.xin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../bindings/arm/hisilicon/hisilicon.txt           | 30 ++++++--
>>>  arch/arm/boot/dts/hi3620.dtsi                      | 38 ++++++++++
>>>  arch/arm/mach-hi3xxx/Kconfig                       |  3 +
>>>  arch/arm/mach-hi3xxx/Makefile                      |  1 +
>>>  arch/arm/mach-hi3xxx/core.h                        | 11 +++
>>>  arch/arm/mach-hi3xxx/hi3xxx.c                      | 34 +++++++++
>>>  arch/arm/mach-hi3xxx/platsmp.c                     | 84 ++++++++++++++++++++++
>>>  7 files changed, 197 insertions(+), 4 deletions(-)
>>>  create mode 100644 arch/arm/mach-hi3xxx/core.h
>>>  create mode 100644 arch/arm/mach-hi3xxx/platsmp.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>>> index 3be60c8..8c7a465 100644
>>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>>> @@ -1,10 +1,32 @@
>>>  Hisilicon Platforms Device Tree Bindings
>>>  ----------------------------------------------------
>>>
>>> -Hi3716 Development Board
>>> -Required root node properties:
>>> -     - compatible = "hisilicon,hi3716-dkb";
>>> -
>>>  Hi4511 Board
>>>  Required root node properties:
>>>       - compatible = "hisilicon,hi3620-hi4511";
>>> +
>>> +Hisilicon system controller
>>> +
>>> +Required properties:
>>> +- compatible : "hisilicon,sysctrl"
>>> +- reg : Register address and size
>>> +
>>> +Optional properties:
>>> +- smp-offset : offset in sysctrl for notifying slave cpu booting
>>> +             cpu 1, reg;
>>> +             cpu 2, reg + 0x4;
>>> +             cpu 3, reg + 0x8;
>>> +             If reg value is not zero, cpun exit wfi and go
>>> +- resume-offset : offset in sysctrl for notifying cpu0 when resume
>>> +- reboot-offset : offset in sysctrl for system reboot
>>> +
>>> +Example:
>>> +
>>> +     /* for Hi3620 */
>>> +     sysctrl: system-controller@fc802000 {
>>> +             compatible = "hisilicon,sysctrl";
>>> +             reg = <0xfc802000 0x1000>;
>>> +             smp-offset = <0x31c>;
>>> +             resume-offset = <0x308>;
>>> +             reboot-offset = <0x4>;
>>> +     };
>>> diff --git a/arch/arm/boot/dts/hi3620.dtsi b/arch/arm/boot/dts/hi3620.dtsi
>>> index b9d8679..e311937 100644
>>> --- a/arch/arm/boot/dts/hi3620.dtsi
>>> +++ b/arch/arm/boot/dts/hi3620.dtsi
>>> @@ -39,6 +39,27 @@
>>>                       reg = <0x0>;
>>>                       next-level-cache = <&L2>;
>>>               };
>>> +
>>> +             cpu@1 {
>>> +                     compatible = "arm,cortex-a9";
>>> +                     device_type = "cpu";
>>> +                     reg = <1>;
>>> +                     next-level-cache = <&L2>;
>>> +             };
>>> +
>>> +             cpu@2 {
>>> +                     compatible = "arm,cortex-a9";
>>> +                     device_type = "cpu";
>>> +                     reg = <2>;
>>> +                     next-level-cache = <&L2>;
>>> +             };
>>> +
>>> +             cpu@3 {
>>> +                     compatible = "arm,cortex-a9";
>>> +                     device_type = "cpu";
>>> +                     reg = <3>;
>>> +                     next-level-cache = <&L2>;
>>> +             };
>>>       };
>>>
>>>       amba {
>>> @@ -65,6 +86,17 @@
>>>                       reg = <0x1000 0x1000>, <0x100 0x100>;
>>>               };
>>>
>>> +             sysctrl: system-controller@802000 {
>>> +                     compatible = "hisilicon,sysctrl";
>>> +                     reg = <0x802000 0x1000>;
>>> +                     #address-cells = <1>;
>>> +                     #size-cells = <0>;
>>> +
>>> +                     smp-offset = <0x31c>;
>>> +                     resume-offset = <0x308>;
>>> +                     reboot-offset = <0x4>;
>>> +             };
>>> +
>>>               dual_timer0: dual_timer@800000 {
>>>                       compatible = "arm,sp804", "arm,primecell";
>>>                       reg = <0x800000 0x1000>;
>>> @@ -115,6 +147,12 @@
>>>                       status = "disabled";
>>>               };
>>>
>>> +             timer5: timer@600 {
>>> +                     compatible = "arm,cortex-a9-twd-timer";
>>> +                     reg = <0x600 0x20>;
>>> +                     interrupts = <1 13 0xf01>;
>>> +             };
>> Do you have a clocks node for this timer?
>
> As I mentioned in the 0th patch, clock binding are totally removed
> in this patch. And clock driver will be append in another patch set.

Still, won't this timer still need a dummy fixed-rate clock until the
real clocks are in place?  Otherwise it seems twd_get_clock() is going
to fail.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
