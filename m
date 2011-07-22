From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Same parts of DT being probed twice
Date: Fri, 22 Jul 2011 11:35:22 -0600
Message-ID: <20110722173522.GA5974@ponder.secretlab.ca>
References: <CAGq3pz5V0psn1QgUV7VGKCusc4kO+128OQAzUfmqSec4i2R8vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGq3pz5V0psn1QgUV7VGKCusc4kO+128OQAzUfmqSec4i2R8vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2011 at 03:46:02PM +0100, Daniel Drake wrote:
> Hi,
> 
> We're working on enabling the HDD LED on the XO-1.5 laptop using
> gpio-leds and its automatic interaction with the device tree. I have
> it working locally, but there is something not quite right.
> 
> We have modified the device tree to add /pci/isa/gpios
> 
> gpios then has a child "gpio-leds" which has a child "hdd" as
> described in Documentation/devicetree/bindings/gpio/gpio-leds.txt
> 
> This means that we must extend the "matches" list passed to
> of_platform_bus_probe() in arch/x86/platform/olpc/olpc_dt.c so that
> the search goes deep enough into the tree to find the gpio-leds
> element and create a device for it. Specifically we must add:
> 
> 	{ .compatible = "pci" },
> 	{ .compatible = "isa" },
> 	{ .compatible = "via,vx855-gpio" },
> 	{ .compatible = "gpio-leds" },
> 
> This works, but it causes huge duplication of the whole pci and isa
> trees in /sys/devices. These devices were already created because
> arch/x86/kernel/devicetree.c unconditionally calls
> of_platform_bus_probe() for pci and isa devices (see add_bus_probe()
> and ce4100_ids), but not for vx855-gpio and gpio-leds.

of_platform_bus_probe() from the root of the tree is the wrong
approach for registering 'deep' devices.  of_platform_bus_probe() only
knows how to deal with platform_devices.  The moment something
non-trivial appears in between, it no longer works.  What you really
want from the description you've given is the following struct device
hierarchy:

platform_device(representing the pci bus)
   --->pci_dev(representing the isa bridge)
      --->isa_device(representing the "via,vx855-gpio")

To make this work, of_platform_bus_probe() creates the pci bus
instance.  The pci bus /driver/ is responsible for creating the isa
bridge, and similarly the isa driver must be responsible for creating
the gpio controller instance.  Most of the pci support code that you
need should already be there, but I haven't looked at what ISA is
doing.

The gpio-leds node should be at the root of the tree, and everything
gets a lot easier if you switch to using the new of_platform_populate()
instead of of_platform_bus_probe().

g.


> 
> Whats the best way to solve this?
> 
> Thanks,
> Daniel
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
