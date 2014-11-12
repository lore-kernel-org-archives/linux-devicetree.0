From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Wed, 12 Nov 2014 10:28:57 +0000
Message-ID: <CACxGe6sYy8vY6RjXiCn4O+sM2xcEPW6L5rjoR2GPMWLtKfzRng@mail.gmail.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
 <544F737A.7000109@ti.com> <CAL_JsqJ2JRg7k21CEVe4-At7enD+y3TN_7wfqhY0OHZm-_j17w@mail.gmail.com>
 <544F7E5D.60104@redhat.com> <5450CAA5.5020205@ti.com> <CAL_JsqKWqq+H5ymUW3n8tkmLJHEUGaKDLX5+orJmGUQ3ECQwUQ@mail.gmail.com>
 <20141111214950.7FCABC41610@trevor.secretlab.ca> <CAMuHMdUoPK_s7OP1Aop4eOyhec+abFij7ZoAAdA5fqpJJy-Dgg@mail.gmail.com>
 <CACxGe6sMF2C6hvRNNnB_i6a44fh0WC7JjjisFOh5GMV66mC6Fw@mail.gmail.com> <CAMuHMdVX72ve9TqpA9GUtumZGDnCjYqKemMxyNf=a4AxWR44iQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCJP567ORICBB77MRSRQKGQELVAEWCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMuHMdVX72ve9TqpA9GUtumZGDnCjYqKemMxyNf=a4AxWR44iQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 12, 2014 at 10:08 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Grant,
>
> On Wed, Nov 12, 2014 at 10:57 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>> On Wednesday, November 12, 2014, Geert Uytterhoeven
>> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>>> On Tue, Nov 11, 2014 at 10:49 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
> wrote:
>>> > However, I am concerned about handover. I've lost track over the enti=
re
>>> > thread on whether the handover mechanism has been resolved, and I wou=
ld
>>> > really like to have a proposed solution to this documented in the
>>> > binding. The fact that there is nothing tying the simple framebuffer =
to
>>> > the actual hardware backing the framebuffer is concerning. It means t=
he
>>> > kernel needs to guess which graphics device is associated with the
>>> > framebuffer.
>>>
>>> We did discuss handover in D=C3=BCsseldorf, and concluded that the simp=
lefb's
>>> regs property can be used for this.
>>>
>>> While on a modern system with unified memory this association cannot be
>>> derived in a generic way, a device-specific driver for the graphics har=
dware
>>> can if the regs property of the simplefb node matches the address the C=
RTC
>>> engine is configured for.
>>
>> ???
>>
>> Right, I'm going to be blunt here: That's just dumb. All the
>> capability needed is there in the DT to associate a simple FB to a
>> display controller, and the solution chosen is to use a heuristic?
>>
>> The association needs to be explicit. I strongly prefer putting the
>> simple FB directly into the display controller node, but I would
>> consider phandle linkage also.
>
> IFF there's a display controller node, you can put it there.
> I actually proposed to have a minimal/preliminary display controller node=
,
> but people countered that for various reasons (too many components
> with multiple nodes on many systems, bindings not yet defined, etc.).
>
> And if there's no graphics driver/bindings yet at the time the bootloader
> is written, it doesn't know how to link simplefb with it in DT.
> Hence the heuristic to match regs... Does that make sense?

No, not really. The simplefb binding /should/ make it clear that
handover to the real display controller driver is an expected use
case; therefore the simplefb binding should itemize exactly how that
linkage is supposed to be expressed. When the display controller
binding is written, it should go hand in glove with the simplefb
binding. We want to be sure that generic code can be used to resolve a
display controller with (one of) the simple framebuffers.

It also sounds like some are making the assumption that firmware
should generate the simplefb node from scratch, hence all the hand
wringing about firmware not knowing what extra stuff to put into the
simplefb node. I don't think this is necessary, or even a good
approach. A disabled simplefb node can be put into the dts file with
any dependencies it needs to care about and linkage to the real
display controller. Firmware should be able to locate that node,
update the parameters as needed, and enable it. That gets out of the
cycle of updating firmware in lockstep.

g.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
