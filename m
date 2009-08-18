From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [RFC] Clock binding
Date: Tue, 18 Aug 2009 14:21:28 +1000
Message-ID: <1250569288.19007.15.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So here's a followup to my discussion about the clock API.

I'm cooking up a patch that replace our current primitive implementation
in arch/powerpc/kernel/clock.c with something along the lines of what I
described. However, I want a bit more churn here on the device-tree
related bits.

So, basically, the goal here is to define a binding so that we can link
a device clock inputs to a clock provider clock outputs.

In general, in a system, there's actually 3 "names" involved. The clock
provider output name, the clock signal name, and the clock input name on
the device. However, I want to avoid involving the clock signal name as
it's a "global" name and it will just end up being a mess if we start
exposing that.

So basically, it boils down to a device having some clock inputs,
referenced by names, that need to be linked to another node which is a
clock provider, which has outputs, references either by number or names,
see discussion below.

First, why names, and not numbers ? IE. It's the OF "tradition" for
resources to just be an array, like interrupts, or address ranges in
"reg" properties, and one has to know what the Nth interrupt correspond
too.

My answer here is that maybe the tradition but it's crap :-) Names are
much better in the long run, besides it makes it easier to represent if
not all inputs have been wired. Also, to some extent, things like PCI do
encode a "name" with "reg" or "assigned-addresses" properties as part of
the config space offset in the top part of the address, and that has
proved very useful.

Thus I think using names is the way to go, and we should even generalize
that and add a new "interrupt-names" property to name the members of an
"interrupts" :-)

So back to the subject at hand. That leaves us with having to populate
the driver with some kind of map (I call it clock-map). Ideally, if
everything is named, which is the best approach imho, that map would
bind a list of:

	- clock input name
	- clock provider phandle
	- clock output name on provider

However, it's a bit nasty to mix strings and numbers (phandles) in a
single property. It's possible, but would likely lead to the phandle not
being aligned and tools such as lsprop to fail miserably to display
those properties in any kind of readable form.

My earlier emails proposed an approach like this:

	- clock input names go into a "clock-names" property
	  (which I suggest naming instead "clock-input-names" btw)

	- the map goes into a "clock-map" property and for each input
	  provides a phandle and a one cell numerical ID that identifies
	  the clock on the source.

However, I really dislike that numerical clock ID. Magic numbers suck.
It should be a string. But I don't want to add a 3rd property in there.

Hence my idea below. It's not perfect but it's the less sucky i've come
up with so far. And then we can do some small refinements.

	* Device has:

		- "clock-input-names" as above
		- "clock-map" contains list of phandle,index

	* Clock source has:

		- "clock-output-names" list of strings

The "index" in the clock map thus would reference the
"clock-output-names" array in the clock provider. That means that the
"magic number" here is entirely local to a given device-tree, doesn't
leak into driver code, which continues using names.

In addition, we can even have some smooth "upgrade" path from existing
"clock-frequency" properties by assuming that if "clock-output-names" is
absent, but "clock-frequency" exist, then index 0 references a fixed
frequency clock source without a driver. This could be generally handy
anyway to represent crystals of fixed bus clocks without having to write
a clock source driver for them.

Any comments ?

I'll post a patch, maybe later today, implementing the above (I may or
may not have time to also convert the existing 512x code to it, we'll
see).

Cheers,
Ben.
