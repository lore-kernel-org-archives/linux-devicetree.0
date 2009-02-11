From: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Wed, 11 Feb 2009 12:57:19 -0600
Message-ID: <1234378639.28751.85.camel@slate.austin.ibm.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<18834.64870.951989.714873@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <18834.64870.951989.714873-msK/Ju9w1zmnROeE8kUsYhEHtJm+Wo+I@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2009-02-11 at 16:31 +0000, Ian Jackson wrote:
> Markus Armbruster writes ("[Qemu-devel] [RFC] Machine description as data"):
> > [stuff]
> 
> Yes, this is a good approach.  I have one question though:
> 
> >    Define an internal machine configuration data structure.  Needs to be
> >    sufficiently generic to be able to support even oddball machine
> >    types.  Make it a decorated tree, i.e. a tree of named nodes with
> >    named properties.
> 
> Many real systems are not strictly tree-structured, because there are
> hardware devices which connect via several different paths.  For
> example, much hardware supported by OpenWRT comes with a built-in
> bridge chip connected internally to a hidden ethernet card; a tape
> library would have one interface for the robot and a bunch of SCSI
> tapereaders; etc.

I'm not sure these are great examples, since there still a clear
hierarchy here (e.g. the ethernet card is "behind" the bridge chip).
Also, there is already established practice for representing SoC devices
(found in many embedded PowerPC processors): see arch/powerpc/boot/dts.

However, what *is* a good example would be the interrupt hierarchy,
which can be totally separate from the address/data hierarchy.

The device tree is about *devices*, not interfaces. Each node (device)
can mark itself as implementing multiple interfaces, which is what the
"compatible" property is about.

> When an emulation of such a device starts up, it will want to bind to
> several parents.  How will you represent this ?

There is established design for representing the interrupt hierarchy in
IEEE1275, using explicit "interrupt-parent" properties to create the
interrupt tree.

-- 
Hollis Blanchard
IBM Linux Technology Center
