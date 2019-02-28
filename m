From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [RFC][PATCH] dt-bindings: usb: add non-removable device property
Date: Thu, 28 Feb 2019 15:22:24 +0000
Message-ID: <yw1x8sy0uedr.fsf@mansr.com>
References: <20190228143344.16312-1-mans@mansr.com>
        <20190228151330.GA1360@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228151330.GA1360@kroah.com> (Greg Kroah-Hartman's message
        of "Thu, 28 Feb 2019 16:13:30 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Thu, Feb 28, 2019 at 02:33:44PM +0000, Mans Rullgard wrote:
>> Add a boolean property indicating that a device is hardwired to the
>> upstream port.  Although hubs can provide this information, they are not
>> always configured correctly.  An alternate means of indicating this for
>> built-in USB devices is thus useful.
>> 
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>> ---
>> I have a situation where userspace would like to know which USB devices
>> are built-in, but the on-board hub doesn't have the right setting.
>> Also, the hub itself can't be indicated as fixed in any other way that
>> I'm aware of.
>
> Then that's a firmware bug, right?  We have a way for firmware to export
> this to the USB core, why not use that?  Your on-board hub should get a
> firmware update with this information, let's not try to create
> yet-another-way to define this type of information please.

What firmware?  This is not an ACPI system, obviously, so DT _is_ the
firmware.

>> In a way, adding this property seems a bit silly since dt can only
>> sensibly be used for hardwired devices in the first place.  Thus the
>> mere presence of a dt node could be taken to indicate the same thing.
>> On the other hand, it's conceivable that someone might dynamically
>> generate a devicetree based on what happens to be connected on boot or
>> something.  For that reason, and explicit property seems safer.
>> ---
>>  Documentation/devicetree/bindings/usb/usb-device.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> Can you show some code actually using this?  Again, this should "just
> work" for USB today unless your platform is really broken (and if it is,
> go complain to the vendor...)

You know full well that complaining to the vendor is rarely something
that works.  Especially not when there are already thousands of the
devices in the field.

This is how I meant to use it:

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3adff4da2ee1..81ef3cb705b7 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2392,6 +2392,14 @@ static void set_usb_port_removable(struct usb_device *udev)
                break;
        }
 
+       /*
+        * Otherwise, check whether DT indicates this device is non-removable.
+        */
+       if (of_property_read_bool(udev->dev.of_node, "non-removable")) {
+               udev->removable = USB_DEVICE_FIXED;
+               return;
+       }
+
        /*
         * Otherwise, check whether the hub knows whether a port is removable
         * or not


-- 
Måns Rullgård
