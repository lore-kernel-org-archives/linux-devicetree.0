From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/bridge: Add ti-tfp410 DVI transmitter driver
Date: Wed, 23 Nov 2016 16:30:45 -0600
Message-ID: <CAL_Jsq+CkXcj4Zby7vQtZq=Rttq-drT+7bp9eP81N3bfSXcz6A@mail.gmail.com>
References: <cover.1479142062.git.jsarha@ti.com> <20161116133331.miem6us563uu62t7@rob-hp-laptop>
 <506ba969-d753-d026-5357-3329a750ceaf@ti.com> <1829466.vPTafcVR8L@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1829466.vPTafcVR8L@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2016 at 3:45 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> Hi Jyri,
>
> On Wednesday 16 Nov 2016 16:39:28 Jyri Sarha wrote:
>> On 11/16/16 15:33, Rob Herring wrote:
>> >> +Optional properties
>> >>
>> >>> + - reg: I2C address. If and only if present the driver node
>
> I assume you meant device node, not driver node ?
>
>> >>> +   should be placed into the i2c controller node where the
>> >>> +   tfp410 i2c is connected to (the current implementation does
>> >>> +   not yet support this).
>> >
>> > So this chip can work without programming I guess?
>>
>> Yes. Just powering it up is enough for most application.
>>
>> > reg should only be not present if I2C is not connected in the design. It
>> > can't be a function of what the driver supports. In otherwords, you
>> > can't be moving this node around based on when you add I2C control.
>>
>> Ok, I'll try to implement a dummy i2c driver at the same time too. I can
>> not test anything related to it because I do not have a piece of HW with
>> tfp410 i2c wires connected, but it should not matter as long as I am
>> able to probe it as a i2c client.
>
> I think that Rob's point was that whether the current implementation supports
> this or not is irrelevant from a DT bindings point of view. It should not be
> mentioned in the bindings document.

Right. Now, whether the h/w has I2C wires connected or not is relevant
to the binding doc. So the doc just needs some rewording, a dummy
driver isn't needed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
