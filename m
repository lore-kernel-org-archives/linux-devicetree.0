From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Mon, 12 Sep 2011 10:53:57 +1000
Message-ID: <20110912005357.GI9025@yookeroo.fritz.box>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-4-git-send-email-sjg@chromium.org>
	<20110908052547.GR30278@yookeroo.fritz.box>
	<CAPnjgZ0qnr8VVOX7kCq6wEZ-OxAsxmHkPcTGE7wu1B_9ME_SPA@mail.gmail.com>
	<20110909044945.GF21002@yookeroo.fritz.box>
	<CAPnjgZ3xw7ByV4Yzeot3zgs4oo0zciX2OV_V4vfQ8tGsgLcPvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3xw7ByV4Yzeot3zgs4oo0zciX2OV_V4vfQ8tGsgLcPvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, Sep 08, 2011 at 10:44:40PM -0700, Simon Glass wrote:
> Hi David,
> =

> A bit rushed as late here but I wanted to respond before your weekend.
> =

> On Thu, Sep 8, 2011 at 9:49 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Sep 08, 2011 at 05:47:34AM -0700, Simon Glass wrote:
[snip]
> > 1) Use a subset of printf() specifiers. =A0Despite your balking at that,
> > I don't really think it would be any harder than what you have now.
> > Last character is always the non-optional "format" specifier, anything
> > preceding it is modifiers. =A0So for the integer formats "d", "x" and
> > "o", valid modifiers are size, either "hh" (1 byte), "h" (2 byte), "l"
> > (4 byte, default) or "ll" (8 byte). =A0For the string format "s", no
> > modifiers are valid.
> =

> OK, I like this option more. Particularly if you think I might get
> away with also supporting 'b' as a shortcut for 'hh'.

Hrm, I have mixed feelings about that. "hh" is kind of obscure.  And
as far as I can tell "b" is not used for anything else at present (at
least in glibc printf()).  But there are so many letters with existing
meanings for printf() that redefining any makes me a little nervous.

> > 2) Treat the size as a different parameter. =A0So the -f option gives a
> > single format char (or instead use -s, -x, -d, .. options). =A0Then have
> > a -s option for size (-s1 ... -s8) which is valid only with the
> > integer format options.
> =

> More like what I had - have moved away from that and feel more
> comfortable in my new space.

Ok.

> > Either way does leave a couple of unanswered questions:
> >
> > A) What to do if the format doesn't consume the whole parameter. =A0I
> > see two options:
> > =A0 =A0 =A0 =A0A1) Just print as much as the format says, then stop
> > =A0 =A0 =A0 =A0A2) Keep repeating the same format until the property is
> > consumed (note that this makes sense for "s" as well, and would be an
> > obvious way of handling the pretty common list-of-strings properties).
> =

> Well I think you have to keep printing. This is not a true format
> string, but just a data type for each element. Again we have moved
> away from being able to say -f "The %d item is %d and has a flag word
> of %d".
> =

> So no need to use -tddd if there are three cells - just -td is enough.

Yes, I tend to agree.

> > B) What to do when the property just doesn't fit into that format -
> > either it's length is not a multiple of the fixed integer size, or
> > it's not NUL-terminated for "s". =A0Obviously some kind of error is in
> > order, but in case A2 above, do we *just* error, or print what we can
> > before giving up.
> =

> Prefer to error since any output might be confusing. But I will take a
> look to make sure that is easy to do.

It is trivial to check in advance for the existing types - for
integers just check if the property has length a multiple of the
integer size, for strings check if the last byte is '\0'.  Well.. then
it depends a bit on how safe you want "s" to be - do you check for
reasonably printable characters first or not.  How easy it is to
pre-check for possible future types is not neccessarily obvious of
course.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
