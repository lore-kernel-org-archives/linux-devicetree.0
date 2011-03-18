From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 21:06:13 +0100
Message-ID: <201103182106.13888.arnd@arndb.de>
References: <20110311165642.GA9996@kroah.com> <201103181600.09877.arnd@arndb.de> <4D839BCD.6030202@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D839BCD.6030202-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 March 2011 18:52:13 Andy Green wrote:
> On 03/18/2011 03:00 PM, Somebody in the thread at some point said:
> 
> >> You changed your first opinion about tagging "dynamically probed
> >> devices" with what is effectively platform_data, cool.
> >
> > I still don't like the idea of attaching platform_data to more
> > devices, when we try to move people away from that in other
> > parts of the kernel, because of the known deficiencies.
> 
> Whatever way you look at it, data delivered into the driver by Device 
> Tree is fundamentally the same action as delivering data into the driver 
> by platform_data.  Yes, you query by named element with device context, 
> but you end up with the same answer as if you dereference a 
> platform_data member.

Yes. Both approaches are essentially hacks to deal with the
deficiencies of hardware probing in existing systems.

In a perfect world, we would need neither the device tree nor
any platform data at all, because we'd be able to ask the hardware
or the fictionary correct firmware about what the properties
of the hardware are. This works to a surprisingly large extent
on server hardware, but much less so on typical embedded systems.

> There are no "known deficiencies" to 
> platform_data for this action either, at least, not known to me, I don't 
> think lack of typechecking on the pointer itself is an issue given the 
> accuracy it can be targeted to a soldered-on-the-board device.

The main deficiency of platform_data is that it's very inflexible,
you have to write code for each new board you want to support,
something that we've generally moved away from in Linux a decade
ago.

Another problem is that you need to hardcode data structures,
which is arguably less flexible than key/value pairs.

> > Passing a MAC address in a device tree property is a
> > well-established method that is used on many drivers, and
> > is portable across operating systems and architectures.
> 
> If you're talking about Device Tree, that itself is not at all "well 
> established" let alone servicing drivers from it.  Like I say I don't 
> want to seem like I am down on it, but it is very new indeed let's face 
> it and few drivers are using it for functional configuration information 
> compared to vast numbers using platform_data.

I mean specifically passing MAC addresses using the device tree.

$ git grep -l "local-mac-address" | wc -l
142

That is 142 unique files in the kernel referencing this (mostly
powerpc, but also some others), both device drivers and dts files,
plus a handful of drivers that use the nonstandard "mac-address"
property instead of "local-mac-address".

> =====> If Device Tree APIs is mandated to implement functionality fixes 
> to drivers and platform_data is blocked for this, then we end up with 
> different, rotting functionality for platform_data basis and drivers 
> that remain broken on the many, many, platforms that don't have and will 
> never have Device Tree.  That does NOT sound like the right approach.

See the device tree fragment patches that Grant just posted.
It should become really easy to combine both methods, or to
gradually migrate without breaking anything.

> I guess the grand plan is to eliminate platform_data by overwhelming it 
> with Device Tree refactoring.  But each driver has to be tested and each 
> board definition file changed... that is a huge, huge undertaking that 
> will not happen in any kind of medium and perhaps not long term either.
> 
> So they will have to coexist for a very long while.  A policy of denying 
> fixes to platform_data users by enforcing introduction of Device Tree 
> APIs and making platform_data users out as troglodytes does not sound 
> workable.

No, that is not the plan. The platform data is well-established
for deeply embedded systems (blackfin, arm-nommu, mips32, ...) where you
never want to build a kernel for multiple boards anyway. We also
have ways to generate platform_data from the device tree properties
to allow the same driver to be used by systems with or without
full device trees, and we have the fragments I mentioned that work
in the opposite way.

No need to be so negative here, there is no fundamental problem.

The only point I'm trying to get across is that the general move
is away from hardcoding settings in device drivers and per-board
platform_data towards probing stuff properly where possible, and
using device_node properties is the preferred method for new
code where that is not possible.

The USB layer is not architecture specific, so when we add hacks
to it for dealing with nondiscoverable hardware properties, we
should use methods that are accepted everywhere, which platform
data is not.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
