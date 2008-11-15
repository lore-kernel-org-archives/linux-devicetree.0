From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Qemu-devel] Machine config files
Date: Sat, 15 Nov 2008 17:45:03 +1100
Message-ID: <20081115064503.GE6629@yookeroo.seuss>
References: <200811140332.14093.paul@codesourcery.com>
	<200811141539.23408.hollisb@us.ibm.com>
	<491DF47B.9000602@codemonkey.ws>
	<200811150013.03865.paul@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200811150013.03865.paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: Anthony Liguori <anthony-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 15, 2008 at 12:13:03AM +0000, Paul Brook wrote:
> > > Some translation code would be required for compatibility. For example,
> > > when the DTS has 128MB of memory, and the user invokes qemu with -m 256,
> > > now you need to update the device tree in order to pass it into the
> > > guest. That's pretty easy, but once you start talking about adding PCI
> > > devices it gets a little more difficult. I seem to recall this
> > > conversation was had on qemu-devel a little while back.
> >...
> > > Of course, *some* code would still be needed *somewhere* to load the
> > > kernel, initrd, set initial register state to point to those memory
> > > locations, etc. In the case of KVM on 440, we also need to override the
> > > DTS with the real host clock frequency. (This probably isn't necessary
> > > for qemu+TCG.)
> > >
> > > But yes, replacing all the pci_nic_init(), isa_mmio_init(),
> > > cpu_register_physical_memory(), etc could be automated by walking the
> > > device tree.
> >
> > Ok.  This is starting to look interesting.  Paul, what do you think of DTS?
> 
> Things like kernel loading are easy, you just add a special device (which 
> linux will ignore) specifying the relevant parameters. IMO it should be 
> possible to use the same device tree for both linux and qemu, but it's ok to 
> require some additional information on top of what linux currently requires.

Depending on exactly what you want to pass through, it may be
appropriate to use properties in /chosen for this.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
