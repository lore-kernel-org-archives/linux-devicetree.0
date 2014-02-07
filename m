From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 06/15] dt: binding: add binding for ImgTec IR block
Date: Fri, 7 Feb 2014 16:29:36 -0600
Message-ID: <CAL_JsqLRt71vhvjBofYC9WzgA+jco2q5PY=+7bnbkihWDcG0pQ@mail.gmail.com>
References: <1389967140-20704-1-git-send-email-james.hogan@imgtec.com>
	<1389967140-20704-7-git-send-email-james.hogan@imgtec.com>
	<CAL_Jsq+wk6_9Da5Xj3Ys-MZYPTpu6V3pAEpGFv44148BodmmrQ@mail.gmail.com>
	<52F39F30.70104@imgtec.com>
	<CAL_JsqLL6MbwajCUAm+NJk=ofL5OHq8b0zwO3LFb-TKY6UtVMQ@mail.gmail.com>
	<20140207145053.GF25314@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140207145053.GF25314-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 7, 2014 at 8:50 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Rob,
>
> On Fri, Feb 07, 2014 at 02:33:27PM +0000, Rob Herring wrote:
>> On Thu, Feb 6, 2014 at 8:41 AM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>> > Hi Rob,
>> >
>> > On 06/02/14 14:33, Rob Herring wrote:
>> >> On Fri, Jan 17, 2014 at 7:58 AM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>> >>> +Required properties:
>> >>> +- compatible:          Should be "img,ir1"
>> >>
>> >> Kind of short for a name. I don't have anything much better, but how
>> >> about img,ir-rev1.
>> >
>> > Okay, that sounds reasonable.
>> >
>> >>> +Optional properties:
>> >>> +- clocks:              List of clock specifiers as described in standard
>> >>> +                       clock bindings.
>> >>> +- clock-names:         List of clock names corresponding to the clocks
>> >>> +                       specified in the clocks property.
>> >>> +                       Accepted clock names are:
>> >>> +                       "core": Core clock (defaults to 32.768KHz if omitted).
>> >>> +                       "sys":  System side (fast) clock.
>> >>> +                       "mod":  Power modulation clock.
>> >>
>> >> You need to define the order of clocks including how they are
>> >> interpreted with different number of clocks (not relying on the name).
>> >
>> > Would it be sufficient to specify that "clock-names" is required if
>> > "clocks" is provided (i.e. unnamed clocks aren't used), or is there some
>> > other reason that clock-names shouldn't be relied upon?
>>
>> irq-names, reg-names, clock-names, etc. are considered optional to
>> their associated property and the order is supposed to be defined.
>> clock-names is a bit different in that clk_get needs a name, so it
>> effectively is required by Linux when there is more than 1 clock.
>> Really, we should fix Linux.
>
> If they're optional then you can't handle optional entries (i.e.  when
> nothing's wired to an input), and this is counter to the style I've been
> recommending to people (defining clocks in terms of clock-names).
>
> I really don't see the point in any *-names property if they don't
> define the list and allow for optional / reordered lists. Why does the
> order have to be fixed rather than using the -names properties? It's
> already a de-facto standard.

Maybe for clocks, but I don't think we should treat clocks differently
from other properties. We've already got enough variation in binding
styles, I'd like to be consistent across interrupts, reg, clocks, etc.

>> Regardless, my other point is still valid. A given h/w block has a
>> fixed number of clocks. You may have them all connected to the same
>> source in some cases, but that does not change the number of inputs.
>> Defining what are the valid combinations needs to be done. Seems like
>> this could be:
>>
>> <none> - default to 32KHz
>> <core> - only a "baud" clock
>> <core>, <sys>, <mod> - all clocks
>
> For more complex IP blocks you might have more inputs than you actually
> have clocks wired to.
>
> How do you handle an unwired input in the middle of the list, or a new
> revision of the IP block that got rid of the first clock input from the
> list but is otherwise compatible?

fixed-clock with freq of 0 for unwired (really wired to gnd) inputs?

With a new compatible string if it is a new block.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
