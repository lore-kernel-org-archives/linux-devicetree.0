From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Sun, 18 Sep 2011 22:46:04 -0700
Message-ID: <CAPnjgZ09mO06uruZtC=86BuitUWtQkGQfaHTf25HXK9KzoiD+w@mail.gmail.com>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-4-git-send-email-sjg@chromium.org>
	<20110908052547.GR30278@yookeroo.fritz.box>
	<CAPnjgZ0qnr8VVOX7kCq6wEZ-OxAsxmHkPcTGE7wu1B_9ME_SPA@mail.gmail.com>
	<20110909044945.GF21002@yookeroo.fritz.box>
	<CAPnjgZ3xw7ByV4Yzeot3zgs4oo0zciX2OV_V4vfQ8tGsgLcPvw@mail.gmail.com>
	<20110912005357.GI9025@yookeroo.fritz.box>
	<CAPnjgZ1vevcwCQU+uyjAA3YZd--RhU9MgAF8O8G4Hr5e4CYo_g@mail.gmail.com>
	<20110916081804.GF9025@yookeroo.fritz.box>
	<CAPnjgZ1LUPm9mRft5q=KHGe2h2+Masdh0kGXQ-7j1VTUDsMP7g@mail.gmail.com>
	<20110919020440.GA15001@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110919020440.GA15001-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Sun, Sep 18, 2011 at 7:04 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Sep 16, 2011 at 09:25:10AM -0700, Simon Glass wrote:
>> Hi David,
> [snip]
>> > One useful extension of what you have now might be to add a "raw
>> > binary" format. =A0Not much use for humans, but could be handy for
>> > scripts extracting blobs from the device tree. =A0In fact, using the
>> > same interpretation of existing printf() descriptors, that would
>> > actually be equivalent to 'c'.
>>
>> Yes I was thinking about how to do that as it might be useful. I think
>> 'c' makes perfect sense. Will add to the todo.
>
> Actually, on second thoughts using 'c' for this doesn't quite work.
> For the other format specifiers, you will presumably have some sort of
> separator between each repeat (newline, I'm guessing). =A0True binary
> output, obviously, doesn't want that.

There is a space between each repeat and a newline after each property
printed. It makes sense to suppress the space for binary output and I
think an option to flick this switch either way might be in order, too
(even something to select a new separator char?). Something else for
the todo once this patch set is in perhaps.

I suppose we need to be a bit careful not to build out the pier too
far until we have some pedestrian traffic.

Did you see patch set 3?

Regards,
Simon

>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
