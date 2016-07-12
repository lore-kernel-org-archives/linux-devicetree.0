From: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Tue, 12 Jul 2016 16:07:49 +0100
Message-ID: <CAPhXvM5nCbP81ujx3dhy9GvibdoBDy+N8EuArJj2-RFKO3ixfQ@mail.gmail.com>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com> <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160712143404.GD16355-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 12, 2016 at 3:34 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
>> On 11/07/2016 20:56, Maxime Ripard wrote:
> [snip]
>
>> > +static int overlay_merge(void *fdt, void *fdto)
>> > +{
>> > +   int fragment;
>> > +
>> > +   fdt_for_each_subnode(fragment, fdto, 0) {
>> > +           int overlay;
>> > +           int target;
>> > +           int ret;
>> > +
>> > +           target = overlay_get_target(fdt, fdto, fragment);
>> > +           if (target < 0)
>> > +                   continue;
>> > +
>> > +           overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
>> > +           if (overlay < 0)
>> > +                   return overlay;
>
>> Why does the absence of a target cause a fragment to be ignored but
>> the absence of an "__overlay__" property cause the merging to be
>> abandoned with an error? Can't we just ignore fragments that aren't
>> recognised?
>
> So, I had the same question.  But fragments we can't make sense MUST
> cause failures, and not be silently ignored.
>
> An incompletely applied overlay is almost certainly going to cause you
> horrible grief at some point, so you absolutely want to know early if
> your overlay is in a format your tool doesn't understand.

Cards on the table time - at Raspberry Pi we've found it convenient to
selectively enable or disable fragments within an overlay based on
user-supplied parameters. The way I've implemented this is by using
"__dormant__" as an antonym to "__overlay__" (partly chosen because it
is the same length), and then pre-processing the overlay before
applying it. This scheme works with the kernel overlay support and our
firmware loader (obviously).

Although I could invent a similar scheme that uses antonyms of
"target" and "target-path", I don't see why this is inherently safer.

Phil (phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org)
