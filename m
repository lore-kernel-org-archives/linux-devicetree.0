From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v4 1/3] reset: imx7: Add plubming to support multiple IP variants
Date: Thu, 17 Jan 2019 14:20:42 -0800
Message-ID: <CAHQ1cqHH=pg9QON-PZhr+DDz_JWOUYkzxwcb+xdWvnmB5US8+w@mail.gmail.com>
References: <20181220010700.8598-1-andrew.smirnov@gmail.com>
 <20181220010700.8598-2-andrew.smirnov@gmail.com> <1547745380.4009.18.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547745380.4009.18.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 9:16 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Wed, 2018-12-19 at 17:06 -0800, Andrey Smirnov wrote:
> > In order to enable supporting i.MX8MQ with this driver, convert it to
> > expect variant specific bits to be passed via driver data.
> >
> > Cc: p.zabel@pengutronix.de
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: cphealy@gmail.com
> > Cc: l.stach@pengutronix.de
> > Cc: Leonard Crestez <leonard.crestez@nxp.com>
> > Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> > Cc: Richard Zhu <hongxing.zhu@nxp.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-imx@nxp.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > ---
> >  drivers/reset/reset-imx7.c | 62 +++++++++++++++++++++++++++-----------
> >  1 file changed, 45 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
> > index 77911fa8f31d..3a36d5863891 100644
> > --- a/drivers/reset/reset-imx7.c
> > +++ b/drivers/reset/reset-imx7.c
> > @@ -17,14 +17,29 @@
> >
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/regmap.h>
> >  #include <dt-bindings/reset/imx7-reset.h>
> >
> > +struct imx7_src_signal {
> > +     unsigned int offset, bit;
> > +};
> > +
> > +struct imx7_src;
> > +
> > +struct imx7_src_variant {
> > +     const struct imx7_src_signal *signals;
> > +     unsigned int signals_num;
> > +     unsigned int (*prepare)(struct imx7_src *imx7src, unsigned long id,
> > +                             bool assert);
>
> Instead of adding a function pointer indirection, I'd prefer separate
> imx7_reset_ops and imx8m_reset_ops set by the variant, see below.
>
> > +};
> > +
> >  struct imx7_src {
> >       struct reset_controller_dev rcdev;
> >       struct regmap *regmap;
> > +     const struct imx7_src_variant *variant;
>
> This could then replaced with a direct pointer to the respective signals
> array.
>
> >  };
> >
> >  enum imx7_src_registers {
> > @@ -39,10 +54,6 @@ enum imx7_src_registers {
> >       SRC_DDRC_RCR            = 0x1000,
> >  };
> >
> > -struct imx7_src_signal {
> > -     unsigned int offset, bit;
> > -};
> > -
> >  static const struct imx7_src_signal imx7_src_signals[IMX7_RESET_NUM] = {
> >       [IMX7_RESET_A7_CORE_POR_RESET0] = { SRC_A7RCR0, BIT(0) },
> >       [IMX7_RESET_A7_CORE_POR_RESET1] = { SRC_A7RCR0, BIT(1) },
> > @@ -72,17 +83,11 @@ static const struct imx7_src_signal imx7_src_signals[IMX7_RESET_NUM] = {
> >       [IMX7_RESET_DDRC_CORE_RST]      = { SRC_DDRC_RCR, BIT(1) },
> >  };
> >
> > -static struct imx7_src *to_imx7_src(struct reset_controller_dev *rcdev)
> > +static unsigned int
> > +imx7_src_prepare(struct imx7_src *imx7src, unsigned long id, bool assert)
> >  {
> > -     return container_of(rcdev, struct imx7_src, rcdev);
> > -}
> > -
> > -static int imx7_reset_set(struct reset_controller_dev *rcdev,
> > -                       unsigned long id, bool assert)
> > -{
> > -     struct imx7_src *imx7src = to_imx7_src(rcdev);
> > -     const struct imx7_src_signal *signal = &imx7_src_signals[id];
> > -     unsigned int value = assert ? signal->bit : 0;
> > +     const unsigned int bit = imx7src->variant->signals[id].bit;
> > +     unsigned int value = assert ? bit : 0;
> >
> >       switch (id) {
> >       case IMX7_RESET_PCIEPHY:
> > @@ -95,10 +100,32 @@ static int imx7_reset_set(struct reset_controller_dev *rcdev,
> >               break;
> >
> >       case IMX7_RESET_PCIE_CTRL_APPS_EN:
> > -             value = (assert) ? 0 : signal->bit;
> > +             value = assert ? 0 : bit;
> >               break;
> >       }
> >
> > +     return value;
> > +}
>
> Instead of having a common imx7_reset_set and then calling the custom
> .prepare() through a function pointer, I'd suggest to have custom
> imx7_reset_set and imx8m_reset_set functions that contain the code from
> .prepare() and then call a common function to do the actual register
> access.
>

OK, makes sense, will give it a spin in v5.

Thanks,
Andrey Smirnov
