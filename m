From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: rfkill guidance
Date: Wed, 28 Sep 2016 19:33:05 +0200
Message-ID: <A8F63484-5A61-45B2-B1FD-493CBD36506D@holtmann.org>
References: <324c35c6-49ca-174c-db07-674532f3e628@broadcom.com>
 <1474961105.5141.5.camel@sipsolutions.net>
 <0a8cff88-73aa-8311-7afe-98612161421f@broadcom.com>
 <1475044682.4139.18.camel@sipsolutions.net>
 <1475045391.4139.26.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 10.0 \(3226\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475045391.4139.26.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Johannes,

>> Today we already have all the platform rfkill instances (like the
>> various ACPI ones) that don't live off a device that they control,
>> but instead control the platform's radio functionality. And in some
>> cases, that actually has very similar behaviour to what was proposed
>> in the previous patch, and what you're looking for, in that it
>> sometimes kills power to BT or WiFi chips when soft-disabled (or
>> kicks them off the bus in some other way).
> 
> Actually, let me retract that a bit. Obviously they *do* control a
> device or radio, but we don't actually know which one. And that can
> actually become a problem, since we don't even know how they work etc.
> 
> So IOW, even with the ACPI stuff, there's no real "platform rfkill"
> concept - it's always killing a specific radio.
> 
> There used to be some rfkill that was just reflecting the button state,
> but I think we got rid of that in favour of reflecting button state
> through hid/input, if it doesn't also control a radio.
> 
> So, actually, the more I think about it the more I agree with Mark's
> objection. It doesn't really make sense to have a concept of an rfkill
> and not know what radio it controls.
> 
> In your particular case, Jon, it's complicated by the fact that you
> don't want to bind a kernel driver with the rfkill, not sure where
> you'd get a device to tie the rfkill to then.

we are actually taking away the RFKILL switches that are represented by specific GPIOs. We are mapping these into the Bluetooth driver itself. This has been done for Intel and Broadcom UART based Bluetooth chips. The power control is done via the Bluetooth subsystem and that is how it should be. Enumeration of these GPIOs is done from ACPI or eventually DT (which has not made it upstream yet).

In addition, we do not want this crazy Android side of things with custom vendor specific power control via userspace or whatever crazy is done there. It can be all done through the Bluetooth subsystem and still use Android on top of it. There is a concept called HCI User Channel that allows user space application to gain exclusive access to the HCI transport. It has the advantage that the kernel does all the driver integration and handles power control.

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
