From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC usb-next v5 2/3] usb: core: add a wrapper for the USB PHYs
 on the root-hub
Date: Thu, 12 Oct 2017 23:08:16 +0200
Message-ID: <CAFBinCDp-QK0jQEL9EHBqN-M4VPg0nA49rdUa_D7mM-KFMhJRQ@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com> <20171008211713.18696-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171008211713.18696-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
[snip]
> +struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev)
> +{
> +       struct device_node *roothub_np, *port_np;
> +       struct usb_phy_roothub *phy_roothub;
> +       struct usb_phy_roothub *roothub_entry;
> +       struct list_head *head;
> +       int err;
> +
> +       roothub_np = usb_of_get_child_node(dev->of_node, ROOTHUB_PORTNUM);
> +       if (!of_device_is_available(roothub_np)) {
> +               dev_err(dev, "no roothub node found\n");
Xiaolong Ye's kbuild test robot found this dev_err() which shouldn't
be there. I'll remove it in the next version - thanks for spotting
this!

> +               return NULL;
> +       }
> +
[snip]
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
