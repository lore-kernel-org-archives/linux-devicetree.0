From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v2 2/7] pinctrl: imx27: imx27 pincontrol driver
Date: Sat, 31 Aug 2013 08:49:40 +0200
Message-ID: <20130831064940.GW20071@s25.your-server.de>
References: <1376921234-26682-1-git-send-email-mpa@pengutronix.de>
 <1376921234-26682-3-git-send-email-mpa@pengutronix.de>
 <20130821012301.GA30533@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130821012301.GA30533@S2101-09.ap.freescale.net>
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2013 at 09:23:03AM +0800, Shawn Guo wrote:
> On Mon, Aug 19, 2013 at 04:07:09PM +0200, Markus Pargmann wrote:
> > imx27 pincontrol driver using the imx1 core driver. The DT bindings are
> > similar to other imx pincontrol drivers.
> > 
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  .../bindings/pinctrl/fsl,imx27-pinctrl.txt         |  53 +++
> >  drivers/pinctrl/Kconfig                            |   8 +
> >  drivers/pinctrl/Makefile                           |   1 +
> >  drivers/pinctrl/pinctrl-imx27.c                    | 477 +++++++++++++++++++++
> >  4 files changed, 539 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
> >  create mode 100644 drivers/pinctrl/pinctrl-imx27.c
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
> > new file mode 100644
> > index 0000000..016fc89
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
> > @@ -0,0 +1,53 @@
> > +* Freescale IMX27 IOMUX Controller
> > +
> > +Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
> > +and usage.
> 
> Since imx-pinctrl and imx1-pinctrl are now two completely different
> drivers/bindings, is there actually anything from fsl,imx-pinctrl.txt
> could be referred to here?

No, fixed, thanks.

Regards,

Markus

> 
> Shawn
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
