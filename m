From: Paul Brook <paul@codesourcery.com>
Subject: Re: Machine config files
Date: Sat, 15 Nov 2008 00:13:03 +0000
Message-ID: <200811150013.03865.paul@codesourcery.com>
References: <200811140332.14093.paul@codesourcery.com>
	<200811141539.23408.hollisb@us.ibm.com>
	<491DF47B.9000602@codemonkey.ws>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <491DF47B.9000602@codemonkey.ws>
Content-Disposition: inline
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: qemu-devel@nongnu.org
Cc: devicetree-discuss@ozlabs.org, Hollis Blanchard <hollisb@us.ibm.com>
List-Id: devicetree@vger.kernel.org

> > Some translation code would be required for compatibility. For example,
> > when the DTS has 128MB of memory, and the user invokes qemu with -m 256,
> > now you need to update the device tree in order to pass it into the
> > guest. That's pretty easy, but once you start talking about adding PCI
> > devices it gets a little more difficult. I seem to recall this
> > conversation was had on qemu-devel a little while back.
>...
> > Of course, *some* code would still be needed *somewhere* to load the
> > kernel, initrd, set initial register state to point to those memory
> > locations, etc. In the case of KVM on 440, we also need to override the
> > DTS with the real host clock frequency. (This probably isn't necessary
> > for qemu+TCG.)
> >
> > But yes, replacing all the pci_nic_init(), isa_mmio_init(),
> > cpu_register_physical_memory(), etc could be automated by walking the
> > device tree.
>
> Ok.  This is starting to look interesting.  Paul, what do you think of DTS?

Things like kernel loading are easy, you just add a special device (which 
linux will ignore) specifying the relevant parameters. IMO it should be 
possible to use the same device tree for both linux and qemu, but it's ok to 
require some additional information on top of what linux currently requires.

I agree with Hollis that the tricky bits are when you want to augment a board 
with use supplied options (e.g. RAM size or additional PCI devices). That 
either requires qemu to modify the supplied device tree, merging multiple 
trees, or some other magic. I'm ignoring this problem for now. Worst case we 
remove the existing options, provide a reasonable set of "standard" configs 
and anyone who wants exotic setups can modify the machine description.

I'm mainly interested in emulation, where any host information leaking through 
to the emulated machine is a bug :-)

Paul
