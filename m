From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 17/26] drm: sun4i: Add DT bindings documentation
Date: Wed, 3 Feb 2016 14:19:31 -0600
Message-ID: <CAL_JsqLLvK0L+PaOxesgr9u_3hb6EWbb9w2-yw80D8sUqiohTA@mail.gmail.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-18-git-send-email-maxime.ripard@free-electrons.com>
 <20160115031515.GA19797@rob-hp-laptop> <20160203195919.GB3327@lukather>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERB26BZG2QKGQEWGZ5VFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160203195919.GB3327@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel
List-Id: devicetree@vger.kernel.org

On Wed, Feb 3, 2016 at 1:59 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Rob,
>
> On Thu, Jan 14, 2016 at 09:15:15PM -0600, Rob Herring wrote:
>> On Thu, Jan 14, 2016 at 04:25:00PM +0100, Maxime Ripard wrote:
>> > The display pipeline of the Allwinner A10 is involving several loosely
>> > coupled components.
>> >
>> > Add a documentation for the bindings.
>> >
>> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > ---
>> >  .../bindings/display/sunxi/sun4i-drm.txt           | 228 +++++++++++++++++++++

[...]

>> > +Required properties:
>> > +  - compatible: value must be one of:
>> > +    * allwinner,sun5i-a13-display-engine
>> > +  - allwinner,pipelines: list of phandle to the entry points of the
>> > +    pipelines (either to the frontend or backend)
>> > +
>> > +Example:
>> > +
>> > +panel: panel {
>> > +   compatible = "olimex,lcd-olinuxino-43-ts";
>>
>> This should either be a child of what it is attached to or use of-graph.
>
> You had a similar discussion with Thierry last time I sent it, and it
> seemed to settle on keeping that property:
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/382115.html
>
> Has that changed?

No, I still disagree. We already have 2 ways to describe panels: as a
child node of its controller or with of-graph. We don't need a 3rd way
even if it is simple. The problem with of-graph today is too much of
the parsing is left to the individual drivers. We need to fix that and
make it be handled by common code.

Rob
