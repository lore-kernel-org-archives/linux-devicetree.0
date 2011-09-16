From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Fri, 16 Sep 2011 18:18:04 +1000
Message-ID: <20110916081804.GF9025@yookeroo.fritz.box>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-4-git-send-email-sjg@chromium.org>
	<20110908052547.GR30278@yookeroo.fritz.box>
	<CAPnjgZ0qnr8VVOX7kCq6wEZ-OxAsxmHkPcTGE7wu1B_9ME_SPA@mail.gmail.com>
	<20110909044945.GF21002@yookeroo.fritz.box>
	<CAPnjgZ3xw7ByV4Yzeot3zgs4oo0zciX2OV_V4vfQ8tGsgLcPvw@mail.gmail.com>
	<20110912005357.GI9025@yookeroo.fritz.box>
	<CAPnjgZ1vevcwCQU+uyjAA3YZd--RhU9MgAF8O8G4Hr5e4CYo_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1vevcwCQU+uyjAA3YZd--RhU9MgAF8O8G4Hr5e4CYo_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Sun, Sep 11, 2011 at 09:34:01PM -0700, Simon Glass wrote:
> Hi David,
> =

> Thanks for your comments.

[snip]
> >> > B) What to do when the property just doesn't fit into that format -
> >> > either it's length is not a multiple of the fixed integer size, or
> >> > it's not NUL-terminated for "s". =A0Obviously some kind of error is =
in
> >> > order, but in case A2 above, do we *just* error, or print what we can
> >> > before giving up.
> >>
> >> Prefer to error since any output might be confusing. But I will take a
> >> look to make sure that is easy to do.
> >
> > It is trivial to check in advance for the existing types - for
> > integers just check if the property has length a multiple of the
> > integer size, for strings check if the last byte is '\0'. =A0Well.. then
> > it depends a bit on how safe you want "s" to be - do you check for
> > reasonably printable characters first or not. =A0How easy it is to
> > pre-check for possible future types is not neccessarily obvious of
> > course.
> =

> Yes I have added a check for (length % size) =3D=3D 0. For strings I don't
> think we should be picky so long as there is a NUL terminator. If you
> don't specify a type, the utility already tries to guess, and will
> fall back to integer or even byte if it finds the string has ctrl
> characters. When the user says -ts I think we need to try hard to
> obey. I can't think of any reason to store strange characters in a
> string property, but others might.

Yes, that makes sense.  One reason for funny bytes in a string that
springs to mind would be inclusion of UTF-8 or other high-bit
character encodings.

One useful extension of what you have now might be to add a "raw
binary" format.  Not much use for humans, but could be handy for
scripts extracting blobs from the device tree.  In fact, using the
same interpretation of existing printf() descriptors, that would
actually be equivalent to 'c'.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
