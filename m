From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH] pinctrl: sunxi: Add H3 R_PIO controller support
Date: Tue, 2 Feb 2016 13:10:31 +0100
Message-ID: <20160202121030.GA8309@box2.japko.eu>
References: <20160201101225.GA19687@box2.japko.eu>
 <CAGb2v65-X2_MoRm1=wAub9Y8Vpt-f-roYUT73jDk5Fnj17zKTw@mail.gmail.com>
 <20160202092451.GA26944@box2.japko.eu>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDIL57GUWIARBOFZYK2QKGQEW7VPNPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160202092451.GA26944-xLeyfSbClftGit24Ens98Q@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 02, 2016 at 10:24:51AM +0100, Krzysztof Adamski wrote:
>On Tue, Feb 02, 2016 at 02:25:18PM +0800, Chen-Yu Tsai wrote:
>>On Mon, Feb 1, 2016 at 6:12 PM, Krzysztof Adamski <k@japko.eu> wrote:
>>>- reg: Should contain the register physical address and length for 
>>>the
>>>diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>>>b/arch/arm/boot/dts/sun8i-h3.dtsi
>>>index 1524130e..745f64c 100644
>>>--- a/arch/arm/boot/dts/sun8i-h3.dtsi
>>>+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>>>@@ -493,5 +493,17 @@
>>>                        interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
>>>                                     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>>>                };
>>>+
>>>+               r_pio: pinctrl@01f02c00 {
>>>+                       compatible = "allwinner,sun8i-h3-r-pinctrl";
>>>+                       reg = <0x01f02c00 0x400>;
>>>+                       interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
>>>+                       clocks = <&bus_gates 69>;
>>
>>This is probably wrong. According to other SoCs all R_ block peripherals
>>have clock gates and reset controls in the PRCM.
>
>This is problematic. I can find information about reset and gates control for
>this peripheral on other SoCs user manuals but there is nothing about it in H3
>User Manual
>(https://www.dropbox.com/s/nkr9slo1o9x6i1z/Allwinner_H3_Datasheet_V1.1.pdf?dl=0).
>
>Similarly, while I think I can find r_pio clock setup for A33:
>https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers/clk/sunxi/clk-sun8iw5.c
>
>I can't find it for H3, though:
>https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers/clk/sunxi/clk-sun8iw7.c
>
>Well, apart from this strange snippet:
>
>// binder r-pio CPUS_APB0_GATE to pio-clk's gate-reset-register
>   clk = clk_get(NULL,"pio");
>   if(!clk || IS_ERR(clk))
>       printk("Error not get clk pio\n");
>   else
>   {
>       struct clk_hw *hw = __clk_get_hw(clk);
>       struct sunxi_clk_periph *periph = to_clk_periph(hw);
>       struct sunxi_clk_periph_gate *gate = &periph->gate;
>       gate->reset = sunxi_clk_cpus_base+CPUS_APB0_GATE ;
>       gate->rst_shift = 0;
>       clk_put(clk);
>   }
>
>
>Which I have to admit I don't fully understand. This seems to be setting reset
>line for first pio, not for r_pio - something we don't have right now. Or am I
>wrong here?
>
>I'm new to Allwinner SoCs, any help from veterans?
>
>Also, if that proves anything, I did test this code on OrangePi PC and PL ports
>works so their clock is enabled, for sure.

I did some tests and indeed, when I disabled PIO clock (bus_gates 69), 
R_PIO was still working while PIO did not. So I tryied to take the same 
address other SoCs are using (0x01f01468 - CPUS_APB0 register) and 
clearing 1st bit (which is enabled by default) disables R_PIO. So, well, 
it seems that this works the same as on other sunxi SoCs. I'll try doing 
proper change.

Best regards,
Krzysztof Adamski
