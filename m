From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 09/12] dt-bindings: panel: Add Bananapi
 S070WV20-CT16 MIPI-DSI panel bindings
Date: Mon, 22 Oct 2018 11:22:26 +0100
Message-ID: <CAGb2v64QEhy1J05L9W0_uWhmrky8wD+vg3v5wA7Yd3_U-DdpKg@mail.gmail.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-10-jagan@amarulasolutions.com> <20181015182448.GA7134@bogus>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4WJW3PAKGQEMTJ3BKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181015182448.GA7134@bogus>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Oct 15, 2018 at 7:24 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Thu, 27 Sep 2018 17:18:47 +0530, Jagan Teki wrote:
> > Bananapi S070WV20-CT16 is 800x480, 4-lane MIPI-DSI panel, the
> > same panel PCB comes with parallel RBG which is supported via
> > panel-simple with "bananapi,s070wv20-ct16" compatible.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  .../panel/bananapi,s070wv20-ct16-dsi.txt      | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt
> >
>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This "panel" is actually an RGB panel with a MIPI-DSI-to-RGB bridge
tacked on. On one particular revision of this module, one can also
directly use the RGB interface.

Would it be better to model this as bridge+panel? We already have
a binding for the RGB version [1]. This would make it harder to
make a driver though, as there is no publicly available datasheet
for the bridge chip, so it's likely that part of the init sequence
would have to be hard-coded.

Thanks
ChenYu

[1] Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
