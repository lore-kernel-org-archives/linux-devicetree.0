From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: doc: udc-xilinx: Add devicetree bindings
Date: Mon, 7 Jul 2014 11:55:15 +0530
Message-ID: <CALHRZupsas7=7NB8PHUub7nB3_Z++yJO0z9RYTU49tx87vSApA@mail.gmail.com>
References: <b0dfcba4-7319-4687-a455-bfcddf61b7d1@BN1AFFO11FD028.protection.gbl>
	<CALHRZup3_eFiw8iSJJmxy0dHDeHLnb2fAfRtKPTW1UQ2U+cEig@mail.gmail.com>
	<20140704164028.GC7106@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140704164028.GC7106@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jul 4, 2014 at 10:10 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Jun 24, 2014 at 07:44:10AM +0100, sundeep subbaraya wrote:
>> Ping
>>
>> Thanks,
>> Sundeep.B.S.
>>
>> On Tue, Jun 10, 2014 at 5:34 PM,  <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> > From: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> >
>> > Add devicetree bindings for Xilinx axi udc driver.
>> >
>> > Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> > ---
>> > Changes for v3:
>> >         - None
>> > Changes for v2:
>> >         - replaced xlnx,include-dma with xlnx,has-builtin-dma
>> >
>> >  .../devicetree/bindings/usb/udc-xilinx.txt         |   20 ++++++++++++++++++++
>> >  1 files changed, 20 insertions(+), 0 deletions(-)
>> >  create mode 100644 Documentation/devicetree/bindings/usb/udc-xilinx.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
>> > new file mode 100644
>> > index 0000000..7c24fac
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
>> > @@ -0,0 +1,20 @@
>> > +Xilinx AXI USB2 device controller
>> > +
>> > +Required properties:
>> > +- compatible           : Should be "xlnx,axi-usb2-device-4.00.a"
>
> That's an interesting name. What's the product name? Is the a manual?

Here is the manual for the IP :

http://www.xilinx.com/support/documentation/ip_documentation/axi_usb2_device/v5_0/pg137-axi-usb2-device.pdf

This driver works with PLB IP version that's why maybe make more sense
to use skip axi from compatible string and use just
xlnx,usb2-device-4.00.a.

>
>> > +- reg                  : Physical base address and size of the Axi USB2
>> > +                         device registers map.
>> > +- interrupts           : Property with a value describing the interrupt
>> > +                         number.
>
> Describe what this logically is. Everyone knows that this is a property
> with a value, and everyone knows that an interrupts property describes
> interrupts.
>
> The ket point is _which_ interrupts this describes.

Ok

>
>> > +- interrupt-parent     : Must be core interrupt controller
>
> This isn't strictly necessary anyway.
>
>> > +- xlnx,include-dma     : if DMA is included
>
> You appear to have forgotten to fix this name, judging by the changelog
> and example.
>
>> > +
>> > +Example:
>> > +               axi-usb2-device@42e00000 {
>> > +                        compatible = "xlnx,axi-usb2-device-4.00.a";
>> > +                        interrupt-parent = <0x1>;
>
> Huh? Who writes a raw phandle value?
>
>> > +                        interrupts = <0x0 0x39 0x1>;
>> > +                        reg = <0x42e00000 0x10000>;
>> > +                        xlnx,has-builtin-dma;
>
> As mentioned above, this conflicts with the binding documentation.
> Please ensure the example is aligned with the documentation.

Thank you for pointing this i sent an old one, will fix this.

Sundeep.B.S.

>
> Thanks,
> Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
