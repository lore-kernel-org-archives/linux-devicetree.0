From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Tue, 17 Oct 2017 23:02:43 +0200
Message-ID: <CAFBinCAaEpXbYWkKwGohzUCZJ2cbfZJQCsEwzy+vYAK1t1U=aA@mail.gmail.com>
References: <CAFBinCBwzzzj-ew-VTb9zojfzC9gedHd0uu0ez4WejBRTpnsWg@mail.gmail.com>
 <Pine.LNX.4.44L0.1710131008390.1364-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1710131008390.1364-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Fri, Oct 13, 2017 at 4:15 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
> On Thu, 12 Oct 2017, Martin Blumenstingl wrote:
>
>> Hi Alan,
>>
>> On Thu, Oct 12, 2017 at 11:17 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
>> > On Thu, 12 Oct 2017, Martin Blumenstingl wrote:
>> >
>> >> I haven't tested the described use-case. however, this patch is not
>> >> supposed to change the binding for actual devices.
>> >> USB device numbering starts at 1, while 0 is reserved for the root-hub
>> >> (at least from what I know).
>> >
>> > Actually 1 is reserved for the root hub.  External devices are numbered
>> > starting from 2.  (We can't use 0 for the root hub because, as you
>> > said, USB device numbering starts at 1!)
>> I just had a look at lsusb again:
>> $ lsusb -t
>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
>>
>> however, for the devicetree bindings the devices are supposed to use 1-31: [0]
>>
>> Alan: just to make sure I understood you correctly: do you agree with
>> this patch?
>
> I have no idea.  I haven't read the patch and I'm not familiar with the
> details of DeviceTree.  I was just trying to clear up your
> misunderstanding of USB device numbering.
thank you for clarifying this.
I tested it and the devicetree numbering is "off by one" compared to
the lsusb output - this however has nothing to do with my patch.
so my previous statements that basically said "0 is used for the
roothub" should be "0 is used for the roothub in .dts/.dtsi files"


Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
