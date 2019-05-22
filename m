From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] [PATCH 3/6] drm/sun4i: dsi: Add bridge support
Date: Wed, 22 May 2019 17:31:10 +0530
Message-ID: <CAMty3ZC=cLNbJAeDBGCyYrknB5LWriL-pisk7j=jXQ54bse7XQ@mail.gmail.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-4-jagan@amarulasolutions.com> <c232d5620d6a3272a6064ce9ccdec5c86a3a7950.camel@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c232d5620d6a3272a6064ce9ccdec5c86a3a7950.camel@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Hi Paul and Maxime,

On Fri, Mar 15, 2019 at 7:03 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
> > Some display panels would come up with a non-DSI output which
> > can have an option to connect DSI interface by means of bridge
> > convertor.
> >
> > This DSI to non-DSI bridge convertor would require a bridge
> > driver that would communicate the DSI controller for bridge
> > functionalities.
> >
> > So, add support for bridge functionalities in Allwinner DSI
> > controller.
>
> See a few comments below.
>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 65 +++++++++++++++++++-------
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 +
> >  2 files changed, 49 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 0960b96b62cc..64d74313b842 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -781,6 +781,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >       if (!IS_ERR(dsi->panel))
> >               drm_panel_prepare(dsi->panel);
> >
> > +     if (!IS_ERR(dsi->bridge))
> > +             drm_bridge_pre_enable(dsi->bridge);
> > +
> >       /*
> >        * FIXME: This should be moved after the switch to HS mode.
> >        *
> > @@ -796,6 +799,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >       if (!IS_ERR(dsi->panel))
> >               drm_panel_enable(dsi->panel);
> >
> > +     if (!IS_ERR(dsi->bridge))
> > +             drm_bridge_enable(dsi->bridge);
> > +
> >       sun6i_dsi_start(dsi, DSI_START_HSC);
> >
> >       udelay(1000);
> > @@ -812,6 +818,9 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> >       if (!IS_ERR(dsi->panel)) {
> >               drm_panel_disable(dsi->panel);
> >               drm_panel_unprepare(dsi->panel);
> > +     } else if (!IS_ERR(dsi->bridge)) {
> > +             drm_bridge_disable(dsi->bridge);
> > +             drm_bridge_post_disable(dsi->bridge);
> >       }
> >
> >       phy_power_off(dsi->dphy);
> > @@ -973,11 +982,16 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> >       struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> >
> >       dsi->device = device;
> > -     dsi->panel = of_drm_find_panel(device->dev.of_node);
> > -     if (IS_ERR(dsi->panel))
> > -             return PTR_ERR(dsi->panel);
> >
> > -     dev_info(host->dev, "Attached device %s\n", device->name);
> > +     dsi->bridge = of_drm_find_bridge(device->dev.of_node);
> > +     if (!dsi->bridge) {
>
> You are using IS_ERR to check that the bridge is alive in the changes
> above, but switch to checking that it's non-NULL at this point.
>
> Are both guaranteed to be interchangeable?
>
> > +             dsi->panel = of_drm_find_panel(device->dev.of_node);
> > +             if (IS_ERR(dsi->panel))
> > +                     return PTR_ERR(dsi->panel);
> > +     }
>
> You should probably use drm_of_find_panel_or_bridge instead of
> duplicating the logic here.

True, In-fact I did try this API. but pipeline were unable to bound.
Usually the panel and bridge were attached first and then the pipeline
bound would start from front-end (in A33) But in my below cases I have
seen only panel or bridge attached but no pipeline bound at all.

And I'm using drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
&dsi->panel, &dsi->bridge); in dsi attach API.

Case-1, panel:

&dsi {
    vcc-dsi-supply = <&reg_dcdc1>;        /* VCC3V3-DSI */
    status = "okay";

    ports {
        dsi_out: port@1 {
            reg = <1>;

            dsi_out_panel: endpoint {
                remote-endpoint = <&panel_out_dsi>;
            };
        };
    };

    panel@0 {
        compatible = "bananapi,s070wv20-ct16-icn6211";
        reg = <0>;
        enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
        reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
        backlight = <&backlight>;

        port {
            panel_out_dsi: endpoint {
                remote-endpoint = <&dsi_out_panel>;
            };
        };
    };
};

Case-2, bridge:

    panel {
        compatible = "bananapi,s070wv20-ct16", "simple-panel";
        enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
        backlight = <&backlight>;

        port {

            panel_out_bridge: endpoint {
                remote-endpoint = <&bridge_out_panel>;
            };
        };
    };

&dsi {
    vcc-dsi-supply = <&reg_dcdc1>;        /* VCC-DSI */
    status = "okay";

    ports {
        dsi_out: port@1 {
            reg = <1>;

            dsi_out_bridge: endpoint {
                remote-endpoint = <&bridge_out_dsi>;
            };
        };
    };

    bridge@0 {
        reg = <0>;
        compatible = "bananapi,icn6211", "chipone,icn6211";
        reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
        #address-cells = <1>;
        #size-cells = <0>;

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            bridge_in: port@0 {
                reg = <0>;

                bridge_out_dsi: endpoint {
                    remote-endpoint = <&dsi_out_bridge>;
                };
            };

            bridge_out: port@1 {
                reg = <1>;

                bridge_out_panel: endpoint {
                    remote-endpoint = <&panel_out_bridge>;
                };
            };
        };
    };
};

I think, I'm sure about the pipeline connections as per my
understanding. but something loosely missed here or in the code.
Please do let me know for any suggestions.

Jagan.
