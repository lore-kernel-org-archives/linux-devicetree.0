From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Wed, 30 Sep 2015 12:13:41 -0500
Message-ID: <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com> <1442823067.3277.35.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442823067.3277.35.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 3:11 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi Rob,
>
> thank you for the comments.
>
> Am Freitag, den 18.09.2015, 15:33 -0500 schrieb Rob Herring:
> [...]
>> > +The display-subsystem node binds together all individual device nodes that
>> > +comprise the DISP subsystem.
>> > +
>> > +Required properties:
>> > +
>> > +- compatible: "mediatek,<chip>-disp"
>>
>> > +- components: Should contain a list of phandles pointing to the DISP function
>> > +  block device nodes.
>> > +- component-names: Should contain the name of the function block pointed to
>> > +  by the components phandle of the same index.
>>
>> NAK. Group these nodes under a parent node, use of-graph or just don't
>> put this into DT. Don't invent a new way.
>
> Ok. The reason I haven't grouped all the display nodes together in the
> first place is that they aren't contiguous in the register space. So
> instead of:
>
>         ovl@1400c000 {
>                 compatible = "mediatek,mt8173-disp-ovl";
>         };
>         ...
>         ufoe@1401a000 {
>                 compatible = "mediatek,mt8173-disp-ufoe";
>         };
>
>         pwm@1401e000 {
>                 compatible = "mediatek,mt8173-disp-pwm";
>         };
>
>         larb@14021000 {
>                 compatible = "mediatek,mt8173-smi-larb";
>         };
>
>         od@14023000 {
>                 compatible = "mediatek,mt8173-disp-od";
>         };
>
> We'd have:
>
>         display-subsystem@1400c00 {
>                 compatible = "mediatek,mt8173-disp", "simple-bus";
>
>                 ovl@1400c000 {
>                         compatible = "mediatek,mt8173-disp-ovl";
>                 };
>                 ...
>                 ufoe@1401a000 {
>                         compatible = "mediatek,mt8173-disp-ufoe";
>                 };
>
>                 od@14023000 {
>                         compatible = "mediatek,mt8173-disp-od";
>                 };
>         };
>
>         pwm@1401e000 {
>                 compatible = "mediatek,mt8173-disp-pwm";
>         };
>
>         larb@14021000 {
>                 compatible = "mediatek,mt8173-smi-larb";
>         };
>
> Note how the display-subsystem node overlaps the larb node. Is that
> acceptable?

Given what the graph looks like, perhaps. However, do you really need
a container node? It only serves to provide a list of nodes (e.g. all
the children) to include as components. There are other ways to
determine this list. You could find all nodes just searching
compatible strings for each component. You just need to bind the drm
driver to some other DT node. Is there no node you can pick as the
master component?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
