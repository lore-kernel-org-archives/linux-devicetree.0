From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND v2 08/12] dt-bindings: add binding
 for generic eDP panel
Date: Mon, 4 Feb 2019 09:07:50 -0800
Message-ID: <CA+E=qVca2g1tkpvYZo-+nJ+v8d7UXFtoxV6t8mAkQkftYDFkZw@mail.gmail.com>
References: <20190203185501.8958-1-anarsoul@gmail.com> <20190203185501.8958-9-anarsoul@gmail.com>
 <20190204074350.GC16448@ulmo> <CA+E=qVecudACOEXt74Kf=UA_F-uuHgEqHzKpYAq1ocMx3Sx+eQ@mail.gmail.com>
 <20190204082353.GE19087@ulmo> <CAL_JsqKt1kOXmRNvkYsQ6AL69+TPZURKpDbKkkEUb2+KZ5hKjQ@mail.gmail.com>
 <20190204165637.GA30876@ulmo>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBAPD4HRAKGQEAJDEA3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190204165637.GA30876@ulmo>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 4, 2019 at 8:56 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > I think it is perfectly fine to have a generic-ish fallback as long as
> > it is just that, a fallback. If the panel has quirks, then you'd
> > better make sure the firmware is stuffing in the right compatibles or
> > that you can update the firmware.
>
> simple-panel would probably work if you stuck in some mostly compatible
> string and provided a ddc-i2c-bus property in the device tree node. The
> generic-ish fallback case could be implemented by providing a fallback
> compatible string (we used to have "simple-panel", which I think would
> still be adequate for this I suppose) and adding a dummy descriptor in
> the driver, perhaps one with pre-defined delays that could be adjusted
> to work for all cases, or they could just be 0. At least that way we'd
> be explicitly documenting that we support this as a fallback.
>
> I'm not sure how you'd want to enforce that people provide the right
> compatible strings that way. Currently there's no way to make your panel
> work without adding a panel driver, so people are forced to write the
> DT bindings and a driver, or add support to an existing one. If we open
> this backdoor, I suspect many people will just take the easy route and
> rely on the fallback. And then what do we do when we get bug reports
> about panels not working, or requiring some quirks. How do we go and
> find out what the right compatible strings are for each board, or how to
> fix things for something we don't have access to.
>
> This all sounds like a Pandora's box to me.

OK, just give me an option that will work on this platform with a
single software image (keep in mind that u-boot aka "firmware" is part
of this image) and that is acceptable for upstream and I'll try to
implement it.

> Thierry
