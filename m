From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/5] Documentation: bindings: add doc for the Rockchip
 usb PHY
Date: Tue, 9 Dec 2014 15:42:46 +0100
Message-ID: <CABgxDo+XJGTdLtbKSeN38aOuVG-kizFs4a1o65HaeRAwKafGhw@mail.gmail.com>
References: <1418093293-30557-1-git-send-email-lyz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418093293-30557-1-git-send-email-lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

2014-12-09 3:48 GMT+01:00 Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>:
> Document the bindings of the Rockchip usb PHY driver.


Long description is the same than the short one.. So either the long
description is useless
or it can be improved.

>
> +Required properties:
> + - compatible: rockchip,rk3288-usb-phy
> + - rockchip,grf : phandle to the syscon managing the "general
> +   register files"
> + - #phy-cells: should be 1
> + - #address-cells: should be 1
> + - #size-cells: should be 0
> +
> +Sub-nodes:
> +Each PHY should be represented as a sub-node.
> +
> +Sub-nodes
> +required properties:
> +- reg: the PHY number
> +               "0" - PHY connect to OTG controller
> +               "1" - PHY connect to HOST0 controller
> +               "2" - PHY connect to HOST1 controller
> +
> +Optional Properties:
> +- clocks : phandle + clock specifier for the phy clocks
> +
> +Example:
> +
> +usbphy: phy {
> +       #phy-cells = <1>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       compatible = "rockchip,rk3288-usb-phy";
> +       rockchip,grf = <&grf>;
> +};

Could you reorder these properties to have the same order than in the
"required properties" ? Something like:

usbphy: phy {
       compatible = "rockchip,rk3288-usb-phy";
       rockchip,grf = <&grf>;
       #phy-cells = <1>;
       #address-cells = <1>;
       #size-cells = <0>;
};

Thanks,
Romain
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
