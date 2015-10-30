From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v12 2/6] fpga: add bindings document for simple fpga bus
Date: Fri, 30 Oct 2015 12:58:31 -0500
Message-ID: <CAL_JsqJURc=pQ-_ix_A79T9wU22pm-OQddP_BBkU_JsFK8iuCg@mail.gmail.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
 <1445983755-24007-3-git-send-email-atull@opensource.altera.com>
 <CAL_JsqK2twfWzCKucuSLrsD2rL3=ReUXt3uPdFcsf8B0Tg42Lg@mail.gmail.com> <alpine.DEB.2.02.1510291026020.17743@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1510291026020.17743@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 11:02 AM, atull <atull@opensource.altera.com> wrote:
> On Wed, 28 Oct 2015, Rob Herring wrote:
>
>> On Tue, Oct 27, 2015 at 5:09 PM,  <atull@opensource.altera.com> wrote:
>> > From: Alan Tull <atull@opensource.altera.com>
>> >
>> > New bindings document for simple fpga bus.
>> >
>> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
>> > ---
>> > v9:  initial version added to this patchset
>> > v10: s/fpga/FPGA/g
>> >      replace DT overlay example with slightly more complicated example
>> >      move to staging/simple-fpga-bus
>> > v11: No change in this patch for v11 of the patch set
>> > v12: Moved out of staging.
>> >      Changed to use FPGA bridges framework instead of resets
>> >      for bridges.
>> > ---
>> >  .../devicetree/bindings/fpga/simple-fpga-bus.txt   |   81 ++++++++++++++++++++
>> >  1 file changed, 81 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
>> > new file mode 100644
>> > index 0000000..2e742f7
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/fpga/simple-fpga-bus.txt
>> > @@ -0,0 +1,81 @@
>> > +Simple FPGA Bus
>> > +===============
>> > +
>> > +A Simple FPGA Bus is a bus that handles configuring an FPGA and its bridges
>> > +before populating the devices below its node.  All this happens when a device
>> > +tree overlay is added to the live tree.  This document describes that device
>> > +tree overlay.
>> > +
>> > +Required properties:
>> > +- compatible : should contain "simple-fpga-bus"
>> > +- #address-cells, #size-cells, ranges: must be present to handle address space
>> > +  mapping for children.
>> > +
>> > +Optional properties:
>> > +- fpga-mgr : should contain a phandle to a FPGA manager.
>> > +- fpga-firmware : should contain the name of a FPGA image file located on the
>> > +  firmware search path.
>>
>> Putting firmware filename in DT has come up in other cases recently[1]
>> and we concluded it should not be in the DT. Maybe the conclusion
>> would be different here, and if so we should have a common property
>> here.
>
> Interesting discussion.
>
> One FPGA image will almost always have multiple hardware devices in it.
> The device blocks will be reused in various combinations in different
> FPGA images.  So hardwiring the image name in some specific driver won't
> be possible.  Also many of the devices that could appear on a FPGA also
> could appear in normal hardware.  Same driver for both cases, just
> different address.
>
> I won't have control of the name of the firmware file.  It will be something
> that makes sense to a FPGA hardware guy so translating the node name to an
> image name would be brittle.
>
> Renaming this as a generic property "firmware-name" or "firmware" would be
> an improvement on what I proposed.
>
> If it is acceptible to have this in the DT, it means FPGA hardware development
> workflow does not require a kernel rebuild.  The DT can collect together the
> image name, the bridges to the FPGA (or to that area of the FPGA), and a list
> of the devices/drivers in that image.

You can deal with this purely in userspace. The firmware userspace
helper can load any file you like. If the name is frequently changing,
then I agree it should not be in the kernel. But neither should it be
in the base DT. However, this would be in the overlay DT? In that use,
I think having the firmware name in DT is fine. The other option is
just put the firmware itself into the DT overlay (u-boot FIT images
are actually DTs with binary blobs). Either way please just create and
use a generic binding here.

>> > +- partial-reconfig : boolean property should be defined if partial
>> > +  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
>> > +  is done.
>> > +- fpga-bridges : should contain a list of bridges that the bus will disable
>> > +  before   programming the FPGA and then enable after the FPGA has been
>> > +
>> > +Example:
>> > +
>> > +/dts-v1/;
>> > +/plugin/;
>> > +/ {
>> > +       fragment@0 {
>> > +               target-path="/soc";
>> > +               __overlay__ {
>> > +                       #address-cells = <1>;
>> > +                       #size-cells = <1>;
>> > +
>> > +                       bridge@0xff200000 {
>> > +                               compatible = "simple-fpga-bus";
>> > +                               reg = <0xc0000000 0x20000000>,
>> > +                                     <0xff200000 0x00200000>;
>>
>> You have registers for the bus, so therefore it is not simple. I think
>> the bus or bridge needs a specific compatible
>>
>
> The reg here is cruft from device tree generation.  I don't use it and will
> clean it out.  After I've done that, does that become simple again?
>
> What I need in a bus is:
>  - Handles 'ranges'
>  - Controls enabling/disabling bridges and programs the FPGA

Where are these controls?

>  - Populates the child devices (and there will probably be many)

simple-bus handles at least the 1st and 3rd item. I suppose you don't
want the bus to probe before the bridge driver. If you want the bridge
driver to control that, you don't actually need a bus name.
of_platform_populate() will create all child devices. It is only if
you want to create the grandchildren that you need a bus match on the
child nodes.


> This raises another issue: each area of the FPGA is likely to have multiple
> bridges. That's why I had a list of phandles to bridges rather than
> different bus for each type of bridge.  Is that acceptible-ish?

Hard to say. A bridge tends to mean a parent bus to child bus
translator and the DT hierarchy generally follows the bus hierarchy,
so really it is better if DT follows the physical bus structure. Of
course, we really only do that with outbound bus and not the inbound
side.

I also worry that all this looks like it may be somewhat Altera specific.

Rob
