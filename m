From: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Subject: Re: [RESEND RFC PATCH 0/7] sun8i H3 HDMI glue driver
 for DW HDMI
Date: Sun, 1 Oct 2017 12:46:38 +1100
Message-ID: <ccaebb62-ad28-4905-5ebf-bcdc1e7ebf54@ozlabs.ru>
References: <20170920200124.20457-1-jernej.skrabec@siol.net>
 <51c50157-6794-852b-f89d-647b9cf06ef2@ozlabs.ru>
 <34246001.lKHNgTVc0h@jernej-laptop>
Reply-To: aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD5JHS4X5YBBBB4SYHHAKGQEGYFXPVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <34246001.lKHNgTVc0h@jernej-laptop>
Content-Language: en-AU
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/10/17 04:56, Jernej =C5=A0krabec wrote:
> Hi,
>=20
> Dne sobota, 30. september 2017 ob 13:58:03 CEST je Alexey Kardashevskiy=
=20
> napisal(a):
>> On 21/09/17 06:01, Jernej Skrabec wrote:
>>> [added media mailing list due to CEC question]
>>>
>>> This patch series adds a HDMI glue driver for Allwinner H3 SoC. For now=
,
>>> only video and CEC functionality is supported. Audio needs more tweaks.
>>>
>>> Series is based on the H3 DE2 patch series available on mailing list:
>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-August/52269=
7.h
>>> tml (ignore patches marked with [NOT FOR REVIEW NOW] tag)
>>>
>>> Patch 1 adds support for polling plug detection since custom PHY used h=
ere
>>> doesn't support HPD interrupt.
>>>
>>> Patch 2 enables overflow workaround for v1.32a. This HDMI controller
>>> exhibits same issues as HDMI controller used in iMX6 SoCs.
>>>
>>> Patch 3 adds CLK_SET_RATE_PARENT to hdmi clock.
>>>
>>> Patch 4 adds dt bindings documentation.
>>>
>>> Patch 5 adds actual H3 HDMI glue driver.
>>>
>>> Patch 6 and 7 add HDMI node to DT and enable it where needed.
>>>
>>> Allwinner used DW HDMI controller in a non standard way:
>>> - register offsets obfuscation layer, which can fortunately be turned o=
ff
>>> - register read lock, which has to be disabled by magic number
>>> - custom PHY, which have to be initialized before DW HDMI controller
>>> - non standard clocks
>>> - no HPD interrupt
>>>
>>> Because of that, I have two questions:
>>> - Since HPD have to be polled, is it enough just to enable poll mode? I=
'm
>>>
>>>   mainly concerned about invalidating CEC address here.
>>>
>>> - PHY has to be initialized before DW HDMI controller to disable offset
>>>
>>>   obfuscation and read lock among other things. This means that all clo=
cks
>>>   have to be enabled in glue driver. This poses a problem, since when
>>>   using component model, dw-hdmi bridge uses drvdata for it's own priva=
te
>>>   data and prevents glue layer to pass a pointer to unbind function,
>>>   where clocks should be disabled. I noticed same issue in meson DW HDM=
I
>>>   glue driver, where clocks are also not disabled when unbind callback =
is
>>>   called. I noticed that when H3 SoC is shutdown, HDMI output is still
>>>   enabled and lastest image is shown on monitor until it is unplugged
>>>   from power supply. Is there any simple solution to this?
>>>
>>> Chen-Yu,
>>> TL Lim was unable to obtain any answer from Allwinner about HDMI clocks=
. I
>>> think it is safe to assume that divider in HDMI clock doesn't have any
>>> effect.
>>>
>>> Branch based on linux-next from 1. September with integrated patches is
>>> available here:
>>> https://github.com/jernejsk/linux-1/tree/h3_hdmi_rfc
>>
>> Out of curiosity I tried this one and got:
>>
>>
>>
>> [    0.071711] sun4i-usb-phy 1c19400.phy: Couldn't request ID GPIO
>> [    0.074809] sun8i-h3-pinctrl 1c20800.pinctrl: initialized sunXi PIO
>> driver [    0.076167] sun8i-h3-r-pinctrl 1f02c00.pinctrl: initialized su=
nXi
>> PIO driver [    0.148009] ------------[ cut here ]------------
>> [    0.148035] WARNING: CPU: 0 PID: 1 at
>> drivers/clk/sunxi-ng/ccu_common.c:41 ccu_nm_set_rate+0x1d0/0x274
>> [    0.148046] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 4.13.0-rc6-next-20170825-aik-aik #24
>> [    0.148051] Hardware name: Allwinner sun8i Family
>> [    0.148082] [<c010de6c>] (unwind_backtrace) from [<c010b260>]
>> (show_stack+0x10/0x14)
>> [    0.148101] [<c010b260>] (show_stack) from [<c077a464>]
>> (dump_stack+0x84/0x98)
>> [    0.148117] [<c077a464>] (dump_stack) from [<c011abe0>]
>> (__warn+0xe0/0xfc) [    0.148132] [<c011abe0>] (__warn) from [<c011acac>=
]
>> (warn_slowpath_null+0x20/0x28)
>> [    0.148145] [<c011acac>] (warn_slowpath_null) from [<c03d1888>]
>> (ccu_nm_set_rate+0x1d0/0x274)
>> [    0.148161] [<c03d1888>] (ccu_nm_set_rate) from [<c03c78b4>]
>> (clk_change_rate+0x19c/0x250)
>> [    0.148175] [<c03c78b4>] (clk_change_rate) from [<c03c7b7c>]
>> (clk_core_set_rate_nolock+0x68/0xb0)
>> [    0.148187] [<c03c7b7c>] (clk_core_set_rate_nolock) from [<c03c8134>]
>> (clk_set_rate+0x20/0x30)
>> [    0.148202] [<c03c8134>] (clk_set_rate) from [<c03cc560>]
>> (of_clk_set_defaults+0x200/0x364)
>> [    0.148219] [<c03cc560>] (of_clk_set_defaults) from [<c045427c>]
>> (platform_drv_probe+0x18/0xb0)
>> [    0.148233] [<c045427c>] (platform_drv_probe) from [<c0452efc>]
>> (driver_probe_device+0x234/0x2e8)
>> [    0.148246] [<c0452efc>] (driver_probe_device) from [<c0453068>]
>> (__driver_attach+0xb8/0xbc)
>> [    0.148258] [<c0453068>] (__driver_attach) from [<c0451414[    1.3361=
54]
>> Unable to handle kernel NULL pointer dereference at virtual address 0000=
0008
>>
>=20
> Patch for that is already merged upstream and can be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/
> drivers/clk/sunxi-ng?id=3D62d212bdb022deeb875f92f6e376c799e3f35eca

Lovely, it works, thanks!


>> and a bit later:
>>
>> [    1.995572] Rebooting in 10 seconds..
>=20
> I'm not sure about that one. Kernel config issue?



Yup, I did not have CMA enabled.




--=20
Alexey

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
