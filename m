From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: refactor pinctrl choice
 selecting for ARM64
Date: Wed, 1 Mar 2017 10:38:58 +0800
Message-ID: <CAGb2v65aw9F6rDZynRkBMQ8XG-4xYTfXG9oOvShKLk5dZf_Lgg@mail.gmail.com>
References: <20170228172444.59655-1-icenowy@aosc.xyz> <488811a1-b64f-c435-e919-7f83dc107697@arm.com>
 <345321488308121@web2g.yandex.ru>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBW7I3DCQKGQEZGA66OI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <345321488308121-kPAM4p2RxX5uio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 1, 2017 at 2:55 AM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
>
>
> 01.03.2017, 02:15, "Andre Przywara" <andre.przywara-5wv7dgnIgG8@public.gmane.org>:
>> Hi Icenowy,
>>
>> (first thing: could you create your series with --cover-letter and fill
>> this in? There you could explain what this series is about and also
>> state things like dependencies from other patches and the commit that
>> you based that on.)
>>
>> On 28/02/17 17:24, Icenowy Zheng wrote:
>>>  ARM64 Allwinner SoCs used to have every pinctrl driver selected in
>>>  ARCH_SUNXI. Change this to make their default value to (ARM64 &&
>>>  ARCH_SUNXI).
>>>
>>>  Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>>
>> Overall this is a nice solution. Thanks for posting this.
>>
>>>  ---
>>>   drivers/pinctrl/sunxi/Kconfig | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>>  diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
>>>  index 816015cf7053..92325736d953 100644
>>>  --- a/drivers/pinctrl/sunxi/Kconfig
>>>  +++ b/drivers/pinctrl/sunxi/Kconfig
>>>  @@ -48,8 +48,9 @@ config PINCTRL_SUN8I_H3
>>>           select PINCTRL_SUNXI
>>>
>>>   config PINCTRL_SUN8I_H3_R
>>>  - def_bool MACH_SUN8I
>>>  - select PINCTRL_SUNXI_COMMON
>>>  + def_bool MACH_SUN8I || (ARM64 && ARCH_SUNXI)
>>>  + depends on RESET_CONTROLLER
>>
>> So this looks a bit odd. I take it this is for the extra reset register
>> in the PRCM block.
>> 1) I don't think this belongs into this patch. If this has been
>> forgotten in the past, please make an extra patch for this. It's cheap
>> to do so ;-)
>> 2) Is this really a "depends on"? Shouldn't this be a select? With
>> sunxi_ng clocks we don't need the reset controller for the normal
>> peripherals anymore, so this option might not be selected by default in
>> the future. And having this "depends on" leads to the PINCTRL_ option
>> being hidden if RESET_CONTROLLER isn't selected.
>> I think this bites us already in arm64, where ARCH_HAS_RESET_CONTROLLER
>> is not enabled for ARCH_SUNXI.
>
> PINCTRL_ options are always hidden now, Maxime, do you
> want to change that?
>
> We should enable ARCH_HAS_RESET_CONTROLLER for
> ARCH_SUNXI, as sunxi-ng ccu is a reset controller.

Agreed.

> Without RESET_CONTROLLER enabled, errors will occur
> when linking:
> ```
> drivers/built-in.o: In function `sunxi_ccu_probe':
> of_reserved_mem.c:(.text+0x16058): undefined reference to `reset_controller_register'
> ```
>
> If you don't care, I will make it an additional patch.
>
> And there's really a reset line for the R_PIO pinctrls.

Depends on is the right thing here, since this driver depends
on the reset controller subsystem to be present for any
devm_reset_control_get calls. Now if this pinctrl has a reset
line, but is missing that call, it needs to be fixed.

It seems only A23 and A31 R_PIO drivers have them.

Regards
ChenYu

>
> But you're right, this line shouldn't occur in this patch.
> I will make a more patch for it.
>
>>
>> But as the rest of the patch is fine, if you remove this line:
>> Reviewed-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>>
>> Cheers,
>> Andre.
>>
>>>  + select PINCTRL_SUNXI
>>>
>>>   config PINCTRL_SUN8I_V3S
>>>           def_bool MACH_SUN8I
>>>  @@ -65,11 +66,11 @@ config PINCTRL_SUN9I_A80_R
>>>           select PINCTRL_SUNXI
>>>
>>>   config PINCTRL_SUN50I_A64
>>>  - bool
>>>  + def_bool ARM64 && ARCH_SUNXI
>>>           select PINCTRL_SUNXI
>>>
>>>   config PINCTRL_SUN50I_H5
>>>  - bool
>>>  + def_bool ARM64 && ARCH_SUNXI
>>>           select PINCTRL_SUNXI
>>>
>>>   endif
