From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ARM machine specific DT probing
Date: Thu, 16 Sep 2010 11:40:20 -0600
Message-ID: <20100916174020.GA7550@angua.secretlab.ca>
References: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
	<1283994479.4420.6.camel@pororo> <20100913022036.GD5505@yookeroo>
	<1284355802.2877.56.camel@pororo> <20100913060324.GB13154@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100913060324.GB13154@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 13, 2010 at 04:03:25PM +1000, David Gibson wrote:
> On Mon, Sep 13, 2010 at 01:30:02PM +0800, Jeremy Kerr wrote:
> > Hi David,
> > 
> > > Hrm.  The trouble with this idea is that it needs some measure of
> > > "specificness of match",
> > 
> > I was originally thinking an enum, something to indicate that the match
> > is for a machine or SoC or SoC-family, but that may not be flexible
> > enough.
> > 
> > Essentially, all we really need to indicate is that "this match is more
> > specific than that other match", which the match-table-ordering would
> > work fine for.
> > 
> > With the present infrastructure, we'd need to enforce this by
> > controlling the link order. However, I don't have any good ideas about
> > how we could do this neatly.
> 
> Right, hence the fiddly.  As a first cut, you could just split the
> table into multiple pieces - traverse the "per-soc" table, then the
> "per-machine" table.  That should be pretty easy to implement and if
> you build your macros and whatnot correctly it should be possible to
> then generalize that without requiring changes on the individual
> machine description declaration side.
> 
> > Maybe we could get make to work out the dependencies (this mdesc needs
> > to go before that one) for us :D
> 
> Heh, maybe.  Interesting idea, though potentially hairy.

Ugh... before implementing any or all of these ideas, it is worth
going back to Nicolas' original question.

Nicolas rightly pointed out that the compatible property already
provides the mechanism for prioritized matching so that the operating
system can select the correct support code for a device.  Why then
does each board provide its own probe_dt() hook instead of being
implemented in the core code?  The answer lies partially in the
semantics of the compatible property and also a bit in the mists of
powerpc history (and is probably due for a rethink on both counts).

Concerning the compatible property...

For a device node, compatible is straight forward.  It specifies the
exact part number, followed by an option list of devices to which it
is 100% backwards, both at the register and the device tree binding
levels.  If it isn't 100% compatible, then it cannot claim
compatibility.  Since most devices are well contained, it is
relatively easy to make the call about whether or not compatibility
can be claimed.  ie. It is well established that an ns16550 is
compatible with the ns8250.

However, what does compatible mean at the board level?  Can a
BeagleBoard-xM claim compatibility with the original BeagleBoard?  Or
even can a -b1 BeagleBoard claim compatibility with the original -a1
revision?  The -b1 has more SDRAM than the original, and the -xM has
removed the on board NAND flash.  Neither change can be considered to
be "100% backwards compatible", so is it valid to claim compatibility
with the older board?  Clearly the difference between the boards is
still described in the body of the tree so claiming compatibility
appears to be the Right Thing To Do, but a strict reading would say
no.

To date we've dealt with the ambiguity by simply stating that it
doesn't make sense to claim compatibility at the top level.  Each
board uses a unique identifier and the kernel is modified (by adding
the new string) for each board.  I don't like having to modify the
kernel for this, but the decision to do it this way has a certain amount of sanity.  This decision was made early in the transition to device tree on powerpc.  We were being conservative and didn't want to use ambiguous descriptions that would be hard to back off from later... at least not until we had more experience with how to use the tree (more on that later).

Concerning powerpc history...

PowerPC history is paved with OpenFirmware passing oddball device
trees to the kernel.  Things like multiple machines from IBM that only
contain "chrp" in the top level compatible list.  Before the flattened
form of the device tree was even conceived, the problem existed that
'compatible' was not sufficient to uniquely identify the machine.
Some machines don't even have a compatible value.  Each machine port
had to look at different properties in the tree, and therefore each
platform supplied an .probe() hook to determine what kind of machine
it was.  The design reflects the fact that sometimes custom code is
needed to parse an oddball tree.

benh has also been strongly against powerpc embedded board support
that can match against a family of boards or SoCs.  Instead, he has
required that each platform code have a list of specific boards that
it works with.  Example: arch/powerpc/platforms/5200/mpc5200_simple.c.
He doesn't want to get back into the situation where each machine type
gets a whole bunch of complex board-specific workarounds.  My opinion
is this was a good starting point, but it is probably overly
conservative.  I think it would be reasonable to have board support
that matches on, for example, the SoC instead of the board provided
that there remains a method for doing board-specific overrides.  The
moment a machine needs to  do something 'special' the solution is to
register a new machine type that only matches against the special
board.

Jeremy's patches simply carry over to ARM the established pattern.  At
the time I agreed with the patch, as I wanted to preserve the ability
to do custom matching.  However, there are some differences in the ARM
use case:

- We don't have any relevant incumbent OpenFirmware machines, and
  OpenFirmware on arm will remain a minority.
- the device tree blob is maintained as a separate data file
  independent of boot fimrware.  (firmware doesn't generate it)
- Even if firmware provide a non-replaceable 'bad' dt blob, we've have
  the ability to replace it at boot time.
- The above three points mean that the ARM dt support is not a slave
  to the boot firmware shipped on the board.
- 'compatible' semantics are better established now that when PowerPC
  openfirmware support was added.  It can be coded for the desired
  behaviour.

ARM device tree usage is new, so we don't need to support legacy
device trees with custom probe code.  Trying to anticipation how
people will do it wrong is just borrowing trouble.

Okay, after some mulling, here is my proposal:

- implement compatible matching in the core code
  - This will enforce device tree authors to put valid data in the top
    level compatible value.  Otherwise Linux will not boot.
  - Each OF-enabled board can supply an of_device_id table for
    matching purposes.
- remove the .probe_dt hook
  - The of_device_id table will cover all the known use-cases for ARM
  - If we ever do end up in a situation where custom probe code is
    needed, then it can be added back; but only as a secondary match
    mechanism.  Most likely we will never need it though.
- Revisit the meaning of top-level compatible.
  - I still don't think it makes sense for one board to claim
    compatibility with another, but it may be reasonable for the
    board level to claim compatibility with the SoC used.
  - However, it needs to be strictly defined as to what it means when
    the top level claims compatibility with the SoC.  What specific
    SoC is used?  What assumptions are made?  etc.  It certainly won't
    be valid to make such a claim before the new compatible value is
    documented.
  - Regardless, I want to be careful here so that a decision isn't
    made that is both wrong and hard to recover from.

Thoughts?
g.
