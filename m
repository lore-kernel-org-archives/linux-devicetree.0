From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: ARM machine specific DT probing
Date: Thu, 16 Sep 2010 17:56:17 -0500
Message-ID: <20100916175617.7e36ed0e@schlenkerla.am.freescale.net>
References: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
	<1283994479.4420.6.camel@pororo> <20100913022036.GD5505@yookeroo>
	<1284355802.2877.56.camel@pororo> <20100913060324.GB13154@yookeroo>
	<20100916174020.GA7550@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100916174020.GA7550-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 Sep 2010 11:40:20 -0600
Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> However, what does compatible mean at the board level?  Can a
> BeagleBoard-xM claim compatibility with the original BeagleBoard?  Or
> even can a -b1 BeagleBoard claim compatibility with the original -a1
> revision?  The -b1 has more SDRAM than the original, and the -xM has
> removed the on board NAND flash.  Neither change can be considered to
> be "100% backwards compatible", so is it valid to claim compatibility
> with the older board?  Clearly the difference between the boards is
> still described in the body of the tree so claiming compatibility
> appears to be the Right Thing To Do, but a strict reading would say
> no.

It gets even uglier with virtualization, where you can have arbitrary
subsets of a particular board's devices available -- and things like
the interrupt controller that are currently normally hardcoded in the
platform file may be swapped out for a paravirt interface.

> benh has also been strongly against powerpc embedded board support
> that can match against a family of boards or SoCs.  Instead, he has
> required that each platform code have a list of specific boards that
> it works with.  Example: arch/powerpc/platforms/5200/mpc5200_simple.c.
> He doesn't want to get back into the situation where each machine type
> gets a whole bunch of complex board-specific workarounds. 

Even as things are now, such workarounds can still be pretty awkward.

They may actually be SoC (family) workarounds (and thus you end up with
a bunch of identical machine_initcalls or similar), or it may need to
go in the middle of code that doesn't normally go in the platform file,
etc.

And it excuses ordinary, non-workaround code (PCI and interrupt setup)
sitting around duplicated in a bunch of platform files instead of being
device-tree-based.

> - Revisit the meaning of top-level compatible.
>   - I still don't think it makes sense for one board to claim
>     compatibility with another,

Most of the time it doesn't, but there may be circumstances where things
are only added, or where a new revision just fixes bugs but software
that works around the bugs will still work.

If we don't allow claiming compatibility in those cases, it may
encourage people to lie and claim to just be that old board with no
more specific entry in the list (or just not put the board rev in the
name at all -- which might be reasonable if the rev info is presented
in a separate property, allowing things like greater-than/less-than
comparisons).

>     but it may be reasonable for the
>     board level to claim compatibility with the SoC used.

Or a family of SoCs, or a family of boards, etc... The criteria simply
ought to be that it is well documented what it means to be compatible
with that string, and that there be something very specific that code
can match on instead if^H^Hwhen things go wrong.

-Scott
