From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dts and dtsi files on which I tested the syntax for my recent
	patch set.
Date: Mon, 25 Oct 2010 14:20:18 +1100
Message-ID: <20101025032018.GA4741@yookeroo>
References: <1287613337.4535.1508.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1287613337.4535.1508.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 20, 2010 at 03:22:17PM -0700, John Bonesio wrote:
> Hi,
> 
> I have attached the two file I've used to test the new syntax from my
> patch set. These might help get a feel for how the syntax and the
> features work.


[snip]
> /include/ "mpc5200b.dtsi"
> 
> / {
> 	model = "fsl,media5200";
> 	compatible = "fsl,media5200";
> 
> 	aliases {
> 		console = &psc6;
> 		ethernet0 = &eth0;
> 	};
> 
> 	chosen {
> 		linux,stdout-path = &psc6;
> 	};	
> 
> 	memory {
> 		reg = <0x00000000 0x08000000>;	// 128MB RAM
> 	};
> };
> 
> &powerpc {
> 	timebase-frequency = <33000000>;	// 33 MHz, these were configured by U-Boot
> 	bus-frequency = <132000000>;		// 132 MHz
> 	clock-frequency = <396000000>;		// 396 MHz
> };
> 
> &soc {
> 	bus-frequency = <132000000>;// 132 MHz
> };
> 
> &usb {
> 	reg = <0x1000 0x100>;
> };
> 
> /remove-node/ &psc1;
> /remove-node/ &psc2;
> /remove-node/ &{soc/serial@2400};                  /* an example of using a label rooted path */
> /remove-node/ &{/soc5200@f0000000/serial@2600};  /* an example of using the path instead of the label */
> /remove-node/ &psc5;

So, this is the only concrete example for the use of /remove-node/
I've seen so far.  And it's not a really good one.  It appears you're
just removing a bunch of serial nodes from the SoC template,
presumably because they're unused / disconnected on this specific
board.

But you can managed unused devices from the SoC with existing syntax
by adding a status = "disabled" property to the node.  And I'd argue
that having the node present but disabled *more* accurately represents
the hardware for a disconnected ASIC than removing it entirely.

So, what's a genuine use for /remove-node/ that can't be done already?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
