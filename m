From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] x86: of: define irq functions to allow drivers/of/*
	to build on x86
Date: Mon, 20 Sep 2010 19:06:04 -0700
Message-ID: <20100920190604.5a2118da@debxo>
References: <20100910060151.6613e9c3@debxo>
	<20100910172538.GC11284@angua.secretlab.ca>
	<20100910181458.GA7243@elte.hu>
	<20100910182135.GG11284@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100910182135.GG11284-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: Mitch Bradley <wmb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 10 Sep 2010 12:21:35 -0600
Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> On Fri, Sep 10, 2010 at 08:14:58PM +0200, Ingo Molnar wrote:
> > 
> > * Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > 
> > > On Fri, Sep 10, 2010 at 06:01:51AM -0700, Andres Salomon wrote:
> > > > 
> > > >  - Define a stub irq_create_of_mapping for x86 as a stop-gap
> > > > solution until drivers/of/irq is further along.
> > > >  - Define irq_dispose_mapping for x86 to appease of_i2c.c
> > > > 
> > > > Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
> > > 
> > > Applied to my test-devicetree branch.  I'll need an ack from the
> > > x86 maintainers before I put it into my -next branch.
> > 
> > The purpose of the patch is not clear to me. What does it do and
> > why? 
> 
> It allows CONFIG_OF to be enabled on x86 without a build failure.
> 
> > The changelog says it's a stopgap measure - what exactly is the
> > long term plan and how long will it take?
> 
> It is a stop gap because it performs a trivial direct map of an IRQ
> number in the device tree data structure to a Linux irq number.  This
> works for a single IRQ controller, but falls apart when cascaded
> controller are described in the device tree.  The long term plan is to
> have the drivers/of/ code handling the mapping intelligently like
> powerpc currently does.
> 
> g.
> 

Any additional comments (ACKs, NACKs, etc) on the patches?  If I need
to rework it (or them), I can certainly make the patch description
longer.
