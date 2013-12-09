From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v5 09/15] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Mon, 9 Dec 2013 17:07:50 +0800
Message-ID: <20131209090749.GB5291@shlinux1.ap.freescale.net>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com>
 <1386570664-6713-10-git-send-email-peter.chen@freescale.com>
 <52A58179.2050702@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <52A58179.2050702@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rob.herring@calxeda.com, balbi@ti.com, kernel@pengutronix.de, grant.likely@linaro.org, shawn.guo@linaro.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 09, 2013 at 09:38:17AM +0100, Marc Kleine-Budde wrote:
> On 12/09/2013 07:30 AM, Peter Chen wrote:
> > Some PHY bugs are fixed by IC logic, but these bits are not
> > enabled by default, so we enable them at driver.
> 
> Which bugs are fixed by enabling this bit? Is it only suspend related?
> Can you document them or better add a pointer to the documentation.

I will add more, in fact, it fixes the bug which flag BIT(1) and BIT(2)
stands for.

> 
> Further I don't like the idea of adding code, or enabling a feature on
> certain hardware, that is broken in the first place and fixing it in a
> later patch. Think about squashing it into the correct patch.

No fixes are related with this patch, you can see there is no "-"
at this patch.

> >  
> > +static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
> > +{
> > +	return mxs_phy->data == &imx6q_phy_data;
> > +}
> > +
> > +static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
> > +{
> > +	return mxs_phy->data == &imx6sl_phy_data;
> > +}
> 
> Are the two is_imx6* functions still needed?

Will more it to [14/15], they are needed there.

Peter

> 
> > +
> >  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> >  {
> >  	int ret;
> > @@ -123,6 +144,9 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
> >  		BM_USBPHY_CTRL_ENUTMILEVEL3,
> >  	       base + HW_USBPHY_CTRL_SET);
> >  
> > +	if (mxs_phy->data->flags & MXS_PHY_NEED_IP_FIX)
> > +		writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
> > +
> >  	return 0;
> >  }
> 
> Marc
> 
> -- 
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |
> 



-- 

Best Regards,
Peter Chen
