From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 6/7] usb: chipidea: usbmisc: add mx53 support
Date: Sun, 25 Nov 2012 16:09:31 +0800
Message-ID: <20121125080931.GB16062@nchen-desktop>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de>
 <1353506793-8354-7-git-send-email-m.grzeschik@pengutronix.de>
 <20121123065340.GD22420@nchen-desktop>
 <50AF49A5.6030708@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50AF49A5.6030708-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2012 at 11:02:13AM +0100, Marc Kleine-Budde wrote:
> On 11/23/2012 07:53 AM, Peter Chen wrote:
> > On Wed, Nov 21, 2012 at 03:06:32PM +0100, Michael Grzeschik wrote:
> >> This adds mx53 as the next user of the usbmisc driver and makes it
> >> possible to disable the overcurrent-detection of the internal phy.
> >>
> >> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >> ---
> >> Changes since v2:
> >> * added defines for register offsets and bitmasks
> >> * fixed disable_oc option for all ports
> >>
> >>  drivers/usb/chipidea/usbmisc_imx.c |   51 ++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 51 insertions(+)
> >>
> >> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> >> index e090e0f..b1811df 100644
> >> --- a/drivers/usb/chipidea/usbmisc_imx.c
> >> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> >> @@ -19,6 +19,13 @@
> >>  
> >>  #define USB_DEV_MAX 4
> >>  
> >> +#define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08;
> >> +#define MX53_USB_UH2_CTRL_OFFSET	0x14;
> >> +#define MX53_USB_UH3_CTRL_OFFSET	0x18;
> >> +#define MX53_BM_OVER_CUR_DIS_H1		BIT(5)
> >> +#define MX53_BM_OVER_CUR_DIS_OTG	BIT(8)
> >> +#define MX53_BM_OVER_CUR_DIS_UHx	BIT(30)
> >> +
> >>  #define MX6_BM_OVER_CUR_DIS		BIT(7)
> > 
> > As every SoC platform's non-core register mapping is different,
> > it is better to use .h to put register bit definition
> 
> AFAIK in the kernel we don't make extra .h files any more, if there is
> only a single user of the contents.
OK, if it is the current rule for kernel, then just keep it.
My original mind was there will be more and more bit definition
in future, and move it to .h to make the code clean and short.
> 
> Marc
> -- 
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |
> 



-- 

Best Regards,
Peter Chen
