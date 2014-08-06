From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: where to add imx-udc-mx27 in device tree
Date: Wed, 6 Aug 2014 10:24:40 -0300
Message-ID: <CAOMZO5DPN=euHSRA093NVRC+dZotTDVpbodrji9NeGUgJjiDJA@mail.gmail.com>
References: <E70AF999396FDF4EAE40E195B84709611F847DDE@SPMDEGHN001.CADCON.INTERN>
	<CAOMZO5AqZrnn8ww1oM998NwRXVw6MM6TKkbD6rNZ1bZMKEx0tQ@mail.gmail.com>
	<E70AF999396FDF4EAE40E195B84709611F84803F@SPMDEGHN001.CADCON.INTERN>
	<CAOMZO5A0zVi29AXHOFZENQxonXFfETukbj-SSmQwO4km0cAgog@mail.gmail.com>
	<E70AF999396FDF4EAE40E195B84709611F84808A@SPMDEGHN001.CADCON.INTERN>
	<CAOMZO5C89qyqzd0ML07YZvpCa-XSAgP7a6GGFH0DpDjx5vZgpg@mail.gmail.com>
	<E70AF999396FDF4EAE40E195B84709611F8480C6@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F8480C6-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 6, 2014 at 10:16 AM, Priebe, Sebastian
<Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org> wrote:
> I'm sorry for the noise, but I am new to device trees.
> We are using an iMX35 (not iMX27) and have CONFIG_USB_FSL_MPH_DR_OF in our config.

Ah, OK that makes things clearer now :-)

> I have no idea why I should need the CHIPIDEA stuff. I didn't use it in the past (kernel 3.2 without DT).

When using device tree the USB driver for the imx family is the
chipidea driver. The driver you used reviously without DT does not
work with DT.

> Can somebody please help with a little bit with my USB gadget? I am trying to port our machine code to DT.

There is a mx35 dts file that has otg support. You can use
arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi as reference:

&usbotg {
    phy_type = "utmi";
    dr_mode = "otg";
    external-vbus-divider;
    status = "okay";
};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
