From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [sodaville] [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Thu, 2 Dec 2010 11:40:16 +1100
Message-ID: <20101202004016.GF3189@yookeroo>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>
	<1290808645.32570.158.camel@pasglop>
	<20101128160449.GC30784@www.tglx.de>
	<1290984809.32570.208.camel@pasglop>
	<4CF30327.9020408@firmworks.com> <4CF402AD.2060000@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CF402AD.2060000-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 29, 2010 at 08:44:45PM +0100, Sebastian Andrzej Siewior wrote:
> Mitch Bradley wrote:
> >On 11/28/2010 12:53 PM, Benjamin Herrenschmidt wrote:
> >>>I wasn't aware of the OFW binding for X86. I will follow it once I find
> >>>it.
> >>Interesting, I though I would find it on
> >>http://www.openfirmware.info/Bindings but it's not there...
> >>CC'ing Mitch who might know where to find that.
> >
> >I'd be happy to work with people to develop a new x86 binding.
> 
> So for the CPU node I have so far:
> 
>         cpus {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> 
>                  cpu@0 {
>                          device_type = "cpu";
> 			 compatible = "Intel,CE4100";
>                          reg = <0>;
>                          lapic = <&lapic0>;
>                  };
>          };
> 
> This one should match ePARP 1.0. David mentioned threads. I have just one.
> No HyperThreading, nothing special. Should I just leave it as it or go
> for:
>         cpus {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> 
>                  cpu@0 {
>                          device_type = "cpu";
> 			 compatible = "Intel,CE4100";	
> 			 reg = <0>;
>                	         lapic = <&lapic0>;
> 
> 			thread@0 {
>         	                 reg = <0>;
>                  	};
> 		};
>          };
> ?

Leave it as is.  For hyperthreading there's a good chance you'll be
able to get away with the simple extension we're planning to use in
ePAPR 1.1, which would be:
	cpu@0 {
		...
		reg = <0 1 2 3>;
		...
	};

For, e.g. a cpu with 4 threads.

If more detailed per-thread information is needed then we or you might
want sub-nodes one day.  But even if we do that, we should allow them
to be omitted in the single-thread case.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
