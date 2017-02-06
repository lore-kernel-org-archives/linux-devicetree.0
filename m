From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 6 Feb 2017 11:42:36 -0600
Message-ID: <CAL_JsqJe5KFNhzc9vLimXzi0cot2HjsgD-Het9M=yeXCgDCXqQ@mail.gmail.com>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-4-robh@kernel.org>
 <20170206102933.GV3140@e110455-lin.cambridge.arm.com> <20170206170949.tmm4m2lm2rybm5dh@rob-hp-laptop>
 <20170206172306.GY3140@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206172306.GY3140-A/Nd4k6kWRHZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 11:23 AM, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Feb 06, 2017 at 11:09:49AM -0600, Rob Herring wrote:
>> On Mon, Feb 06, 2017 at 10:29:33AM +0000, Liviu Dudau wrote:
>> > On Fri, Feb 03, 2017 at 09:36:33PM -0600, Rob Herring wrote:
>> > > Convert drivers to use the new of_graph_get_remote_node() helper
>> > > instead of parsing the endpoint node and then getting the remote device
>> > > node. Now drivers can just specify the device node and which
>> > > port/endpoint and get back the connected remote device node. The details
>> > > of the graph binding are nicely abstracted into the core OF graph code.
>> > >
>> > > This changes some error messages to debug messages (in the graph core).
>> > > Graph connections are often "no connects" depending on the particular
>> > > board, so we want to avoid spurious messages. Plus the kernel is not a
>> > > DT validator.

[...]

>> > > - /* add the remote encoder port as component */
>> > > - port = of_graph_get_remote_port_parent(ep);
>> > > - of_node_put(ep);
>> > > - if (!port || !of_device_is_available(port)) {
>> > > -         of_node_put(port);
>> > > -         return -EAGAIN;
>> >
>> > The HDLCD change looks reasonable except for this -EAGAIN business. I'll have to
>> > test your changes on my setup to see how this affects having the encoder as a module.
>>
>> What are you expecting to happen with -EAGAIN? This one was a bit of an
>> oddball.
>
> When both the HDLCD and the TDA998x drivers are compiled as modules, the order in which
> they are inserted can be somewhat random (due to testing). It is at that time when you
> want the probe of HDLCD to be retried on the insmod-ing of the tda998x.ko rather than
> fail entirely.
>
>>
>> This condition would only change if you had an overlay. That's a use
>> case that needs to be handled in a common way ('cause I don't want to
>> clean-up every driver doing overlays in their own way latter). Just
>> having "status" changing at runtime would have all sorts of implications
>> in the kernel.
>
> Hmm, not sure what you mean here with overlays. Are you thinking that the
> remote port is initially disabled and then re-enabled by an overlay? That is
> not the only way of_device_is_available() can fail, see above regarding modules.

Russell pretty much answered most of this, but specifically for
of_device_is_available, the only way of_device_is_available() can
change is a DT change with "status" changing. The only way
of_graph_get_remote_port_parent changes is also from a DT change.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
