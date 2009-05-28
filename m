From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 13:02:33 +1000
Message-ID: <20090528030233.GD1464@yookeroo.seuss>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090527150527.GK6805-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 05:05:27PM +0200, Robert Schwebel wrote:
> On Wed, May 27, 2009 at 09:39:30AM -0500, Timur Tabi wrote:
[snip]
> - The whole concept is based on the assumption that bindings are defined
>   *once*, then never to be changed again. As this is not true (check
>   MPC5200 to find out what I mean), oftree wreckage is *the* main cause
>   of new kernels not working on old bootloaders any more. Is there a
>   solution of this problem? I have not seen a good idea how to avoid the
>   constant change in definitions.

That's true in the ideal, but doesn't break down completely in
reality.  Sure, you want to *aim* for a binding which never needs
updating, but in practice of course, you do need to change it.  When
you do, you end up with backwards compatibility code in the kernel or
the firmware or both to handle both "old" and "new" variants of the
device tree.  It's not perfect, but it still results in substantially
*less* accumulated cruft than we had before.

> - The oftree layering is fundamentally broken. We already have a sane
>   abstraction for arbitrary hardware in the kernel: platform devices.
>   Why not instanciate platform devices from a generic oftree core?

You're conflating the concept of the device tree structure with the
way we instantiate of_platform devices.  As Grant says, the actual
passed in device tree is just a data structure.

You're correct that the layering for the handling of the of_platform
bus and of_platform devices is fundmentally broken, although in
practice it works a lot less badly than it does in theory.  I've been
meaning to get around to replacing this with a saner structure (using
a table of constructor functions to instantiate platform devices or
others from the device tree information), but haven't had time yet.

> - Platform data makes it possible to store function pointers. There
>   is no equivalent to this concept in oftree-land.
> 
> oftree could be a great tool if these things would be resolved.
> Currently they are not, and in result, ARM just works and is easy,
> whereas on PowerPC systems people often spend more time working on
> binding stuff than on the actual functionality.

I think that was true in the early days when everyone was getting the
hang of the device tree.  It's becoming less and less true.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
