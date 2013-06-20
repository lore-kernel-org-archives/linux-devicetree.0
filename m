From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: Add device tree support for phycard pca100
Date: Thu, 20 Jun 2013 17:45:14 +0200
Message-ID: <20130620154514.GE8219@s25.your-server.de>
References: <1371739815-6666-1-git-send-email-mpa@pengutronix.de>
 <1371739815-6666-7-git-send-email-mpa@pengutronix.de>
 <1371741670.186508416@f66.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371741670.186508416-ZzAHCfOzKYkox3rIn2DAYQ@public.gmane.org>
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
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 07:21:10PM +0400, Alexander Shiyan wrote:
> > Based on patches from:
> > 
> > Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> >  - Original patch
> >  - ARM: dts: Set partition offsets for phycard
> >  - ARM: dts: Use CSPI1 instead of CSPI2 on phycard pca100
> >  - ARM: imx27-phytec-phycard-S.dts: resize nand partitions
> > 
> > Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> >  - ARM: dts: Enable bad block table in NAND
> > 
> > Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ...
> > +			gpio@10015000 {
> > +				status = "okay";
> > +			};
> > +
> > +			gpio@10015100 {
> > +				status = "okay";
> > +			};
> > +
> > +			gpio@10015200 {
> > +				status = "okay";
> > +			};
> > +
> > +			gpio@10015300 {
> > +				status = "okay";
> > +			};
> > +
> > +			gpio@10015400 {
> > +				status = "okay";
> > +			};
> > +
> > +			gpio@10015500 {
> > +				status = "okay";
> > +			};
> 
> No need setup status for devices which not disabled in imx27.dts

Thanks, I removed all unnecessary nodes, gpio and wdog.

Regards,

Markus

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
