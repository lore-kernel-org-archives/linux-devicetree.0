From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: imx27: Add imx framebuffer device
Date: Mon, 1 Jul 2013 17:30:34 +0800
Message-ID: <20130701093032.GG13206@S2101-09.ap.freescale.net>
References: <1372431037-13519-1-git-send-email-mpa@pengutronix.de>
 <1372431037-13519-3-git-send-email-mpa@pengutronix.de>
 <1372432206.785926201@f326.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372432206.785926201-iyhzTVcwrO4edp2WBT/QOw@public.gmane.org>
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
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2013 at 07:10:06PM +0400, Alexander Shiyan wrote:
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx27.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
> > index 8603886..10dcbd3 100644
> > --- a/arch/arm/boot/dts/imx27.dtsi
> > +++ b/arch/arm/boot/dts/imx27.dtsi
> > @@ -342,6 +342,15 @@
> >  			reg = <0x10020000 0x20000>;
> >  			ranges;
> >  
> > +			imxfb: fb@10021000 {
> 
> If it can be fixed while applying, it would be right to use just "fb" here.
> We now use a lot of devices without "imx"-prefix, so I do not see any need to use it here.

I actually prefer to use the block name if it's not a thing defined by
ePAPR.  In this case, it's "lcdc".  But since "fb" is already used in
compatible.  Okay, I fixed it up by dropping "imx" prefix.

Applied the whole series, thanks.

Shawn
