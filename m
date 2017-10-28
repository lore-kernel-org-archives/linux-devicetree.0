From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: puzzled by online explanation as to how to "overwrite" DT node
Date: Sat, 28 Oct 2017 04:30:22 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1710280413420.7672@localhost.localdomain>
References: <alpine.LFD.2.21.1710180612160.4201@localhost.localdomain> <CAL_JsqLbMaDaGhsCeCj051_P1s5ORz9SUrANdQAeA-cZ+wr0QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLbMaDaGhsCeCj051_P1s5ORz9SUrANdQAeA-cZ+wr0QA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 18 Oct 2017, Rob Herring wrote:

> On Wed, Oct 18, 2017 at 11:40 AM, Robert P. J. Day
> <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
> >
> >   (WARNING: sort of newbie alert, but you know that, right? :-)
> >
> >   was perusing online tutorial on customizing device trees here:
> >
> >     http://developer.toradex.com/device-tree-customization
>
> Never seen that one.

  apparently, i picked a bad example to ask about, then. :-)

> > and got a bit confused about the part describing how to (as i read
> > it) "overwrite" entire nodes.
> >
> >   first, part on "overwriting properties" makes perfect sense --
> > here's an example in that piece about overwriting default USB
> > mode:
> >
> >   &usb0 {
> >       dr_mode = "host";
> >   };
> >
> > so, as i've always understood it, the above will do one of two
> > things:
> >
> >   1) if that property is not set in the node referenced by that label,
> >      it will be *added* to what is already there, or
> >
> >   2) if that property is already set (to whatever), it will be
> >      overwritten
> >
> > so far, so good?
>
> Yes.

  right, that was the easy part.

> >   as a special example of that right below that, there's a short
> > paragraph called "Activating/Deactivating Devices" that uses this
> > example:
> >
> >   &uart4 {
> >       status = "okay";
> >   };
> >
> > but, really, that's just a special case of the first example so
> > there's nothing new here. but it's the next section called
> > "Overwriting nodes" that seems confusing:
> >
> >   "Whole nodes can be overwritten by simply redefining them. Like
> >   overwriting properties, latter definitions overwrite earlier
> >   definitions."
>
> I don't think that's right. I think you have to use /delete-node/
> first.

  right, that was also my limited understanding, so you can
understand my confusion based on what could be interpreted as a claim
that entire nodes could be overwritten.

> > wait, what? entire nodes can be overwritten by redefining them?
> > the example given looks like this:
> >
> >   "E.g. to overwrite the pin configuration of Vybrids UART2 (UART_B)
> >   overwrite the uart2grp node by simply redefining it in your device
> >   tree ..."
> >
> > with the device tree content
> >
> >   &iomuxc {
> >       vf610-colibri {
> >           pinctrl_uart2: uart2grp {
> >               fsl,pins = <
> >                   VF610_PAD_PTD0__UART2_TX        0x21a2
> >                   VF610_PAD_PTD1__UART2_RX        0x21a1
> >               >;
> >           };
> >           ...
> >       };
> >   };
> >
> > hang on ... isn't "vf610-colibri" also a "node" in this device
> > tree? does the above mean that the *entire* vf610-colibri node is
> > being overwritten? and that i would have to supply the entire new
> > content of that node, including simply duplicating the rest of the
> > content that is already there that i want to keep? (is that what
> > the "..." represents?)
>
> No, you should get a merged vf610-colibri node with the original
> contents and any new or overwritten properties from this chunk.
>
> IOW, only properties are overwritten.

  good, that makes *way* more sense, thanks for clarifying that.
followup question coming shortly ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
