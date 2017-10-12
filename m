From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Thu, 12 Oct 2017 23:35:46 +0200
Message-ID: <CAFBinCBwzzzj-ew-VTb9zojfzC9gedHd0uu0ez4WejBRTpnsWg@mail.gmail.com>
References: <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <Pine.LNX.4.44L0.1710121715390.1278-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1710121715390.1278-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Thu, Oct 12, 2017 at 11:17 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Thu, 12 Oct 2017, Martin Blumenstingl wrote:
>
>> I haven't tested the described use-case. however, this patch is not
>> supposed to change the binding for actual devices.
>> USB device numbering starts at 1, while 0 is reserved for the root-hub
>> (at least from what I know).
>
> Actually 1 is reserved for the root hub.  External devices are numbered
> starting from 2.  (We can't use 0 for the root hub because, as you
> said, USB device numbering starts at 1!)
I just had a look at lsusb again:
$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M

however, for the devicetree bindings the devices are supposed to use 1-31: [0]

Alan: just to make sure I understood you correctly: do you agree with
this patch?

> Alan Stern
>
>> before this patch there was no way to
>> describe the root-hub via .dts. this however is required for some
>> platforms that need to set up a PHY for each port on the root-hub
>> (Amlogic Meson GXL platform is one example: there are two ports
>> enabled on dwc3's root-hub with 2x USB2 and 1x USB3 PHYs) - so this
>> patch uses a similar binding as we already have (to describe the
>> devices) to describe the root-hub
>>
>>
>> Regards,
>> Martin
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>


Regards,
Martin


[0] http://elixir.free-electrons.com/linux/v4.14-rc4/source/Documentation/devicetree/bindings/usb/usb-device.txt
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
