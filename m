From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Thu, 12 Jan 2012 10:44:29 -0800
Message-ID: <CAJOA=zPUA56R=vt9MKyhgdyLU96aD_TweZ6BnJy2w3mCVC4Dzg@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20120110213338.GD3226@page> <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA@mail.gmail.com>
 <20120112100702.GM3226@page>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120112100702.GM3226@page>
Sender: linux-kernel-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2012 at 2:07 AM, Jamie Iles <jamie@jamieiles.com> wrote=
:
> On Wed, Jan 11, 2012 at 09:46:58PM -0700, Grant Likely wrote:
>> On Tue, Jan 10, 2012 at 2:33 PM, Jamie Iles <jamie@jamieiles.com> wr=
ote:
>> > On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
>> > I'm about to start trying to get this and Mike's common struct clk
>> > patches working on picoxcell, and the one thing I'm not understand=
ing at
>> > the moment is how to handle the tree itself. =A0Currently I was pl=
anning
>> > on iterating over all clocks and finding a named input clock "ref"=
 or
>> > "input" perhaps. =A0This would be fine for picoxcell, but I guess =
more
>> > complicated chips may need something else.
>>
>> It might be useful to have something like of_irq_init() for setting =
up
>> initial clocks, but the solution feels inelegant to me. =A0I suspect
>> that there will be end up being intertwined init order dependencies
>> between clocks and irqs and other early setup stuff that could be
>> handled better. =A0Again, I need to think about this some more. =A0T=
here
>> might need to be something like an of_early_probe() call that accept=
s
>> a match table of compatible values and setup functions with some log=
ic
>> or data to resolve dependencies. =A0The trick will be to not end up =
with
>> something complex. =A0I'll need to think about this more...
>
> Yes, probably not an easy problem to solve, especially for the platfo=
rms
> where the parent can change at runtime.
>
> I wonder if an of_clk_init() could take a platform callback, so that
> of_clk_init() goes of and creates a struct clk for each clk in the DT=
,
> then for each registered clock calls a platform specific callback whi=
ch
> returns the parent (if any). =A0It feels like a fairly platform speci=
fic
> problem to me.

Based on Thomas' feedback I'm removing the requirement for clocks to
be registered in-order with clk_init().  Any clock that cannot resolve
it's parent within clk_init() (via the .get_parent callback, or
otherwise having .parent statically initialized) will be put into an
orphaned clocks list, which will be walked every time a new clock is
registered.  Hurray for n^2 solutions.

Does the above help with the of_clk_init problems?

One final data point: I certainly plan on allowing for statically
allocated clocks to live alongside DT clocks.  In fact the clock trees
on OMAP are so large that there is some discussion about having some
of the clocks statically allocated and some in DT, but I don't know
what that split looks like right now.  I don't enjoy the idea of
packing 200+ of any entity into a .dts blob.

Regards,
Mike
