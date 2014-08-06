From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: where to add imx-udc-mx27 in device tree
Date: Wed, 6 Aug 2014 09:53:37 -0300
Message-ID: <CAOMZO5C89qyqzd0ML07YZvpCa-XSAgP7a6GGFH0DpDjx5vZgpg@mail.gmail.com>
References: <E70AF999396FDF4EAE40E195B84709611F847DDE@SPMDEGHN001.CADCON.INTERN>
	<CAOMZO5AqZrnn8ww1oM998NwRXVw6MM6TKkbD6rNZ1bZMKEx0tQ@mail.gmail.com>
	<E70AF999396FDF4EAE40E195B84709611F84803F@SPMDEGHN001.CADCON.INTERN>
	<CAOMZO5A0zVi29AXHOFZENQxonXFfETukbj-SSmQwO4km0cAgog@mail.gmail.com>
	<E70AF999396FDF4EAE40E195B84709611F84808A@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F84808A-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 6, 2014 at 9:44 AM, Priebe, Sebastian
<Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org> wrote:

> And in our dts we have:
> &usbotg {
>         compatible = "imx-udc-mx27";

This is not correct.

>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_usbotg>;
>         dr_mode = "peripheral";
>         phy_type = "utmi_wide";

No utmi in mx27.

>         status = "okay";
>         /* what to do with workaround = FLS_USB2_WORKAROUND_ENGCM09152 ??? */

This erratum does not apply to mx27.

> };

>
> In our config we have:
> CONFIG_IMX_HAVE_PLATFORM_FSL_USB2_UDC=y

This option is for the non-dt driver. Device tree driver needs the
chipidea that I showed earlier.

As I mentioned before: in your dts file you should do something like
arch/arm/boot/dts/imx27-
eukrea-cpuimx27.dtsi:

&usbotg {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_usbotg>;
    dr_mode = "otg";
    phy_type = "ulpi";
    disable-over-current;
    status = "okay";
};

You don't need to pass the compatible line there. The compatible line
is already passed in the imx27.dtsi file:

            usbotg: usb@10024000 {
                compatible = "fsl,imx27-usb";
                reg = <0x10024000 0x200>;
                interrupts = <56>;
                clocks = <&clks IMX27_CLK_USB_IPG_GATE>;
                fsl,usbmisc = <&usbmisc 0>;
                status = "disabled";
            };

Also, if you still have issues please start a thread at arm linux
kernel or usb-devel mailing list as it would be a better place to
discuss this
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
