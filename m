From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] Machine config files
Date: Fri, 14 Nov 2008 13:51:40 -0600
Message-ID: <200811141351.40613.hollisb@us.ibm.com>
References: <200811140332.14093.paul@codesourcery.com>
	<f43fc5580811141104v3b6296b0i575693ba944badbb@mail.gmail.com>
	<491DD188.6000603@codemonkey.ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <491DD188.6000603-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Anthony Liguori <anthony-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 14 November 2008 13:29:12 Anthony Liguori wrote:
> Blue Swirl wrote:
> > On 11/14/08, Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> wrote:
> >   
> >> It's come up in other contexts recently, so I think it's worth mentioning 
that
> >>  I am currently working on adding a machine config file support to qemu.
> >>
> >>  I am focusing on the board setup side of things, rather than the 
user-level
> >>  config side.  My goal is to come up with a system that will allow e.g. 
the
> >>  entirety of realview.c and gumstix.c to be eliminated.  Currently this 
is
> >>  based this round Flattened Device Trees (as used by ppc-linux).
> >>
> >>  I have looked at the bits that Fabrice did a while ago. While that 
contains
> >>  some good ideas (which I will probably steal!) it is approaching the 
problem
> >>  from a somewhat different direction.  FTDs are a much better fit for 
some of
> >>  my requirements (e.g. being able to pass the config through to the guest 
OS).
> >>     
> >
> > libfdt looks like an excellent choice for both Sparc32 and Sparc64, I
> > think the whole OF tree can be represented with it.
> >
> > The config could be passed using the firmware configuration device.
> >   
> 
> I was looking through libfdt too.  I think it could also be used for 
> x86.  Hollis, I was looking through the Bamboo code, any reason you 
> don't describe the bus/device layouts in the DTS and then use that to 
> determine what bus/nic to add?

We do; PLB, OPB, and EBC are all on-chip busses found on IBM PowerPC SoCs. For 
example, you can see devices representing the UARTs and PCI controller in our 
bamboo.dts file. Qemu only modifies the device tree at runtime with 
information not known until then (memory size, clock frequency, etc).

You may mean why don't we enumerate *PCI* devices in the device tree. Since 
libfdt is used for embedded systems, this is a tradeoff that allows us to 
keep the device tree smaller -- why put lots of PCI nodes in the device tree, 
when the OS can easily discover them itself? That said, PCI devices are 
indeed found in the device tree in IBM Power servers; Linux just doesn't 
require them.

The Bamboo board in particular doesn't have any on-board PCI devices, but it 
does have several PCI slots. Therefore, a Bamboo device tree in qemu wouldn't 
contain any PCI devices anyways, but if the user says "I have an e1000", qemu 
could add a device node to represent the e1000 (though again, this is not a 
Linux requirement).

(Actually, I don't think the above addresses your specific question, but I 
went to the trouble of typing it so I figured I'd leave it in this mail for 
additional background. :)

Getting back to your original question, we could include an e1000 PCI device 
node in the DTS file, and have qemu walk the tree, find the node, and 
initialize the e1000 emulation driver. We didn't do this mostly to maintain 
compatibility with existing qemu practice, where users are required to 
specify all configuration on the command line.

-- 
Hollis Blanchard
IBM Linux Technology Center
