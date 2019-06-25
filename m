From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel
 to DT schema
Date: Tue, 25 Jun 2019 08:25:51 -0600
Message-ID: <CAL_Jsq+45dKRMdRCjfKgEkvsk1MLyeXnY4fjZmh50WLweyJfCg@mail.gmail.com>
References: <20190624215649.8939-1-robh@kernel.org> <20190624215649.8939-11-robh@kernel.org>
 <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
 <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com> <CACRpkdYnSZibUyhe5D8W259fCJBm05rG0_EmX+uoi=uqbrqEYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYnSZibUyhe5D8W259fCJBm05rG0_EmX+uoi=uqbrqEYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 2:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 25, 2019 at 12:47 AM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Jun 24, 2019 at 4:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Mon, Jun 24, 2019 at 11:59 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > > Convert the tpo,tpg110 panel binding to DT schema.
> > > >
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > Awesome, fixed up the MAINATINERS entry and applied and
> > > pushed for DRM next with my Reviewed-by.
> >
> > You shouldn't have because this is dependent on patch 2 and
> > panel-common.yaml. So now 'make dt_binding_check' is broken.
>
> Ooops easily happens when I am only adressee on this patch and
> there is no mention of any dependencies.

It's a series. I would assume the default is 1 person applies a series
unless explicitly stated otherwise.

> Can I simply just merge the panel-common patch as well and we
> are all happy?

I have drm-misc commit rights too, so I'll apply the whole lot when it's ready.

> I can also pick up more panel binding patches, IMO the yaml
> conversions are especially uncontroversial and should have low
> threshold for merging.

Yes, but the threshold is at least 'make dt_binding_check' should not
break. But don't worry, there are 2 other breakages in linux-next
currently.

Rob
