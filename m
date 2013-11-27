From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: imx1-core populate subdevices
Date: Wed, 27 Nov 2013 11:33:15 +0800
Message-ID: <529567FB.5090501@gtsys.com.hk>
References: <CACRpkda2dO6DvurEhaTVGJv8nDyEGOEeLCap-_+1e1mHtD0XyQ@mail.gmail.com>	<1384193987-20740-1-git-send-email-mpa@pengutronix.de> <CACRpkdaQcY43wnfD_phsi6rCo3oUmOUcei+gb9phyGT7F1iZyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaQcY43wnfD_phsi6rCo3oUmOUcei+gb9phyGT7F1iZyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, November 20, 2013 04:01 AM, Linus Walleij wrote:
> On Mon, Nov 11, 2013 at 7:19 PM, Markus Pargmann<mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>  wrote:
>
>> Support gpio devicetree subnodes to allow a more detailed DT hardware
>> description.
>>
>> Signed-off-by: Markus Pargmann<mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> Looks good to me.
>
> Tentatively applied this, the DT people may want to say something
> about this.
>
> Yours,
> Linus Walleij
> --

Hi,

I tried the new configuration but the kernel oops when probing the
dm9000 caused by insufficient resources more likely the real reason
that somehow the gpio6: triggers a problem


[    0.115718] irq: no irq domain found for 
/soc/aipi@10000000/iomuxc@10015000/gpio@10015500 !
[    0.115768] ------------[ cut here ]------------
[    0.115853] WARNING: CPU: 0 PID: 1 at drivers/of/platform.c:171 
of_device_alloc+0x110/0x15c()
[    0.117824] ---[ end trace 0e10ae727e6e0ab1 ]---
[    0.121236] Failed to request board ext/int gpios
[    0.152712] imx27-pinctrl 10015000.iomuxc: initialized IMX pinctrl driver


iomuxc: iomuxc@10015000 {
         compatible = "fsl,imx27-iomuxc";
         reg = <0x10015000 0x600>;
         #address-cells = <1>;
         #size-cells = <1>;
         ranges;

         gpio1: gpio@10015000 {
              compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
              reg = <0x10015000 0x100>;
              interrupts = <8>;
              gpio-controller;
              #gpio-cells = <2>;
              interrupt-controller;
              #interrupt-cells = <2>;
         };
...
         gpio6: gpio@10015500 {
              compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
              reg = <0x10015500 0x100>;
              interrupts = <8>;
              gpio-controller;
              #gpio-cells = <2>;
              interrupt-controller;
              #interrupt-cells = <2>;
         };
};

Kernel Linux version 3.13.0-rc1-next-20131125-dirty

With kind regards
Chris

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
