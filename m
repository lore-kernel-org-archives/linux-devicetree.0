From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Fri, 13 Oct 2017 09:37:27 +0200
Message-ID: <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com> <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 10:56 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Arnd,
>
> thank you for reviewing this patch!
>
> On Mon, Oct 9, 2017 at 12:24 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
>> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> A USB root-hub may have several PHYs which need to be configured before
>>> the root-hub starts working.
>>> This adds the documentation for such a USB root-hub as well as a hint
>>> regarding the child-nodes on XHCI controllers which can include the
>>> roothub.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Have you checked that this still works with DT properties on a USB device
>> that is listed in the DT? A common use-case is to provide the MAC address
>> of a soldered-down USB-ethernet that lacks its own eeprom, and it seems
>> you are changing the way the parent devices of that get represented,
>> so the dev->of_node pointer in the USB device might no longer refer
>> to the correct device.
> I haven't tested the described use-case. however, this patch is not
> supposed to change the binding for actual devices.
> USB device numbering starts at 1, while 0 is reserved for the root-hub
> (at least from what I know). before this patch there was no way to
> describe the root-hub via .dts. this however is required for some
> platforms that need to set up a PHY for each port on the root-hub
> (Amlogic Meson GXL platform is one example: there are two ports
> enabled on dwc3's root-hub with 2x USB2 and 1x USB3 PHYs) - so this
> patch uses a similar binding as we already have (to describe the
> devices) to describe the root-hub

My point is that the DT binding does depend on the hierarchy, there
is no way to find a particular device unless each parent up the
chain is described correctly in DT as well and has a valid of_node
pointer.

It's possible that this has never worked on XHCI because of the lack
of the root-hub in DT. Either way, we should ensure that it does work
now and you didn't break it, so please at least test it with your patches.

The patch below should be sufficient to see if any device has an
of_node pointer when you add it to your DT:

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 17681d5638ac..498d0aa0a5c0 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -647,6 +647,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
                }
                dev->dev.of_node = usb_of_get_child_node(parent->dev.of_node,
                                raw_port);
+               dev_info(&dev->dev, "of_node %p parent %p\n",
dev->dev.of_node, parent->dev.of_node);

                /* hub driver sets up TT records */
        }


       Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
