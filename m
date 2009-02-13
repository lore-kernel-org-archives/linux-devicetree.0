From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 12:06:41 +0000
Message-ID: <200902131206.42427.paul@codesourcery.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<20090213003724.GA8104@yookeroo.seuss>
	<87ab8qr317.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <87ab8qr317.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
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
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Now let's examine how QEMU machine configuration and FDT machine
> descriptions for kernels are related.
>
> In a way, both can be regarded as copies of a complete machine
> description with lots of stuff pruned.  Except the complete machine
> description doesn't exist.  Because there is no use for it.
>
> FDT routinely prunes stuff like PCI and USB devices, because those are
> better probed.
>
> QEMU configuration should certainly prune everything that is not
> actually configurable.

I'm not sure I agree here, or at least we may be talking past each other.

IMHO the machine config should specify all the bits of the machine that don't 
really want to be exposed to the average user. e.g. the memory layout and 
interrupt routings, etc. We then have a seaparate user config file (possibly 
structured differently) which exposes things like host bindings for disks and 
network devices.

It's all a bit muddy because the current commandline options effect both the 
devices present and the host bindings for the corresponding interfaces. While 
this seems like a good idea to start with, I'm not convinced this is actually 
a desirable feature.  Certainly for embedded machines you want a fixed set of 
hardware. e.g. if we have a SoC with 3 UARTs we should always create those 3 
devices, and it's not meaningful to have more. If the user doesn't specify 
sufficient -serial options then the remainder just get connected 
to /dev/null. Likewise there's a good argument for having the vlan and disc 
configuration be separate from creation of the NIC/HBA devices.

One possibility is that it might actually make more sense to specify 
hot-pluggable devices (e.g. PCI and USB) in a sumilar way that they would be 
added at runtime, rather than trying to force them into a static tree.

My implementation focsed on just the machine config, mostly ignoring the user 
config and host bindings.

Paul
