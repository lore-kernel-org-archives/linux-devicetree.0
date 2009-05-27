From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 18:56:09 +0100
Message-ID: <20090527175609.GB31861@flint.arm.linux.org.uk>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4A1D6901.2090508@freescale.com>
List-Unsubscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.arm.linux.org.uk/lurker/list/linux-arm-kernel.html>
List-Post: <mailto:linux-arm-kernel@lists.arm.linux.org.uk>
List-Help: <mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=help>
List-Subscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.arm.linux.org.uk
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk
To: Scott Wood <scottwood@freescale.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>, Robert Schwebel <r.schwebel@pengutronix.de>, devicetree-discuss <devicetree-discuss@ozlabs.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, Janboe Ye <yuan-bo.ye@motorola.com>, Timur Tabi <timur@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 11:23:29AM -0500, Scott Wood wrote:
> That removes the ability to use the device tree to pass information from  
> the bootloader, such as MAC addresses and clock frequencies.  On the  
> u-boot list, you'll find people trying such hacks (which were rightly  
> NACKed) as passing the information in the device's volatile registers  
> (which the Linux driver must then not reset) to deal with ARM Linux's  
> lack of this ability.

No one has brought that up on the ARM mailing lists - so does this issue
really exist?  All of the stuff I see on the ARM lists seems to be well
behaved and following our existing model - even vendor stuff (supplied
to me under NDA) seems to generally get this kind of stuff right.

Basically, what I'm saying is that I have seen no evidence to support
the argument you're making, but I'm not saying you're wrong or that it
doesn't happen.

>>  Robert> - The oftree layering is fundamentally broken. We already
>>  Robert> have a sane abstraction for arbitrary hardware in the kernel:
>>  Robert> platform devices.  Why not instanciate platform devices from
>>  Robert> a generic oftree core?
>
> You can, if you want.  But you'll need extra glue code that understands  
> the individual bindings.  IMHO that logic is usually better off in the  
> driver itself, but if you really need platform code to involve itself in  
> some way (such as providing callbacks), then exceptions can be made.

No it is not.  Device drivers are best written to support devices, and
the platform specific code should not be anywhere near them.  Platform
specific code to handle oddities of platforms should be totally separate
from the device driver itself.

For example, see the mess that is cs89x0, which isn't a platform driver
(or any kind of driver model driver).  It's full of individual platform
specific hacks to make it work on platforms X, Y and Z.  The same was
true of the smc91x driver (which is a platform driver but wasn't done
in a generic way.)  smc91x was very quickly becoming a big problem to
maintain and use because of all the platform specific junk being shoe-
horned into the driver.  smc91x eventually got fixed.  cs89x0 hasn't.

smc91x is a prime example of the kind of information drivers need - base
address and irq are very much insufficient to describe how this device is
connected.  There's much more information required to specify this device
fully, and throwing it into the driver doesn't work.  We've been there
and proven that point.

So, repeat this mantra: device drivers should contain no platform specifics.
Platform specifics should be separated from the driver and implemented by
platform support code.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:

-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
