From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 14:53:02 -0500
Message-ID: <4A1D9A1E.80603@freescale.com>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527192909.GA32398-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Russell King wrote:
> On Wed, May 27, 2009 at 02:08:42PM -0500, Scott Wood wrote:
>> Russell King wrote:
>>> No one has brought that up on the ARM mailing lists - so does this issue
>>> really exist?  All of the stuff I see on the ARM lists seems to be well
>>> behaved and following our existing model - even vendor stuff (supplied
>>> to me under NDA) seems to generally get this kind of stuff right.
>> I'm just going by what I've seen on the u-boot list lately.  What is the  
>> existing ARM Linux model for passing MAC addresses, so that we can point  
>> people to that when they try to get u-boot to do silly things?
> 
> To program them into the hardware registers, 

Isn't that adding a requirement to the boot firmware?  I thought you 
didn't like that? :-)

The patches that were proposed (and NACKed) in u-boot did exactly this 
-- except supposedly they would only set the MAC address if the 
interface were actually used prior to booting the kernel.

> which is not what we in the ARM community say, but it's what the
> _network_ guys tell people they should be doing.

They don't seem to be NACKing drivers that get it from the device tree 
instead.

> I've suggested in the past having a standard kernel parameter such
> that you can specify a mac address on a per-device basis in a totally
> platform independent way, but the network folk don't like that idea.

How do you reliably associate MAC addresses with specific devices that 
way?  The device tree can do this.

Think of the device tree as a really expressive kernel command line 
argument. :-)

>> I'm not talking about platform specific code, I'm talking about code to  
>> retrieve information about a device from the device tree.  There would  
>> not be separate instances of this for "platforms X, Y and Z", just one  
>> of_platform binding in each driver.  It's no different than having a  
>> platform bus binding, except in the data structures used.
> 
> I really don't see what OF buys us then,

The data is in a key/value format rather than a C struct, which makes it 
easier to pass from entities outside the kernel *if you want to*.

It is this distinction that led to the platfom/of_platform split -- we 
can't turn key/value into C structs without glue code that knows the 
specific device binding, and it's easier for the driver to access that 
data directly.

>> The device tree is quite capable of expressing information beyond  
>> addresses and interrupts.
> 
> Bus width?  Register offset spacing?  SMC LED configuration?  Whether
> to use the hardware wait signal from the SMC?
> 
> If you're going to say yes to all that,

Sure, you can add properties for that stuff.

> I'm going to start asking how
> you cope with verifying that the data for ethernet driver A doesn't
> get accidentally used for ethernet driver B.

Device nodes have "compatible" properties indicating what the hardware 
is compatible with.  A given driver only binds to nodes for hardware 
that is compatible with what it knows how to drive.

> I assume you have some kind of compiler, which needs a set of specification
> files to tell it what's required for each driver which is OF compatible.

Yes, there's a device tree compiler.  It doesn't know the details of 
individual device bindings, which is a little less safe than C structs, 
but not much.  There's nothing in theory preventing the compiler from 
being given this knowledge, and doing checks beyond what the C compiler 
can do.

> If not, I can see no way for OF trees to ever be safe and correct.

Code reviews and testing, same as how you get C code to be correct.

-Scott
