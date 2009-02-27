From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Of the device tree binary format endianness on little-endian
	platform
Date: Fri, 27 Feb 2009 21:37:51 +1100
Message-ID: <20090227103751.GD3993@yookeroo.seuss>
References: <1235729184.17001.369.camel@pc-laurentg.intra.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1235729184.17001.369.camel-AlTa8cHOufjkPJRI6LV1/EZjUo8kaGiB@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 27, 2009 at 11:06:24AM +0100, Laurent Gregoire wrote:
> 
> On Thu, 2009-02-26 at 11:52 +1100, David Gibson wrote:
> > If you're working exclusively with the flattened tree, then please use
> > libfdt as your parsing library.  It's not used in the powerpc kernel
> > proper, because that's based on an expanded tree, but it is used in
> > the powerpc bootwrapper, see arch/powerpc/boot/libfdt.  That's just a
> > copy of the upstream version that's part of the dtc tree.  If ARM
> > starts using this as well we can move it to lib/ or some other
> > non-arch-specific location.
> > 
> > If you need to extend libfdt, that's fine - but talk to me about
> > getting your extensions upstream.  The whole idea is that it gets
> > extended to be the flat tree parsing library of choice.
> 
> I fully agree with this, that's the reason why we currently work on our
> specific platform for now. Concerning the change in the interface, that
> shouldn't have a big influence on any eventual future merge as the
> ppc/libfdt main branch is also using external iterator and is
> endian-aware. We'll keep that in mind anyway.

Ok.  I'd kind of prefer to hear what you're doing with libfdt now
though, rather than later...

> > I don't entirely follow what you're doing here, but it sounds like it
> > might not be quite correct.  The device tree should always (well,
> > nearly always) describe the hardware, *not* Linux or driver specific
> > information.  Generally drivers will use the "compatible" property to
> > determine if a device tree node is relevant to them.
> 
> I think there is a bit of misunderstanding here. Our initial goal is not
> to port the device-tree framework to ARM, even if it would be nice to do
> so. We face a specific issue on our range of devices which is to
> personalize them with device-specific and model-specific information,
> not board-specific. We realized that the device-tree format was
> well-suited for what we wanted to do, so we plan to use the device-tree
> *format*, not *framework*. Taking this into account, this is an
> opportunity to also parametrize some platform-devices using the same
> system, but we didn't initially planned to make a whole redesign of ARM
> platform-device initialization like the one which is done on PPC.

Ah.. ok.  Hrm.  I'm not sure if this is a good idea or not.  It
worries me a little to have an entirely new device tree content
format, even though there's clearly no technical barrier to doing so.
It should be possible to use IEEE1275-like content to probe devices
for your specific platform, even if ARM as a whole doesn't.

> Anyhow, any feedback on porting device-tree on some other architecture
> is welcomed and somehow we need to start somewhere. So even if what we
> do won't be portable/ported to be the next ARM standard it could be
> useful to iron-out any arch-dependencies on the system and give some
> momentum on the device-tree usage.
> 
> > > The platform-device initialization order is given by device-tree order.
> > 
> > This is not usually a good idea.  Flattened device trees do have an
> > order, but for real OF trees, the tree order is not well defined, so
> > it's generally best not to use the order to control initialization,
> > but instead to use explicit content to control order, if it's
> > important.
> 
> Good point. but as I said above we'll probably not rely too much on this
> anyway.
> 
> > > Also we noticed the lack of type information in device-tree binary
> > > format (could be needed for exporting values to user-land through
> > > something like sysfs, to have human-readable integer values in scripts -
> > > also big-endian integers have to be converted).
> > 
> > Yes, the device tree structure treats property values as "bag of
> > bytes".  It's assumed that you need to know the binding for a given
> > node/property - which describes the format of the content - in order
> > to correctly interpret it.
> 
> OK, I consider this to be a "feature" then ;). But that rules out any
> automated human-readable export of device-tree properties through
> something like sysfs though.

Well, sort of.  dtc and a number of other tools do this with
heuristics.  Not infallible, obviously, but it gets the common cases
right which is often enough.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
