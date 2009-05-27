From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 22:19:51 +0200
Message-ID: <20090527201951.GF30039@game.jcrosoft.org>
References: <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
	<20090527193927.GD30039@game.jcrosoft.org>
	<fa686aa40905271322x2f62c3dcs355374b30b4db3ca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40905271322x2f62c3dcs355374b30b4db3ca-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> There are two issues that keep the of_platform and platform busses
> separate.  They aren't show stoppers, but they reflect the current
> state.
> 
> 1) Source of data: a platform_device carries a pdata structure with it
> to describe the hardware.  An of_device carries a device_node pointer.
>  Before dropping of_platform bus, a mechanism needs to be in place to
> add hooks for translating the device tree data into a pdata structure
> for each platform device.
> 
> 2) Driver binding mechanism:  device tree nodes usually have a
> "compatible" property which is a list of strings.  The first string
> describes exactly what the device is (ie. "atmel,24c08") and an
> optional list of other devices which it is register interface
> backwards compatible with.  The intent is that newer devices can claim
> compatibility with older ones so that existing device drivers will
> work without needing to be told the new device name.  However, it
> leaves the option when a device errata or something similar raises
> it's ugly head, a driver can still get information about the exact
> device name and apply the appropriate workarounds.  Driver probing
> should walk the list and give preference to higher priority compatible
> values.  of_platform bus does this, but I cannot think of a clean way
> to do the same thing with the platform bus.
> 
> One option that has been suggested (more than once) is to make the
> adapter code an of_platform_driver which translates the device tree
> data and then registers the appropriate platform_devices.  This neatly
> solves the problem, but I don't like the overhead involved in
> registering 2 struct devices with the kernel for every device node in
> the device tree.
but simplify the dev and maintaining is also an important goal.

Have to duplicated ressource handling via ifdef in every drivers is also an
overhead which need to be avoided

Best Regards,
J.
