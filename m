From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 09/10] MCDE: Add build files and bus
Date: Wed, 1 Dec 2010 16:39:03 +0100
Message-ID: <201012011639.03904.arnd@arndb.de>
References: <F45880696056844FA6A73F415B568C6953604E802E@EXDCVYMBSTM006.EQ1STM.local>
	<20101130230533.GA11342@kroah.com>
	<20101130234215.GE8521@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101130234215.GE8521-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jimmy RUBIN <jimmy.rubin-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dan JOHANSSON <dan.johansson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marcus LORENTZON <marcus.xm.lorentzon-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 01 December 2010, Russell King - ARM Linux wrote:
> Right, so saying to ARM developers that they can't submit code which
> adds new static device structures is rather problematical then, and
> effectively brings a section of kernel development to a complete
> standstill - it means no support for additional ARM platforms until
> this issue is resolved.  (This "condition" was mentioned by Arnd
> earlier in this thread, and was put in such a way that it was now
> a hard and fast rule.)

At the embedded developer BoF in Cambridge,MA we discussed this
problem quite a bit, and my impression there was that it is a hard
rule indeed, so I said this to the best of my knowledge.

> I feel it would be better to allow the current situation to continue.
> If we start telling people that they can't use statically declared
> devices without first having an alternative, we'll end up with people
> inventing their own individual - and different - solutions to this
> problem, which could actually make the problem harder to resolve in
> the longer term.

Yes, that makes sense. We should probably start thinking about the
migration plan though. There does not seem to be a shortage of
alternatives for registering new platform devices already and once
we can get to agree on how we want it done, we can start mandating
that new drivers do it that way, while we phase out some of the
other ones.

Among the architectures that use platform devices extensively, the
various ways to register them I could find are:

* static platform_register_device:
  arm, avr32, frv, mips, m32r, sparc, sh and xtensa

* static platform_add_devices:
  arm, blackfin, m68knommu, mips, sh

* dynamic platform_device_register_simple:
  m68k, mips, powerpc, sh and x86

* dynamic platform_device_alloc/platform_device_add:
  arm, avr32, mips, powerpc, lots of drivers

* dynamic of_platform_bus_probe:
  powerpc, microblaze

* dynamic platform_device_register_resndata:
  not currently used

I was under the impression that platform_device_register_resndata is
the function that was actually meant to solve this, but there are
exactly zero users of this, except for the
platform_device_register_simple wrapper. The fact that it's currently
not used probably means either that nobody heard about it or that
the interface is lacking in some way and is actually useless for
replacing the static definitions.

	Arnd
