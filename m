From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v5 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
Date: Tue, 2 Jul 2019 02:22:36 +0000
Message-ID: <VI1PR04MB53271C703961E9DA4C04714A8BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190624020258.21690-1-peter.chen@nxp.com>
 <20190624020258.21690-3-peter.chen@nxp.com>
 <CAL411-r_=44bAi6zupcM7cG7-ivcEH_Mu3YYffoE8Ve0d+xqRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL411-r_=44bAi6zupcM7cG7-ivcEH_Mu3YYffoE8Ve0d+xqRg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>, "balbi@kernel.org" <balbi@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, USB list <linux-usb@vger.kernel.org>, "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

 
> 
> Hi Felipe,
> 
> Would you please have a review for Patch 1 and Patch 2 in this series?
> Thanks.
> 

Ping...

The DTS and controller patches have already queued. Thanks.

Peter

> Peter
> 
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c | 67
> > ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 66 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c
> > b/drivers/usb/phy/phy-mxs-usb.c index 6fa16ab31e2e..70b8c8248caf
> > 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -17,9 +17,11 @@
> >  #include <linux/of_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/mfd/syscon.h>
> > +#include <linux/iopoll.h>
> >
> >  #define DRIVER_NAME "mxs_phy"
> >
> > +/* Register Macro */
> >  #define HW_USBPHY_PWD                          0x00
> >  #define HW_USBPHY_TX                           0x10
> >  #define HW_USBPHY_CTRL                         0x30
> > @@ -37,6 +39,11 @@
> >  #define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
> >  #define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
> >
> > +/* imx7ulp */
> > +#define HW_USBPHY_PLL_SIC                      0xa0
> > +#define HW_USBPHY_PLL_SIC_SET                  0xa4
> > +#define HW_USBPHY_PLL_SIC_CLR                  0xa8
> > +
> >  #define BM_USBPHY_CTRL_SFTRST                  BIT(31)
> >  #define BM_USBPHY_CTRL_CLKGATE                 BIT(30)
> >  #define BM_USBPHY_CTRL_OTG_ID_VALUE            BIT(27)
> > @@ -55,6 +62,12 @@
> >  #define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
> >
> >  #define BM_USBPHY_DEBUG_CLKGATE                        BIT(30)
> > +/* imx7ulp */
> > +#define BM_USBPHY_PLL_LOCK                     BIT(31)
> > +#define BM_USBPHY_PLL_REG_ENABLE               BIT(21)
> > +#define BM_USBPHY_PLL_BYPASS                   BIT(16)
> > +#define BM_USBPHY_PLL_POWER                    BIT(12)
> > +#define BM_USBPHY_PLL_EN_USB_CLKS              BIT(6)
> >
> >  /* Anatop Registers */
> >  #define ANADIG_ANA_MISC0                       0x150
> > @@ -168,6 +181,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
> >         .flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> >  };
> >
> > +static const struct mxs_phy_data imx7ulp_phy_data = { };
> > +
> >  static const struct of_device_id mxs_phy_dt_ids[] = {
> >         { .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
> >         { .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data,
> > }, @@ -175,6 +191,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
> >         { .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
> >         { .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
> >         { .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data,
> > },
> > +       { .compatible = "fsl,imx7ulp-usbphy", .data =
> > + &imx7ulp_phy_data, },
> >         { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids); @@ -199,6 +216,11 @@ static
> > inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
> >         return mxs_phy->data == &imx6sl_phy_data;  }
> >
> > +static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy) {
> > +       return mxs_phy->data == &imx7ulp_phy_data; }
> > +
> >  /*
> >   * PHY needs some 32K cycles to switch from 32K clock to
> >   * bus (such as AHB/AXI, etc) clock.
> > @@ -222,14 +244,49 @@ static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
> >         }
> >  }
> >
> > +static int mxs_phy_pll_enable(void __iomem *base, bool enable)
> > +{
> > +       int ret = 0;
> > +
> > +       if (enable) {
> > +               u32 value;
> > +
> > +               writel(BM_USBPHY_PLL_REG_ENABLE, base +
> HW_USBPHY_PLL_SIC_SET);
> > +               writel(BM_USBPHY_PLL_BYPASS, base +
> HW_USBPHY_PLL_SIC_CLR);
> > +               writel(BM_USBPHY_PLL_POWER, base +
> HW_USBPHY_PLL_SIC_SET);
> > +               ret = readl_poll_timeout(base + HW_USBPHY_PLL_SIC,
> > +                       value, (value & BM_USBPHY_PLL_LOCK) != 0,
> > +                       100, 10000);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
> > +                               HW_USBPHY_PLL_SIC_SET);
> > +       } else {
> > +               writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
> > +                               HW_USBPHY_PLL_SIC_CLR);
> > +               writel(BM_USBPHY_PLL_POWER, base +
> HW_USBPHY_PLL_SIC_CLR);
> > +               writel(BM_USBPHY_PLL_BYPASS, base +
> HW_USBPHY_PLL_SIC_SET);
> > +               writel(BM_USBPHY_PLL_REG_ENABLE, base +
> HW_USBPHY_PLL_SIC_CLR);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> >  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> >  {
> >         int ret;
> >         void __iomem *base = mxs_phy->phy.io_priv;
> >
> > +       if (is_imx7ulp_phy(mxs_phy)) {
> > +               ret = mxs_phy_pll_enable(base, true);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> >         ret = stmp_reset_block(base + HW_USBPHY_CTRL);
> >         if (ret)
> > -               return ret;
> > +               goto disable_pll;
> >
> >         /* Power up the PHY */
> >         writel(0, base + HW_USBPHY_PWD);
> > @@ -267,6 +324,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> >         mxs_phy_tx_init(mxs_phy);
> >
> >         return 0;
> > +
> > +disable_pll:
> > +       if (is_imx7ulp_phy(mxs_phy))
> > +               mxs_phy_pll_enable(base, false);
> > +       return ret;
> >  }
> >
> >  /* Return true if the vbus is there */
> > @@ -388,6 +450,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
> >         writel(BM_USBPHY_CTRL_CLKGATE,
> >                phy->io_priv + HW_USBPHY_CTRL_SET);
> >
> > +       if (is_imx7ulp_phy(mxs_phy))
> > +               mxs_phy_pll_enable(phy->io_priv, false);
> > +
> >         clk_disable_unprepare(mxs_phy->clk);
> >  }
> >
> > --
> > 2.14.1
> >
