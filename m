From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Mon, 19 Sep 2011 18:05:57 +1000
Message-ID: <20110919080557.GA29197@yookeroo.fritz.box>
References: <20110908052547.GR30278@yookeroo.fritz.box>
	<CAPnjgZ0qnr8VVOX7kCq6wEZ-OxAsxmHkPcTGE7wu1B_9ME_SPA@mail.gmail.com>
	<20110909044945.GF21002@yookeroo.fritz.box>
	<CAPnjgZ3xw7ByV4Yzeot3zgs4oo0zciX2OV_V4vfQ8tGsgLcPvw@mail.gmail.com>
	<20110912005357.GI9025@yookeroo.fritz.box>
	<CAPnjgZ1vevcwCQU+uyjAA3YZd--RhU9MgAF8O8G4Hr5e4CYo_g@mail.gmail.com>
	<20110916081804.GF9025@yookeroo.fritz.box>
	<CAPnjgZ1LUPm9mRft5q=KHGe2h2+Masdh0kGXQ-7j1VTUDsMP7g@mail.gmail.com>
	<20110919020440.GA15001@yookeroo.fritz.box>
	<CAPnjgZ09mO06uruZtC=86BuitUWtQkGQfaHTf25HXK9KzoiD+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ09mO06uruZtC=86BuitUWtQkGQfaHTf25HXK9KzoiD+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 18, 2011 at 10:46:04PM -0700, Simon Glass wrote:
> Hi David,
> =

> On Sun, Sep 18, 2011 at 7:04 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Sep 16, 2011 at 09:25:10AM -0700, Simon Glass wrote:
> >> Hi David,
> > [snip]
> >> > One useful extension of what you have now might be to add a "raw
> >> > binary" format. =A0Not much use for humans, but could be handy for
> >> > scripts extracting blobs from the device tree. =A0In fact, using the
> >> > same interpretation of existing printf() descriptors, that would
> >> > actually be equivalent to 'c'.
> >>
> >> Yes I was thinking about how to do that as it might be useful. I think
> >> 'c' makes perfect sense. Will add to the todo.
> >
> > Actually, on second thoughts using 'c' for this doesn't quite work.
> > For the other format specifiers, you will presumably have some sort of
> > separator between each repeat (newline, I'm guessing). =A0True binary
> > output, obviously, doesn't want that.
> =

> There is a space between each repeat and a newline after each property
> printed. It makes sense to suppress the space for binary output and I
> think an option to flick this switch either way might be in order, too
> (even something to select a new separator char?). Something else for
> the todo once this patch set is in perhaps.

Yeah, fair enough.  I don't think skipping the separators should be
explicit one way or another, not a magic side-effect of using a 'c'
type.

> I suppose we need to be a bit careful not to build out the pier too
> far until we have some pedestrian traffic.

A good point.

> Did you see patch set 3?

Uh, no I don't think so.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
