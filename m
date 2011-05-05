From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 4/6] dt: generalize irq_of_create_mapping()
Date: Thu, 05 May 2011 10:43:41 +1000
Message-ID: <1304556221.2513.395.camel@pasglop>
References: <20110428192227.8979.49181.stgit@ponder>
	<20110428200203.8979.3569.stgit@ponder>
	<1304387422.2513.301.camel@pasglop>
	<20110504160502.GC3317@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110504160502.GC3317-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2011-05-04 at 10:05 -0600, Grant Likely wrote:
> > I think you are going the wrong way around.
> > 
> > First thing first, is to make the irq domain / mapping API generic
> > without the OF bits.
> > 
> > IE. move the IRQ domain generically, get rid of irq_map by putting
> the
> > domain ptr & hw numbers in the irq desc/data etc...
> > 
> > Then you can move over the OF specific bits which are optional and
> > orthogonal to a large extent.
> 
> As discussed in my other reply, I disagree.  There isn't an immediate
> need for the mapping interface in common code.  It would be useful,
> sure, for some interrupt controllers, but for many of them
> irq_alloc_descs() and an irq_base value is all the functionality that
> is needed, and irq_host doesn't gain anything.

No but the concept of domain is a pre-requisite. Even if it's an opaque
data structure. And I don't want to have it be some "of" specific thing.

> The OF translation on the other hand is needed immediately by several
> architectures and are very much non-optional in that regard.

But it relies on having an underlying mapping. I don't see how you can
do one without the other, even if your mapping in effect is just an
offset.

And it is -not- related to OF.

Whether you obtain that your interrupt you are interested it is
interrupt 5 of your PIC "foo" via the device-tree or any other way (an
arch quirk for example), you need the mechanism to associate them
together, whether it's a simple offset as you propose (I'm ok with that
for simple things, I just didn't think it was the right approach for
powerpc but it's perfectly valid as an option generically) or a more
complex radix-tree style mapping.

Thus sort out the mapping interfaces first. _Then_ layout the
device-tree bits on top.

The basic parsing for the DT is already there. It will return a parent
node and a __be32* pointer.

Cheers,
Ben.
