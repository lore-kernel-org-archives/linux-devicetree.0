From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Mon, 29 Nov 2010 13:22:08 +1100
Message-ID: <20101129022208.GA3727@yookeroo>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>
	<1290808645.32570.158.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1290808645.32570.158.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 27, 2010 at 08:57:25AM +1100, Benjamin Herrenschmidt wrote:
> 
> > + */
> > +/dts-v1/;
> > +/ {
> > +	model = "x86,CE4100";
> > +	compatible = "x86,CE4100";
> 
> Use a vendor name rather than "x86" here.
> 
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	cpus {
> > +		x86,Atom@0 {
> 
> "Atom" would benefit from being more precise, like adding the model
> number. Also you want some properties there defining maybe the mask, the
> cache characteristics, etc... There's an exising OFW binding for x86, I
> suppose you could follow it. A "reg" property at least is mandatory
> here.

In the PowerPC flat-tree world, the newly established convention is to
extend the generic names convention to cpu nodes, so we name the nodes
just "cpu@0" etc. and move the more specific cpu type ("PowerPC,970FX"
/ "x86,Atom" / whatever) to the compatible property.  I'd recommend
this convention to you, even though it's a bit of a break from earlier
standard practice, it makes device tree manipulations by bootloaders
and other intermediate things a bit easier.

> Also how do you plan to expose threading capability ?

Unless the existing x86 bindings specify something different, I'd
suggest the method we're planning to put into ePAPR 1.1 for PowerPC
chips.  That is, threads sharing an MMU go in the same cpu node, with
the individual thread numbers given as multiple entries in the "reg"
property.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
