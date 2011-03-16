From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: No support of platform device instance id?
Date: Wed, 16 Mar 2011 17:05:00 -0600
Message-ID: <20110316230500.GB15557@angua.secretlab.ca>
References: <20110312070057.GB9650@S2100-06.ap.freescale.net>
	<20110312094620.GM9347@angua.secretlab.ca>
	<20110312145532.GA10194@S2100-06.ap.freescale.net>
	<20110314211019.GH16096@angua.secretlab.ca>
	<20110316135800.GB11658@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110316135800.GB11658-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[widening cc: list to solicit feedback on the new model]

On Wed, Mar 16, 2011 at 09:58:01PM +0800, Shawn Guo wrote:
> On Mon, Mar 14, 2011 at 03:10:19PM -0600, Grant Likely wrote:
> > 
> [...]
> > Several weeks back I posted a patch for of_platform_bus_snoop() which
> > matches platform_device registrations to nodes in the device tree
> > instead of allocating and registering a new device.  I've spent some
> > more time on that patch in the last couple of weeks to the point that
> > I'm happy with the model and I'm almost ready to push it out to my
> > devicetree/test branch.  John Bonesio is currently refactoring and
> 
> I have seen it on devicetree/test branch.

Good.  I don't know if you've seen it yet, but I also posted and
pushed out an updated version last night that cleans up the usage
model quite a bit.  New code uses of_platform_prepare() for flagging
nodes that will be registered later, and both of_platform_bus_probe()
and of_platform_populate() will respect the discoveries made by
of_platform_prepare().

> > cleaning it up for me so that it can get posted.  You can see the
> > current state in my devicetree/preregister branch, with tegra modified
> > to use it.
> > 
> > The model is:
> > 
> > 1) Platform code calls of_platform_device_preregister() to tell the DT
> >    code about the nodes it /intends/ to register as devices.
> > 2) Platform code can register as many or as few platform_devices as it
> >    likes.  If any of these devices match one of the nodes passed by
> >    of_platform_device_preregister(), then the DT code will set the
> >    of_node pointer before it gets bound to a device.
> > 3) Platform code calls of_platform_device_probe() which will
> >    register platform_devices for any nodes which *did not* get
> >    assigned to a device in step 2.
> > 
> > I implemented this as a way to allow dt and non-dt use-cases to share
> > the same SoC setup code so that anything on-chip would get registered
> > in the same way, but would also get the benefit of being linked to its
> > device tree node.  For example, to obtain the list of i2c devices or
> > gpio connections from the tree.  It also helps solve the problem of
> > matching nodes to clks which are currently matched by name.  I think
> > it would also solve your use case, at least in the short term.
> > 
> I'm seeing this approach benefits the smooth moving of dt on ARM, but
> will this be the ultimate shape of dt support on ARM?

I've been spending a *lot* of time thinking about this (which is part
of the reason why it's taken so long to get full dt support for ARM
hammered out; decisions made now will be with us for a long time to
come).  On powerpc the design was easy because all of the BSPs were
converted to require a device tree.  Therefore it made complete sense
to obtain all device information from the tree.

On ARM however, SoC support code must handle both DT and non-DT use
cases, which means that the internal SoC device layout is going to be
encoded in the kernel regardless of whether or not it is available in
the device tree.  If we follow the lead of PowerPC here and obtain all
device information from the DT, then it means DT and non-DT
initialization uses entirely different code paths for the same SoC.
Sure, the DT init code will a lot simpler that its non-DT counterpart,
but is that really an advantage when the non-DT init code needs to be
written regardless?  Perhaps not.

To answer your question, "will this be the ultimate shape of dt
support on ARM?"  I think that ultimately that decision needs to be
made by each sub-arch maintainer.  For existing SoCs, yes I think that
this new model will be the right thing to do, with SoC internals
registered statically, and board-level devices and clocks probed
entirely from the device tree.

I also expect that some maintainers will decide to go 100% device tree
for their SoC.  The Xilinx ARM FPGA is a likely candidate here.  In
that scenario, this new model wouldn't make much sense, and it would
be better to follow the powerpc lead by registering everything
directly from the DT.

Either choice is valid.  It is a tradeoff between sharing
initialization code and the simplicity of full DT device
registration.

I'd like to have feedback on the new code to make sure that the model
is sane.  There are some fiddly code it there which is used to match
platform_device registrations to nodes in the device tree.  I *think*
it makes sense, but I'd like to hear other opinions.

g.
