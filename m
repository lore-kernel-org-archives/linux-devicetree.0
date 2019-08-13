From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
Date: Tue, 13 Aug 2019 13:07:52 +0200
Message-ID: <CAK8P3a1q9G8VKgNKh+6khzoW3bFTVR_Zorygy=Qqsq-PYzM4=g@mail.gmail.com>
References: <cover.1565367567.git.agx@sigxcpu.org> <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
 <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com> <20190813101057.GB10751@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813101057.GB10751@bogon.m.sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Lee Jones <lee.jones@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 12:10 PM Guido Günther <agx@sigxcpu.org> wrote:
> On Tue, Aug 13, 2019 at 10:08:44AM +0200, Arnd Bergmann wrote:
> > On Fri, Aug 9, 2019 at 6:24 PM Guido Günther <agx@sigxcpu.org> wrote:
> > >
> > > This adds all the gpr registers and the define needed for selecting
> > > the input source in the imx-nwl drm bridge.
> > >
> > > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > > +
> > > +#define IOMUXC_GPR0    0x00
> > > +#define IOMUXC_GPR1    0x04
> > > +#define IOMUXC_GPR2    0x08
> > > +#define IOMUXC_GPR3    0x0c
> > > +#define IOMUXC_GPR4    0x10
> > > +#define IOMUXC_GPR5    0x14
> > > +#define IOMUXC_GPR6    0x18
> > > +#define IOMUXC_GPR7    0x1c
> > (more of the same)
> >
> > huh?
>
> These are the names from the imx8MQ reference manual (general purpose
> registers, they lump together all sorts of things), it's the same on
> imx6/imx7):
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mfd/syscon/imx7-iomuxc-gpr.h
>
> > > +/* i.MX8Mq iomux gpr register field defines */
> > > +#define IMX8MQ_GPR13_MIPI_MUX_SEL              BIT(2)
> >
> > I think this define should probably be local to the pinctrl driver, to
> > ensure that no other drivers fiddle with the registers manually.
>
> The purpose of these bits is for a driver to fiddle with them to select
> the input source. Similar on imx7 it's already used for e.g. the phy
> refclk in the pci controller:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pci-imx6.c#n638

That one should likely use either the clk interface or the phy
interface instead.

> The GPRs are not about pad configuration but gather all sorts of things
> (section 8.2.4 of the imx8mq reference manual): pcie setup, dsi related
> bits so I don't think this should be done via a pinctrl
> driver. Should we handle that differently than on imx6/7?

It would be nice to fix the existing code as well, but for the moment,
I only think we should not add more of that.

Generally speaking, we can use syscon to do random things that don't
have a subsystem of their own, but we should not use it to do things
that have an existing driver framework like pinctrl, clock, reset, phy
etc.

       Arnd
