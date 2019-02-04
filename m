From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND v2 08/12] dt-bindings: add binding
 for generic eDP panel
Date: Mon, 4 Feb 2019 17:56:37 +0100
Message-ID: <20190204165637.GA30876@ulmo>
References: <20190203185501.8958-1-anarsoul@gmail.com>
 <20190203185501.8958-9-anarsoul@gmail.com>
 <20190204074350.GC16448@ulmo>
 <CA+E=qVecudACOEXt74Kf=UA_F-uuHgEqHzKpYAq1ocMx3Sx+eQ@mail.gmail.com>
 <20190204082353.GE19087@ulmo>
 <CAL_JsqKt1kOXmRNvkYsQ6AL69+TPZURKpDbKkkEUb2+KZ5hKjQ@mail.gmail.com>
Reply-To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <linux-sunxi+bncBDTKFPPJUEHRBSG54HRAKGQEU62WBCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAL_JsqKt1kOXmRNvkYsQ6AL69+TPZURKpDbKkkEUb2+KZ5hKjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Feb 04, 2019 at 10:27:09AM -0600, Rob Herring wrote:
> On Mon, Feb 4, 2019 at 2:24 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Mon, Feb 04, 2019 at 12:13:55AM -0800, Vasily Khoruzhick wrote:
> > > On Sun, Feb 3, 2019 at 11:43 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > >
> > > > On Sun, Feb 03, 2019 at 10:54:57AM -0800, Vasily Khoruzhick wrote:
> > > > > eDP panels usually have EDID EEPROM, so there's no need to define panel
> > > > > width/height or any modes/timings in dts. But this panel still may have
> > > > > regulator and/or backlight.
> > > > >
> > > > > Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > ---
> > > > >  .../devicetree/bindings/display/panel/panel-edp.txt        | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.txt
> > > >
> > > > Please don't try to make panels look more generic than they really are.
> > > > You're going to have to provide a compatible string for your device that
> > > > is more specific than "panel-edp". You claim that you don't need any
> > > > extra information that is panel specific, but you don't know that now.
> > > > We have in the past thought that we didn't need things like prepare
> > > > delay, but then we ran into situations where we did need them.
> > > >
> > > > Just do what everybody else does. Provide a specific compatible string
> > > > and match on that in the panel-simple driver. Even if you can read all
> > > > the video timings from an EDID EEPROM, you can still provide a mode in
> > > > the panel descriptor to serve as a fallback if for example the EEPROM
> > > > is faulty on some device.
> > >
> > > Pinebook used several 768p panels that have slightly different timings
> > > and recent batch uses 1080p panel.
> > >
> > > What panel descriptor should I use as fallback?
> >
> > You don't use panel descriptors as fallback. The simple-panel driver
> > will bind to a panel device and use the corresponding descriptor. If
> > your device tree contains the correct information, the descriptor is
> > correct for the panel you have.
> >
> > In other words you need to ensure that you have the correct panel in
> > device tree for the board that you're using. This is exactly the same
> > thing as for other devices.
> >
> > One way to to this is to have separate device trees for each variant
> > of the board that you want to support. Another variant may be to have
> > a common device tree and then have some early firmware update the DTB
> > with the correct panel information.
> 
> That can be a pain to manage especially if panels are swapped run to
> run with 2nd sources.
> 
> I think it is perfectly fine to have a generic-ish fallback as long as
> it is just that, a fallback. If the panel has quirks, then you'd
> better make sure the firmware is stuffing in the right compatibles or
> that you can update the firmware.

simple-panel would probably work if you stuck in some mostly compatible
string and provided a ddc-i2c-bus property in the device tree node. The
generic-ish fallback case could be implemented by providing a fallback
compatible string (we used to have "simple-panel", which I think would
still be adequate for this I suppose) and adding a dummy descriptor in
the driver, perhaps one with pre-defined delays that could be adjusted
to work for all cases, or they could just be 0. At least that way we'd
be explicitly documenting that we support this as a fallback.

I'm not sure how you'd want to enforce that people provide the right
compatible strings that way. Currently there's no way to make your panel
work without adding a panel driver, so people are forced to write the
DT bindings and a driver, or add support to an existing one. If we open
this backdoor, I suspect many people will just take the easy route and
rely on the fallback. And then what do we do when we get bug reports
about panels not working, or requiring some quirks. How do we go and
find out what the right compatible strings are for each board, or how to
fix things for something we don't have access to.

This all sounds like a Pandora's box to me.

Thierry
--k+w/mQv8wyuph6w0--
