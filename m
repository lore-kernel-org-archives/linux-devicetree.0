From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v7 06/14] usb: phy-mxs: Add anatop regmap
Date: Tue, 24 Dec 2013 09:20:11 +0800
Message-ID: <20131224012010.GA13518@shlinux1.ap.freescale.net>
References: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
 <1387525930-27313-7-git-send-email-peter.chen@freescale.com>
 <20131224001457.GA1128@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131224001457.GA1128@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rob.herring@calxeda.com, balbi@ti.com, kernel@pengutronix.de, grant.likely@linaro.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 24, 2013 at 08:15:00AM +0800, Shawn Guo wrote:
> On Fri, Dec 20, 2013 at 03:52:02PM +0800, Peter Chen wrote:
> > It is needed by imx6 SoC series, but not for imx23 and imx28.
> > 
> > Signed-off-by: Peter Chen <peter.chen@freescale.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c |   23 +++++++++++++++++++++--
> >  1 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 0c6f3bc..0ef930a 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -21,6 +21,8 @@
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> >  #include <linux/of_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> >  
> >  #define DRIVER_NAME "mxs_phy"
> >  
> > @@ -58,6 +60,9 @@
> >   */
> >  #define MXS_PHY_SENDING_SOF_TOO_FAST		BIT(2)
> >  
> > +/* The SoCs who have anatop module */
> > +#define MXS_PHY_HAS_ANATOP			BIT(3)
> > +
> >  struct mxs_phy_data {
> >  	unsigned int flags;
> >  };
> > @@ -68,11 +73,13 @@ static const struct mxs_phy_data imx23_phy_data = {
> >  
> >  static const struct mxs_phy_data imx6q_phy_data = {
> >  	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
> > -		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> > +		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> > +		MXS_PHY_HAS_ANATOP,
> >  };
> >  
> >  static const struct mxs_phy_data imx6sl_phy_data = {
> > -	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> > +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> > +		MXS_PHY_HAS_ANATOP,
> >  };
> >  
> >  static const struct of_device_id mxs_phy_dt_ids[] = {
> > @@ -87,6 +94,7 @@ struct mxs_phy {
> >  	struct usb_phy phy;
> >  	struct clk *clk;
> >  	const struct mxs_phy_data *data;
> > +	struct regmap *regmap_anatop;
> >  };
> >  
> >  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> > @@ -190,6 +198,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
> >  	int ret;
> >  	const struct of_device_id *of_id =
> >  			of_match_device(mxs_phy_dt_ids, &pdev->dev);
> > +	struct device_node *np = pdev->dev.of_node;
> >  
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	base = devm_ioremap_resource(&pdev->dev, res);
> > @@ -226,6 +235,16 @@ static int mxs_phy_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, mxs_phy);
> >  
> > +	if (mxs_phy->data->flags & MXS_PHY_HAS_ANATOP) {
> > +		mxs_phy->regmap_anatop = syscon_regmap_lookup_by_phandle
> > +			(np, "fsl,anatop");
> > +		if (IS_ERR(mxs_phy->regmap_anatop)) {
> > +			dev_dbg(&pdev->dev,
> > +				"failed to find regmap for anatop\n");
> > +			return PTR_ERR(mxs_phy->regmap_anatop);
> 
> I'm looking at the merge dependency that Felipe mentions, and just think
> of the DTB compatibility thing.  Does the above code mean that USB will
> be broken if someone runs the new kernel with an old DTB on his board?
> 
> We're entering the stage where we need to maintain the DTB compatibility
> in kernel.  That said, if users choose to upgrade their kernel only
> (running with an old DTB), it's okay we do not give them new
> features, but we shouldn't cause any regression/breakage for them.
> 

Then, this patch needs to change for old imx6 DTB. I will use of_find_property 
like my previous version patch, do you think so?

http://marc.info/?l=linux-usb&m=138361742123380&w=2

I will send v8 just for this one (using my v3 patch) if you think two dts
related patches are ok.

-- 

Best Regards,
Peter Chen
