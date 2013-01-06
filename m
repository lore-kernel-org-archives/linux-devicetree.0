From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: machine_is_dt() ?
Date: Sun, 6 Jan 2013 13:41:13 +0000
Message-ID: <20130106134113.GD2631@n2100.arm.linux.org.uk>
References: <20130106131805.GQ17242@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130106131805.GQ17242-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 06, 2013 at 02:18:05PM +0100, Andrew Lunn wrote:
> I'm moving the cpuidle code for Kirkwood into drivers/cpuidle. I'm
> following the way cpuidle-calxeda.c instantiates the driver, it uses
> module_init(calxeda_cpuidle_init) and calxeda_cpuidle_init() uses
> of_machine_is_compatible("calxeda,highbank") so only loading the
> driver in a ARCH_MULTIPLATFORM kernel when needed.
> 
> I can follow this model for when kirkwood is booted using device
> tree. However, i would also like to use the driver for those boards
> which are not yet converted to DT. In that situation, we have a kernel
> dedicate to kirkwood and the cpuidle driver is always relevant.
> 
> Thus i need to code something like:
> 
> (of_machine_is_compatible("marvell, kirkwood") ||
>  !machine_is_dt())
> 
> However, there is no macro machine_is_dt().
> 
> Is there a way to tell if a machine has been booted using a machine
> number as opposed to DT?

This doesn't seem to me to be the right way to deal with this.  What
you're suggesting would mean that if you built a multiplatform kernel
which included this driver, and booted it on a non-DT platform, you'd
have this driver registered.

It looks to me like many of the CPUFREQ drivers just register themselves
if they've been built into the kernel.  No one's thought about making
them platform drivers or similar, so the current "if it's built-in, then
we use it" approach seems to have persisted.  As many of them are
initialized via a late_initcall(), I don't see any problem with them
being platform drivers, which will solve the problem in a way that's
well established.
