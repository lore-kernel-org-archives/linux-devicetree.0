From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 01/11] staging: drm/imx: Add LDB support
Date: Tue, 26 Mar 2013 16:38:29 +0100
Message-ID: <1364312309.4085.16.camel@pizza.hi.pengutronix.de>
References: <1364307246-9017-1-git-send-email-p.zabel@pengutronix.de>
 <1364307246-9017-2-git-send-email-p.zabel@pengutronix.de>
 <20130326153455.5a093e15@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130326153455.5a093e15@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Martin Fuzzey <mfuzzey@parkeon.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

Am Dienstag, den 26.03.2013, 15:34 +0100 schrieb Thomas Petazzoni:
> Dear Philipp Zabel,
> 
> On Tue, 26 Mar 2013 15:13:56 +0100, Philipp Zabel wrote:
> 
> > +/*
> > + * For a device declaring compatible = "fsl,imx6q-ldb", "fsl,imx53-ldb",
> > + * of_match_device will walk through this list and take the first entry
> > + * matching any of its compatible values. Therefore, the more generic
> > + * entries (in this case fsl,imx53-ldb) need to be ordered last.
> > + */
> > +static const struct of_device_id imx_ldb_dt_ids[] = {
> > +	{ .compatible = "fsl,imx6q-ldb", .data = imx6q_lvds_mux, },
> > +	{ .compatible = "fsl,imx53-ldb", .data = NULL, },
> > +	{ }
> > +};
> 
> You probably want a new DT binding documentation in
> Documentation/devicetree/bindings/.

Yes, this could be something along the lines of:

Device-Tree bindings for LVDS Display Bridge (ldb)

LVDS Display Bridge
===================

The LVDS Display Bridge device tree node contains up to two lvds-channel
nodes describing each of the two LVDS encoder channels of the bridge.

Required properties:
 - #address-cells : should be <1>
 - #size-cells : should be <0>
 - compatible : should be "fsl,imx53-ldb" or "fsl,imx6q-ldb".
                Both LDB versions are similar, but i.MX6 has an additional
                multiplexer in the front to select any of the four IPU display
                interfaces as input.
 - gpr : should be <&gpr> on i.MX53 and i.MX6q.
         The phandle points to the iomuxc-gpr region containing the LVDS
         control register.
 - clocks : phandles pointing to the LDB display interface clocks, LDB source
            selector clocks
- clocks, clock-names : phandles to the LDB divider and selector clocks and to
                        the display interface selector clocks, as described in
                        Documentation/devicetree/bindings/clock/clock-bindings.txt
	The following clocks are expected on i.MX53:
		"di0_pll" - LDB LVDS channel 0 mux
		"di1_pll" - LDB LVDS channel 1 mux
		"di0" - LDB LVDS channel 0 gate
		"di1" - LDB LVDS channel 1 gate
		"di0_sel" - IPU1 DI0 mux
		"di1_sel" - IPU1 DI1 mux
	On i.MX6q the following additional clocks are needed:
		"di2_sel" - IPU2 DI0 mux
		"di3_sel" - IPU2 DI1 mux
	The needed clock numbers for each are documented in
	Documentation/devicetree/bindings/clock/imx5-clock.txt, and in
	Documentation/devicetree/bindings/clock/imx6q-clock.txt.

Optional properties:
 - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q
 - pinctrl-0 : should be <&pinctrl_lvds1_1> on i.MX53, not used on i.MX6q
 - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
   be configured - one input will be distributed on both outputs in dual
   channel mode

LVDS Channel
============

Each LVDS Channel has to contain a display-timings node that describes the
video timings for the connected LVDS display. For detailed information,
have a look at Documentation/devicetree/bindings/video/display-timing.txt.

Required properties:
 - reg : should be <0> or <1>
 - crtcs : a list of phandles with index pointing to the IPU display interfaces
           that can be used as video source for this channel.
 - fsl,data-mapping : should be "spwg" or "jeida"
                      This describes how the color bits are laid out in the
                      serialized LVDS signal.
 - fsl,data-width : should be <18> or <24>

Example:

        gpr: iomuxc-gpr@53fa8000 {
                /* ... */
        };

        ldb: ldb@53fa8008 {
                #address-cells = <1>;
                #size-cells = <0>;
                compatible = "fsl,imx53-ldb";
                gpr = <&gpr>;
                clocks = <&clks 122>, <&clks 120>,
                         <&clks 115>, <&clks 116>,
                         <&clks 123>, <&clks 85>;
                clock-names = "di0_pll", "di1_pll",
                              "di0_sel", "di1_sel",
                              "di0", "di1";

                lvds-channel@0 {
                        reg = <0>;
                        crtcs = <&ipu 0>;
                        fsl,data-mapping = "spwg";
                        fsl,data-width = <24>;

                        display-timings {
                                /* ... */
                        };
                };

                lvds-channel@1 {
                        reg = <1>;
                        crtcs = <&ipu 1>;
                        fsl,data-mapping = "spwg";
                        fsl,data-width = <24>;

                        display-timings {
                                /* ... */
                        };
                };
        };

thanks
Philipp
