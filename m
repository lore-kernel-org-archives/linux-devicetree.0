From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Thu, 8 Sep 2011 22:44:40 -0700
Message-ID: <CAPnjgZ3xw7ByV4Yzeot3zgs4oo0zciX2OV_V4vfQ8tGsgLcPvw@mail.gmail.com>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-4-git-send-email-sjg@chromium.org>
	<20110908052547.GR30278@yookeroo.fritz.box>
	<CAPnjgZ0qnr8VVOX7kCq6wEZ-OxAsxmHkPcTGE7wu1B_9ME_SPA@mail.gmail.com>
	<20110909044945.GF21002@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110909044945.GF21002-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

A bit rushed as late here but I wanted to respond before your weekend.

On Thu, Sep 8, 2011 at 9:49 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Sep 08, 2011 at 05:47:34AM -0700, Simon Glass wrote:
>> Hi David,
>
> [snip]
>> >> Usage:
>> >> =A0 =A0 =A0 fdtget <options> <dt file> [<node> <property>]...
>> >> Options:
>> >> =A0 =A0 =A0 -t [<type>][<format>] =A0 Type of data
>> >> =A0 =A0 =A0 -h =A0 =A0 =A0 =A0 =A0 =A0 =A0Print this help
>> >>
>> >> =A0 =A0 =A0 <type> =A0 =A0 =A0 =A0 =A0One character (s=3Dstring, i=3D=
int, u=3Dunsigned, b=3Dbyte)
>> >> =A0 =A0 =A0 <format> =A0 =A0 =A0 =A0Optional format character (x=3Dhe=
x)
>> >
>> > It is not terribly clear how these are combined.
>>
>> A type character, then an optional format character. In fact the type
>> character is also optional at present since integer is assumed.
>>
>> Please can you suggest a suitable help message to convey this?
>
> Hrm, ok, so. =A0I think part of the problem is that I'm finding what is
> covered by "type" and what is covered by "format" is only obvious once
> you've already understood what they mean. =A0They're not fully
> independent either, since "format" makes no sense with type "s".

Yes I'm really just trying to explain a format similar to printf.

>
>> > Is there any way to make these more closely resemble printf() style
>> > format specifiers?
>>
>> The first patch series allowed printf specifiers but could segfault if
>> the user specified %s for something that was in fact not a string. I
>> have moved away from that as you suggested at the time.
>
> Yeah, I better understand your motivation for doing so now. =A0But it's
> just not safe to do it that way.
>
>> I am not keen
>> to re-implement printf(), or manually decode a partial subset of
>> printf strings, to avoid that problem. So something simple like this
>> is what I have come up with.
>
> Hrm. =A0The problem I have is that this sort-of-like printf() but not
> really like printf() may violate least surprise.

Well I mean that I don't want to reimplement it, but just using the
same syntax for a tiny subset would be fine.

>
>> We need to encode the data size in there also - byte or integer - so
>> it is not quite the same as what printf is trying to do. While
>> printf() has %c I don't think it is a good idea to use that, since we
>> are printing a byte as a number, not an ASCII character.
>
> Printing a byte value as a number would be %hhx or %hhd in printf.

Ick.

>
>> But it is fairly close to printf, in that you can use:
>>
>> -ts
>> -tx
>> -ti
>> -tu
>> -tix
>> -tbx
>>
>> We could combine -tbx into a single letter somehow but I'm not sure I
>> like that idea.
>>
>> I don't see any point in requiring a % since then users would expect
>> to be able to provide an arbitrary printf() string (see first patch
>> set).
>>
>> So, suggestions please.
>
> So, I think the first thing is I think you need to treat the "format"
> as the primary parameter, with the size (roughly what you're calling
> "type" at the moment) as a subordinate modifier to that. =A0The trouble
> with making format subordinate to type, or supposedly independent
> parameters is that what sizes or "types" are acceptable depends on the
> format. =A0A string format always accepts variable length input, and the
> integer formats always require a specified fixed length. =A0Future
> extensions could conceivably have other constraints.

OK sounds good.

>
> With that basic principle, I basically see two reasonable ways to go.
>
> 1) Use a subset of printf() specifiers. =A0Despite your balking at that,
> I don't really think it would be any harder than what you have now.
> Last character is always the non-optional "format" specifier, anything
> preceding it is modifiers. =A0So for the integer formats "d", "x" and
> "o", valid modifiers are size, either "hh" (1 byte), "h" (2 byte), "l"
> (4 byte, default) or "ll" (8 byte). =A0For the string format "s", no
> modifiers are valid.

OK, I like this option more. Particularly if you think I might get
away with also supporting 'b' as a shortcut for 'hh'.

>
> 2) Treat the size as a different parameter. =A0So the -f option gives a
> single format char (or instead use -s, -x, -d, .. options). =A0Then have
> a -s option for size (-s1 ... -s8) which is valid only with the
> integer format options.
>

More like what I had - have moved away from that and feel more
comfortable in my new space.

>
> Either way does leave a couple of unanswered questions:
>
> A) What to do if the format doesn't consume the whole parameter. =A0I
> see two options:
> =A0 =A0 =A0 =A0A1) Just print as much as the format says, then stop
> =A0 =A0 =A0 =A0A2) Keep repeating the same format until the property is
> consumed (note that this makes sense for "s" as well, and would be an
> obvious way of handling the pretty common list-of-strings properties).

Well I think you have to keep printing. This is not a true format
string, but just a data type for each element. Again we have moved
away from being able to say -f "The %d item is %d and has a flag word
of %d".

So no need to use -tddd if there are three cells - just -td is enough.

>
> B) What to do when the property just doesn't fit into that format -
> either it's length is not a multiple of the fixed integer size, or
> it's not NUL-terminated for "s". =A0Obviously some kind of error is in
> order, but in case A2 above, do we *just* error, or print what we can
> before giving up.

Prefer to error since any output might be confusing. But I will take a
look to make sure that is easy to do.

Thanks very much for your helpful comments. I will work on a new patch set.

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
