From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 6a/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Date: Mon, 29 Jul 2019 17:54:21 -0600
Message-ID: <CAL_JsqKAU3WG3L=KP8A8u4vW=q_BQWPN-m_c+ADOwTioJ2-cmg@mail.gmail.com>
References: <20190722150414.9F97668B20@verein.lst.de> <20190725151829.DC20968B02@verein.lst.de>
 <20190726163601.o32bxqew5xavjgyi@flea> <20190729142258.GB7946@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729142258.GB7946@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kern>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 8:23 AM Torsten Duwe <duwe@lst.de> wrote:
>
> On Fri, Jul 26, 2019 at 06:36:01PM +0200, Maxime Ripard wrote:
> > > +
> > > +  dvdd12-supply:
> > > +    maxItems: 1
> > > +    description: Regulator for 1.2V digital core power.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > > +  dvdd25-supply:
> > > +    maxItems: 1
> > > +    description: Regulator for 2.5V digital core power.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> >
> > There's no need to specify the type here, all the properties ending in
> > -supply are already checked for that type
>
> Ok, thanks for the hint.
>
> > > +  ports:
> > > +    type: object
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    description: |
> > > +      Video port 0 for LVTTL input,
> > > +      Video port 1 for eDP output (panel or connector)
> > > +      using the DT bindings defined in
> > > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> >
> > You should probably describe the port@0 and port@1 nodes here as
> > well. It would allow you to express that the port 0 is mandatory and
> > the port 1 optional, which got dropped in the conversion.
>
> I would have liked to, but have not discovered yet a comprehensive source
> of information about recommended syntax and semantics of the YAML schemes.

The language is json-schema.

> Is there some central reference for these types of issues? I mean not the
> "here is a git repo with the meta-schemes" but sort of a cookbook?

Documentation/devicetree/writing-schema.md (soon .rst) and
Documentation/devicetree/bindings/example-schema.yaml attempt to do
this. Any feedback on them would be helpful.

For this case specifically, we do need to define a common graph
schema, but haven't yet. You can assume we do and only really need to
capture what Maxime said above.

Rob
