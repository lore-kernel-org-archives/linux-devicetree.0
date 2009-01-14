From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [U-Boot] dtc/u-boot tool naming, "ftdump", "mkimage"
Date: Thu, 15 Jan 2009 09:22:36 +1100
Message-ID: <20090114222236.GC18093@yookeroo.seuss>
References: <496E2796.3090405@genesi-usa.com>
	<20090114181028.GB7768@yoda.jdub.homelinux.org>
	<496E3604.8030007@genesi-usa.com> <496E38DA.8080408@ge.com>
	<20090114191905.GA18581@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090114191905.GA18581-JVa43G0qJ78RlTYtMZUE4cJ8OCA1ciLf@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Josh Boyer <jwboyer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Jerry Van Baren <gerald.vanbaren-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2009 at 02:19:05PM -0500, Josh Boyer wrote:
> On Wed, Jan 14, 2009 at 02:11:22PM -0500, Jerry Van Baren wrote:
> > Hi Matt,
> >
> > Matt Sealey wrote:
> >> Josh Boyer wrote:
> >>> On Wed, Jan 14, 2009 at 11:57:42AM -0600, Matt Sealey wrote:
> >>>> I just noticed (was told by an affiliate) that the DTC compiler 
> >>>> tools  shares a tool name "ftdump" with the Freetype project. I was 
> >>>> doing a  lazy packaging effort to get a few tools around so we can 
> >>>> all be running  the same version and build some custom kernel RPMs, 
> >>>> and this came up.
> >>>>
> >>>> Wouldn't a better name be "fdtdump", do you think? It's usually not 
> >>>> a  fun idea to conflict with tools already on the system. A user 
> >>>> may run  "ftdump" and get the Freetype tool because of a simple 
> >>>> mistake in paths  or so.
> >>>>
> >>>> With regards to U-Boot proper, I would say the same is true of 
> >>>> "mkimage"  which conflicts with jigdo. In essence, while U-Boot is 
> >>>> usually  installed into a user's home directory (~/bin etc.) simple 
> >>>> path mixups,  going to root shell, using another box etc. means you 
> >>>> may have multiple  same-named tools on a system for various work, 
> >>>> which do different things.
> >
> > Mkimage and ftdump are different audiences (OK, the same people but the  
> > chairs are arranged differently ;-).
> >
> > [snip]
> >
> > IMHO, the ftdump issue needs to be addressed at the DTC level (Jon  
> > Loeliger and David Gibson).  U-Boot (and the linux kernel) is being  
> > driven by DTC.
> 
> David has said before that ftdump is sort of a pointless debugging tool.
> Or at least that is what the Debian bug report referrenced as the reason
> from removing it from the Debian dtc package.

Yeah, I wouldn't suggest packaging ftdump.  It's potentially useful
for debugging dtc itself, but if you want to dump a device tree "for
real", you can use "dtc -I dtb -O dts".

> Maybe we should just remove it entirely if it's not really going to be
> maintained long-term.

Hmm, perhaps.  We should definitely remove it from the make install
target.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
