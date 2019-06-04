From: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: A potential broken at platform driver?
Date: Tue, 4 Jun 2019 12:33:03 +0200
Message-ID: <20190604103241.GA4097@5WDYG62>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
 <20190528232224.GA29225@kroah.com>
 <1e3b5447-b776-f929-bca6-306f90ac0856@linux.intel.com>
 <b608d657-9d8c-9307-9290-2f6b052a71a9@linux.intel.com>
 <20190603180255.GA18054@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603180255.GA18054@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Richard Gong <richard.gong@linux.intel.com>, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2019 at 08:02:55PM +0200, Greg KH wrote:
> > @@ -394,7 +432,7 @@ static struct platform_driver stratix10_rsu_driver = {
> >  	.remove = stratix10_rsu_remove,
> >  	.driver = {
> >  		.name = "stratix10-rsu",
> > -		.groups = rsu_groups,
> > +//		.groups = rsu_groups,
> 
> Are you sure this is the correct pointer?  I think that might be
> pointing to the driver's attributes, not the device's attributes.
> 
> If platform drivers do not have a way to register groups properly, then
> that really needs to be fixed, as trying to register it by yourself as
> you are doing, is ripe for racing with userspace.
 
This is a very common issue with platform drivers, and it seems to me that
it is not possible to add device attributes when binding a device to a
driver without entering the race condition.

My understanding is the following one:

The root cause is that the device has already been created and reported
to the userspace with a KOBJ_ADD uevent before the device and the driver
are bound together. On receiving this event, userspace will react, and
it will try to read the device's attributes. In parallel the kernel will
try to find a matching driver. If a driver is found, the kernel will
call the probe function from the driver with the device as a parameter,
and if successful a KOBJ_BIND uevent will be sent to userspace, but this
is a recent addition.

Unfortunately, not all created devices will be bound to a driver, and the
existing udev code relies on KOBJ_ADD uevents rather than KOBJ_BIND uevents.
If new per-device attributes have been added to the device during the
binding stage userspace may or may not see them, depending on when userspace
tries to read the device's attributes.

I have this possible workaround, but I do not know if it is a good solution:

When binding the device and the driver together, create a new device as a
child to the current device, and fill its "groups" member to point to the
per-device attributes' group. As the device will be created with all the
attributes, it will not be affected by the race issues. The functions
handling the attributes will need to be modified to use the parents of their
"device" parameter, instead of the device itself. Additionnaly, the sysfs
location of the attributes will be different, as the child device will show
up in the sysfs path. But for a newly introduced device this will not be
a problem.

Is this a good compromise ?

Best regards,
-- 
Romain Izard
