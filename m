From: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 15:47:21 +0000
Message-ID: <20090213154721.GC18471@shareable.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<200902131333.47141.paul@codesourcery.com>
	<871vu2pgq7.fsf@pike.pond.sub.org>
	<200902131425.53137.paul@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200902131425.53137.paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Paul Brook wrote:
> > Now, if you hand me such a configuration on a platter, I'd be a fool not
> > to take it.  The catch: I need one for a PC.
> 
> I suspect these two goals may be contradictory. The PC machine is so hairy 
> that you need a singing, dancing machine description to be able to describe 
> it.

About 8 months ago I wanted a QEMU PC, but with PIIX4 IDE controller
instead of the PIIX3 IDE controller that hw/pc.c binds.  (That's
needed to allow a Windows 2000 guest imported from Virtual PC to boot
without a blue screen).

It would have been handy to have an option "-drive if=ide,hw=piix4" or
similar, but considering the obscure reasons for it, I'd have been
happy with a machine configuration file where I could edit the type of
attached device.

By the way, Virtual PC has an XML configuration file which describes
the machine it's emulating in some detail, including device serial
numbers and such.  Is it worth a look?

> OTOH if what you really want to do is configure the host binding
> side of things, then as I've mentioned before, I see that as been
> somewhat separate from the actual machine creation, and trying to
> combine the two is probably a mistake. I really don't want users to
> have to hack the machine config just to change the name of an image
> file.

I agree that host binding is separate, but they're related.

"Placeholders" in the machine config for where particular command line
input can modify the config, with defaults, would be nice.

In the case of a disk image file, the machine config's default would
give a default of "no image file" (no disk present), with a
placeholder indicating that "-drive if=ide,index=0 affects this node"
or similar.

For some devices in the machine config, if the setting is "no image
file" or "no terminal attached", the config may say that the device
itself is to be omitted.  This would apply to hard disks, since you
can't have a not present hard disk.

For other devices in the machine config, the config may say the device
should be present but does nothing.  This would apply for those SoC
emulations which always have 3 UARTs, for example.  If the command
line doesn't attach those UARTs to something, the machine config would
still cause the UARTs to be present.  On a PC, you might always
include an emulated floppy drive, even if no floppy options are
included on the command line - unless "-drive
if=floppy,index=0,disabled" is passed on the command line perhaps.

I expect this can fit into any of the machine config syntaxes and tree
types which have been discussed.  It would be nice to have a generic
command line option which can modify any part of the machine config
tree too, but not necessary.

If the machine config syntax is human friendly enough, it may be
possible for host binding config to use the same syntax, instead of
copying a machine config and editing a small section when command line
options aren't detailed enough.

-- Jamie
