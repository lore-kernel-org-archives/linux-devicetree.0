From: "Moffett, Kyle D" <Kyle.D.Moffett-X8CqP27nNzzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REPOST RFC PATCH 0/3] New "gpio-poweroff" driver to turn off
 platform devices with GPIOs
Date: Mon, 19 Dec 2011 19:53:06 -0600
Message-ID: <B187B965-8671-485E-9CAB-7CF3468D2ED6@boeing.com>
References: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
 <4EE7A31E.7080301@gmail.com>
 <895CF182-4BF7-4DF5-A467-944EC008DBC3@boeing.com>
 <20111214120240.GC25088@sirena.org.uk>
 <E30C4693-0D31-4A9A-9E9D-0FC03C5F6B8A@boeing.com>
 <20111217092044.GC2833@opensource.wolfsonmicro.com>
 <D482A908-020C-43E0-ADFC-33AE213D7257@boeing.com>
 <20111220013819.GV2860@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111220013819.GV2860-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Dec 19, 2011, at 20:38, Mark Brown wrote:
> On Mon, Dec 19, 2011 at 10:56:41AM -0600, Moffett, Kyle D wrote:
>> I still don't understand how the regulator API is supposed to help in my
>> particular case (whole-system poweroff).
> 
> Well, it depends what you need to do.  In the ST-Ericsson case what they
> needed to do was collapse the core supplies for the CPU.  But previously
> you were talking about power domains, not whole system poweroff.
> Usually a power domain is a subset of the full system power.

Well, I have control of 3 separate power domains in the sense that
there are 6 physically separate computers sharing a single supply,
with 2 in each domain (and only 1 of the 6 controlling the shared
supply).

Obviously when the 'control computer' goes off the GPIOs will
fluctuate wildly, so the power supply only responds to the GPIOs as
a signal to cut power, not to re-enable it.  The system is designed
to require user intervention to resupply power after it has shut
itself down.

So I do have separate power domains, but in this particular
hardware build I simply want to shut them all down in a fixed order
(due to the specific arrangement of power supply connections).

Previously I had about 200 lines of code in my machine_poweroff
hook to walk a list of GPIOs in the device tree and turn them all
off in a fixed order.  After looking at that a while I decided it
would be better off as a pseudo-generic driver that could be used
by any DT platform with a GPIO used to shut down system power.

I ended up with the "gpio-poweroff" driver which also makes the
time delays configurable.

Since I noticed that platform_drv also has a device-specific
poweroff hook, I added a boolean DT value to switch between
powering down at machine_poweroff() time and powering down during
the device->poweroff() walk.

I realize that this driver is basically incapable of any kind of
runtime power management but it could be used on X86 platforms
that convert to device-tree.  In particular ones with embedded
controllers and BMC devices would otherwise be using ACPI device
methods to poke a few GPIOs in basically the same fashion.

The benefit is that instead of ACPI AML (bytecode poking magic
IO registers at some undocumented address) you have a standard
GPIO driver and a piece of pseudo-self-documenting device-tree
that basically says "the HW engineers set it up so you set these
GPIOs in that order and it turns off".

Make sense?

Cheers,
Kyle Moffett

--
Curious about my work on the Debian powerpcspe port?
I'm keeping a blog here: http://pureperl.blogspot.com/
