From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Modifying binding or duplicating compatible string
Date: Wed, 10 May 2017 07:32:35 -0500
Message-ID: <CAL_JsqKx0KxJSMLPMr=c9yPuwTYaoOQ-acE4OntSXx=Q7BSjXA@mail.gmail.com>
References: <591fbd1e-bee4-268f-045b-395d39228a3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <591fbd1e-bee4-268f-045b-395d39228a3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 9, 2017 at 5:09 AM, Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> We currently have a "brcm,ns-ax-usb3-phy" binding defined for Broadcom's USB
> 3.0 PHY which you can find in:
> Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.txt
>
>
> It looks like this:
>
> usb3-phy {
>         compatible = "brcm,ns-ax-usb3-phy";
>         reg = <0x18003000 0x1000>, <0x18105000 0x1000>;
>         reg-names = "ccb-mii", "dmp";
>         #phy-cells = <0>;
> };
>
> The problem is that PHY is actually attached to the MDIO bus and 0x18003000
> + 0x18003004 registers are used to access whole MDIO, not just this single
> PHY.
>
> A correct binding should look like this:
>
> mdio: mdio@18003000 {
>         compatible = "brcm,iproc-mdio";
>         reg = <0x18003000 0x8>;
>         #size-cells = <1>;
>         #address-cells = <0>;
>
>         usb3-phy@10 {
>                 compatible = "brcm,ns-ax-usb3-phy";
>                 reg = <0x10>;
>                 usb3-dmp-syscon = <&usb3_dmp>;
>                 #phy-cells = <0>;
>         };
> };
>
> usb3_dmp: syscon@18105000 {
>         reg = <0x18105000 0x1000>;
> };
>
>
> I mean to clean up this situation. My question is: is this acceptable to
> support the same compatible string in two contexts?

Depends on the context. ;) I think here it would be fine because you
have differing buses.

> 1) For backward compatibility the first one would require specifying both:
>    ccb-mii / MDIO register and DMP register.

You don't need both in the DT. New DT and old OS is not a combination
we worry about. You either have the old binding or new one in the DT.
It's the driver that would need to probe the old way (presumably as a
platform device) and the new way as an mdio device.

You can decide whether you need to support the old way or not. Depends
on who it would affect for your platform.

> 2) For cleaniness the new one would require reg to be PHY index and DMP one
>    to be specified with usb3-dmp-syscon.
>
> In Linux there shouldn't be a problem as MDIO children nodes are handled
> separately, but I still don't know if it's an acceptable solution.
>
> Can I have some opinions on this, please?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
