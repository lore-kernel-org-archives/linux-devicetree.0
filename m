From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [coreboot] DTS syntax and DTC patches (was: Re: [Qemu-devel]
	[RFC] Machine description as data)
Date: Fri, 20 Feb 2009 13:29:18 +1100
Message-ID: <20090220022918.GA18332@yookeroo.seuss>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
	<20090213004305.GB8104@yookeroo.seuss> <4994D6C8.5050004@gmx.net>
	<20090213021704.GA10476@yookeroo.seuss> <4994DED9.6020803@gmx.net>
	<20090213025101.GC10476@yookeroo.seuss>
	<13426df10902130907m5c3452dpb8f4f2b72f8507b9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <13426df10902130907m5c3452dpb8f4f2b72f8507b9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: ron minnich <rminnich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Coreboot <coreboot-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 13, 2009 at 09:07:08AM -0800, ron minnich wrote:
> Here is the sum total of the differences from when we checked it in
> over 2 years ago until now (parser). Our real changes are to
> flattree.c and livetree.c, where we do some ugly by-hand parsing of
> the ids such that pci@1,0 etc. work. I'd love to see a way to bring
> this into the real syntax. I've tried to do as little as possible to
> .y and .l.
> 
> The diff with comments is attached.
> 
> But this brings up a bigger issue and we could use your help.
> 
> OK, what did we do? We implemented the ability to have a sort of
> template. Here is a sample from real use.
> 
> /{
> 	mainboard_vendor = "Artec";
> 	mainboard_name = "DBE62";
> 	cpus { };
> 	apic@0 {
> 		/config/("northbridge/amd/geodelx/apic");
> 	};
> 	domain@0 {
> 		/config/("northbridge/amd/geodelx/domain");
> 		pci@1,0 {
> 			/config/("northbridge/amd/geodelx/pci");
> 			/* Video RAM has to be in 2MB chunks. */
> 			geode_video_mb = "16";
> 		};
> 	etc.
> 
> so what's going on here?
> 
> The config file in most cases is pretty straightforward. It's actually
> just a list of properties with a standard setting for chip control. We
> MUST have this; we don't want hundreds of settings in each mainboard,
> because sometimes a chip fix comes along and we want that to go into
> one chip file, and set the correct value, and have all mainboards get
> the new value next time they are built.
> 
> Let's look at /config/("northbridge/amd/geodelx/pci");
> 
> {
> 	device_operations = "geodelx_mc";
> 
> 	/* Video RAM has to be in 2MB chunks. */
> 	geode_video_mb = "0";
> };
> 
> The device_operations property is processed by flattree and is of no
> importance to you, but it is used in coreboot .h and .c code
> generation. For coreboot use, we have several property names that are
> special.
> 
> Note that we create a property, geode_video_mb, and set it to 0.
> 
> In the mainboard dts, we over-ride this value, and set it to 16.
> 
> These are pretty much the changes and, again, they work. But I'd like
> more, as would our community.
> 
> Right now, we can take a file containing a list of dts properties,
> read them in, and modify them as above. It's not really ideal, and I
> am sure you can already see it could be done better. But what we
> really want is the ability to read in  a dts node (with subnodes,
> etc.) and then elide them in the mainboard file.
> 
> So, for example, we have this subsection of one mainboard:
> 
> 		pci@6{ /* Port 2 */
> 			/config/("southbridge/amd/rs690/pcie.dts");
> 		};
> 		pci@7{ /* Port 3 */
> 			/config/("southbridge/amd/rs690/pcie.dts");
> 		};
> 		pci@12{
> 			/config/("southbridge/amd/sb600/hda.dts");
> 		};
> 		pci@13,0{
> 			/config/("southbridge/amd/sb600/usb.dts");
> 		};
> 		pci@13,1{
> 			/config/("southbridge/amd/sb600/usb.dts");
> 		};
> 		pci@13,2{
> 			/config/("southbridge/amd/sb600/usb.dts");
> 		};
> 
> This is not a bunch of chips, but one chip. It has lots of pci devices
> in it; this one chip is equivalent to a whole mainboard from previous
> years. What we'd really like is the ability to do what my wife calls
> restrict, add, and remove (I don't have these terms just right, it's
> some kind of compiler-speak which is what she does for a living).

Hrm, I see.  So, if we added the ability to list properties multiple
times, with the last definition overriding earlier ones, then I
believe that, along with include files, which are already supported
would accomplish what you have implemented with /config/.  Does that
seem correct?

> Restrict we have; change property values from a default.
> Add is what we'd like: add a node to a tree in some way.
> Remove we would also like: remove a node from a dts we have read in
> via /config/.

Hrm.  Well, this sort of thing is certainly on the cards with the
expression support stuff we had in mind.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
