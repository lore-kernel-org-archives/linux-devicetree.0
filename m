From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: where to add imx-udc-mx27 in device tree
Date: Wed, 6 Aug 2014 09:31:31 -0300
Message-ID: <CAOMZO5A0zVi29AXHOFZENQxonXFfETukbj-SSmQwO4km0cAgog@mail.gmail.com>
References: <E70AF999396FDF4EAE40E195B84709611F847DDE@SPMDEGHN001.CADCON.INTERN>
	<CAOMZO5AqZrnn8ww1oM998NwRXVw6MM6TKkbD6rNZ1bZMKEx0tQ@mail.gmail.com>
	<E70AF999396FDF4EAE40E195B84709611F84803F@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F84803F-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 6, 2014 at 8:52 AM, Priebe, Sebastian
<Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org> wrote:
> Hello,
>
> I pulled linux-next, but still can't figure out where to add my udc.
> Can you please explain when fsl-udc is loaded?

Maybe I don't understand the question.

There is no 'fsl-udc' that needs to be loaded at all. The USB driver
for imx is the chipidea driver.

In the imx27.dtsi we have:

            usbotg: usb@10024000 {
                compatible = "fsl,imx27-usb";
                reg = <0x10024000 0x200>;
                interrupts = <56>;
                clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
                fsl,usbmisc = <&usbmisc 0>;
                status = "disabled";
            };

            usbh1: usb@10024200 {
                compatible = "fsl,imx27-usb";
                reg = <0x10024200 0x200>;
                interrupts = <54>;
                clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
                fsl,usbmisc = <&usbmisc 1>;
                status = "disabled";
            };

            usbh2: usb@10024400 {
                compatible = "fsl,imx27-usb";
                reg = <0x10024400 0x200>;
                interrupts = <55>;
                clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
                fsl,usbmisc = <&usbmisc 2>;
                status = "disabled";
            };

So the "compatible = "fsl,imx27-usb";" is all we need there.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
