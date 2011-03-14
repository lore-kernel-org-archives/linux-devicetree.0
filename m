From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Mon, 14 Mar 2011 15:10:19 -0600
Message-ID: <20110314211019.GH16096@angua.secretlab.ca>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
	<20110312094620.GM9347@angua.secretlab.ca>
	<20110312145532.GA10194@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110312145532.GA10194-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 12, 2011 at 10:55:33PM +0800, Shawn Guo wrote:
> Hi Grant,
> 
> Thanks for the explanation.
> 
> On Sat, Mar 12, 2011 at 02:46:20AM -0700, Grant Likely wrote:
> > On Sat, Mar 12, 2011 at 03:00:57PM +0800, Shawn Guo wrote:
> > > Hello all,
> > > 
> > > I'm looking at function of_device_alloc in drivers/of/platform.c, and
> > > surprisingly found that the platform device instance id is being
> > > hard-coded as -1 when calling platform_device_alloc.  Does this mean
> > > that there is no support of pdev id in DT?
> > 
> > Correct, when generating devices from the DT, the core code has no way
> > of knowing what the 'preferred' number of the device should be.  It
> 
> If we have this number in DT, the core code gets the way.
> 
> > expects that when the driver's .probe() hook is called, the driver is
> > smart enough to enumerate the automatically.
> > 
> Considering that many drivers on ARM platform are replying on
> pdev->id, we will have to make every single of such drivers become
> smart.
> 
> > > If yes, can anyone please
> > > help me understand why we do not have something in DT node to reflect
> > > this id and get it supported?  Or this is something on TODO list?
> > 
> > Ideally, you shouldn't be relying on .id at all.  Fix your device
> > drivers to enumerate correctly, and use explicit phandle references
> > when specifying connections between devices.
> > 
> Again, many existing ARM drivers will need to get fixed.

I've got another solution for this (see below)

> 
> > That said, I do understand the issue with needing to reference a
> > specific device by name; like for specifying the console device.  In
> > those cases, the correct way to figure out what number a device is
> > supposed to have is to add a property to the /aliases node (see ePAPR
> 
> To me, specifying the id in DT, and letting core code get it from DT
> and pass it to platform_device_alloc seems more natural and
> straight-forward than creating /aliases node and then parsing it in
> every single driver that need to figure out the device number.

...and you're certainly not the first person to suggest that.  That
was certainly my opinion when I started working with the device tree.
However, that approach incurs a number of both conceptual and
practical problems that are hard to solve.

On the conceptual front; the enumeration of devices is in a lot of
regards an implementation detail of the Linux kernel and is
potentially subject to change, whereas the device tree is an
OS-independent description of the hardware.  The last thing we want to
do in the device tree is to try and reconcile all the different ways
that operating systems want to enumerate devices.  Instead, references
between nodes in the tree use explicit phandle references which
always works for referencing a specific device.  Example: An Ethernet
node is attached to its phy with a phandle instead of "phy 5 on
bus 3".

That said, the argument can be made that on-chip SoC device do have a
natural enumeration which is documented in the device, which is true,
but that leads to practical problems:

Say I have three nodes; one using id 0, one using id 1, and one that
doesn't specify an id.  Now, lets also say that the third device gets
probed first.  What ID should it use?  Should it start at the bottom
and assign #0?  That would make 0 unavailable for the first device.
How would the driver know that it is not supposed to enumerate either
id 0 or id 1?  There are two problems here:

First problem is that any kind of mixed enumeration+assignment sucks.
If there is any kind of assignment, then the enumeration engine has to
jump through hoops to figure out which numbers are eligible to be used
for enumerating.  If the identifier assignments are distributed
throughout the tree, then drivers need to have special knowledge about
which nodes to look in for finding pre-assigned ids.

It's particularly troublesome when multiple drivers share the same
numberspace, like i2c and spi bus numbers.  A system could have many
spi busses, some on-chip, some on the main board, and some on add-in
boards with little to no guarantee about which will be bound to
drivers first.  I'm more interested in seeing code that simply doesn't
care what id gets assigned.  This is completely possible with the
device tree when explicit phandle references are used between device
nodes.

However, it does make sense to have logical names for devices,
particularly for things that have labels on the outside of the box.
(ie: serial0 or eth1).  That kind of thing is not a Linux
implementation detail, and certainly it belongs in the device tree.
The /aliases node was designed for exactly that purpose.  Rather than
distributing the name/id assignments throughout the tree, the aliases
node collects all system wide naming information into a single node.
Any driver in the system can use that node to determine which names
are already assigned without needing to search the entire tree.  I am
absolutely adamant on this point that if you want to assign
system-wide naming/numbering, then the /aliases node is the correct
place to do so.

> 
> The most important thing is that the ARM drivers relying on pdev->id
> will need no changes on this point, if we have pdev->id supported in
> DT core code.

You're not going to be able to get this.  There is just no way that
the core DT code can have the information needed to set the .id
correctly.  However, I think I have another solution.

Several weeks back I posted a patch for of_platform_bus_snoop() which
matches platform_device registrations to nodes in the device tree
instead of allocating and registering a new device.  I've spent some
more time on that patch in the last couple of weeks to the point that
I'm happy with the model and I'm almost ready to push it out to my
devicetree/test branch.  John Bonesio is currently refactoring and
cleaning it up for me so that it can get posted.  You can see the
current state in my devicetree/preregister branch, with tegra modified
to use it.

The model is:

1) Platform code calls of_platform_device_preregister() to tell the DT
   code about the nodes it /intends/ to register as devices.
2) Platform code can register as many or as few platform_devices as it
   likes.  If any of these devices match one of the nodes passed by
   of_platform_device_preregister(), then the DT code will set the
   of_node pointer before it gets bound to a device.
3) Platform code calls of_platform_device_probe() which will
   register platform_devices for any nodes which *did not* get
   assigned to a device in step 2.

I implemented this as a way to allow dt and non-dt use-cases to share
the same SoC setup code so that anything on-chip would get registered
in the same way, but would also get the benefit of being linked to its
device tree node.  For example, to obtain the list of i2c devices or
gpio connections from the tree.  It also helps solve the problem of
matching nodes to clks which are currently matched by name.  I think
it would also solve your use case, at least in the short term.

I should have patches out later this week.

g.
