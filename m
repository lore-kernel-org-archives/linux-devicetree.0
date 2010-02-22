From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Mon, 22 Feb 2010 12:30:04 +1100
Message-ID: <20100222013004.GM29038@yookeroo>
References: <1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41002200813o3fea9a34s198be367ad81b367-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 20, 2010 at 09:13:13AM -0700, Grant Likely wrote:
> Okay, I'm going to reach way into the past here and reopen an old
> argument...

And it's probably about time, too.

[snip]
> Now that I've had about a year and a half to simmer about it, I think
> I have a counter proposal on a dts syntax extension.
> 
> First, I should state the problems I'm trying to solve.  I have two
> use cases that interest me:
> 
> 1) Multiple boards that use the same SoC.
> Right now each dts file carries around the full dts definition, even
> though 95% of it is 'stock' description of the soc.  For example,
> arch/powerpc/boot/dts/*5200* and arch/powerpc/boot/dts/*8349*.  I want
> a way to put all the common description into an SoC dts file, and then
> be able to tailor it (add nodes, change properties, etc) for the
> specific board.
> 
> 2) FPGA designs
> The Xilinx FPGA toolchain will generate a dts file to describe a
> PowerPC or Microblaze FPGA design.  However, the generated file is
> usually not complete.  Properties need to be modified (ie. console
> device or kernel command line) and additional devices need to be added
> (devices hanging off the i2c, mdio and spi busses, gpio connections).
> The tool doesn't have a way to tailor the device tree generation, and
> the FPGA toolchain doesn't know about board level details.  I want a
> way for the developer to write a board-level .dts file that "wraps" or
> includes the generated file so that it doesn't need to be modified by
> hand.
> 
> I also have some design goals for the proposed solution.  First, I
> want to avoid design a new programming language.  If we need full
> programmatic generation of device trees, there are plenty of general
> purpose languages that can do the job.  I already know of two existing
> device tree generators; I wrote a prototype generator written in
> Python, and the Michal wrote the Xilinx dts generator using TCL.  I
> don't want users to have to learn a new language, and I don't want it
> to be more complex than is needed to solve the specific use cases.  As
> such, I've got no loops, no macros, and no conditionals.

A good goal.  Certainly I think it's preferable to use a device tree
generator in an existing good language that to make ourselves a new
bad language.

> The model that I'm using to approach the problem is to add syntax for
> including .dts files (exactly how Jon proposed) and syntax for going
> back after the tree is parsed and changing things.  I'm not an expert
> on syntax, so I'm open to changes in the details, but this is what I'm
> thinking.  Add the following directives to the syntax:
> 
> /include/ Include a file

Uh.. we already have /include/, which works pretty much exactly as you
want it to.

> /cd/ Change the 'working node', accepts a full or relative path to a
> node.  Also accepts labels.
> /delete-node/ Delete a child node.  Similar to /cd/, accepts a full
> path, a relative path, or a label.
> /delete-property/ Delete a property from the working node.
> 
> So, for example, I might have the following for the pcm030.dts:
> 
> /dts-v1/;
> /include/ mpc5200.dtsi;  /* dts include file */
> /* at this point the basic structure of an mpc5200 board is layed down */
> 
> /* Change some properties in the chosen and memory nodes. */
> /cd/ /chosen;
> linux,stdout-path = &psc1;
> /cd/ /memory
> reg = <0 0x10000000>;
> 
> /* Add some devices to the i2c bus */
> /cd/ &i2c1;   /* "i2c1" is a label from mpc5200.dtsi */
> rtc@51 {
>         compatible = "nxp,pcf8563";
>         reg = <0x51>;
> };
> eeprom@52 {
>         compatible = "catalyst,24c32";
>         reg = <0x52>;
> };
> 
> /* Remove the first i2c bus because it isn't used */
> /delete-node/ &i2c0
> 
> /* The watchdog doesn't work, so remove the fsl,has-wdt property */
> /cd/ &timer0;
> /delete-prop/ fsl,has-wdt;

Ok, I quite like the functionality, but I'm not that fond of the
syntax.  I think I have a similar but neater proposal, at least for
the adding-stuff parts.  There's two parts to my counter-proposal

1) This is essentially part of your proposal, but I'm separating it
out from the /cd/ syntax.

We allow redefinition of properties, nodes, or even the whole device
tree.  For properties the later definition overrides the earlier.  For
nodes, or the whole tree, the definitions are merged in the obvious
way (again with later property definitions overriding earlier).  In
this way an include could define a base tree, and you could then
define an "overlay" tree which adds things or changes properties where
necessary.

Optional extension: because allowing redefinitions potentially allows
genuine mistakes to silently generate unexpected output, it might be
wise to allow only "weak" definitions, marked somehow, to be
overriden.  I'm not sure what syntax we'd use for that.

I think (1) fits very naturally into the existing syntax.

2) The trouble with the above is that having included a template
device tree, redefining some property deep within it is unpleasantly
verbose.  You address that with /cd/, which I don't like very much.
So my counter proposal is that we allow a path instead of just a name
at the beginning of a node definition.  This would essentially define
an empty node for all the initial path elements, then let the node
body define the final path element in the appropriate location.  So:

/include/ template.dtsi;

/somebus@XX/someotherbus@XX/i2c@XX/board-control-widget@XXX {
	board-specific-property = "whatever";
};

Optional extension 1: Give an error if the earlier path components
haven't been defined yet (i.e. _don't+ allow implicit mkdir -p like
behaviour).  I suspect this would rarely to never be an inconvenience,
because you don't generally want to define a node with no properties
at all, and it would catch some genuine mistakes (like a typo which
adds a / to a node name).

Optional extension 2: Allow a node label to be invoked at the
beginning of a node redefinition in.  That would let include files put
labels on the nodes most likely to be extended or overriden,
particularly if they're buried deep in the tree and then the necessary
redefinitions become less verbose again.

(2) is a bit more problematic syntax-wise.  The fact that paths are
now possible before the node definition raises some lexical issues.
In particular it means the /-surrounded "reserved words" might no
longer be clearly lexically distinct from a node definition (I chose
to make the reserved words surround by / specifically so that that
would be the case).  I suspect this is not a fatal problem, but I'll
need to think about it some more.


That still leaves node and property deletion to cover.  In keeping
with the above approach, I'd like to do that in the form of "negative
redefinitions" of properties or nodes.  A neat syntax for that doesn't
immediately occur to be for that yet, though.

> And that's it.  I think this covers the functionality that I need.
> What does everyone think?  Are there other important use cases that I
> should also be addressing?

Probably, but I'm not really sure what they are.

So I think my proposal (1) above accomplishes some of what you want,
while being unlikely to badly conflict with any of the various paths
we might want to take in the future.  So, shall we proceed in that
direction while we think about the rest?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
