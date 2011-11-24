From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] arm/imx6: describe clocks in device tree source
Date: Thu, 24 Nov 2011 09:17:25 +0100
Message-ID: <20111124081725.GV27267@pengutronix.de>
References: <1321926536-671-1-git-send-email-shawn.guo@linaro.org>
 <1321926536-671-2-git-send-email-shawn.guo@linaro.org>
 <20111122085649.GC27267@pengutronix.de>
 <20111124040128.GC17979@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111124040128.GC17979-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2011 at 12:01:29PM +0800, Shawn Guo wrote:
> On Tue, Nov 22, 2011 at 09:56:49AM +0100, Sascha Hauer wrote:
> > On Tue, Nov 22, 2011 at 09:48:54AM +0800, Shawn Guo wrote:
> > > It adds document for imx clock device tree bindings and then describes
> > > imx6 clocks in dts.
> > > 
> > > +
> > > +		ecspi_root_clk: ecspi-root {
> > > +			compatible = "fsl,imx6q-clock";
> > > +			#clock-cells = <1>;
> > > +			imx,clock-divider = <0x38 0 0 19 6>;
> > > +			clock-input = <&pll3_div_clk 2 0 0>;
> > > +			clock-input-name = "pll3-60m";
> > > +			clock-output-name = "ecspi-root";
> > > +		};
> > 
> > I'm not sure you do yourself a favour if you skip all the muxes and
> > assume reset default for them. The ecspi-root parent is a mux The mux
> > seems to be missing in the can clock, uart and probably others.
> > 
> I'm looking at IMX6DQRM.pdf 'Rev. B, 07/2011'.  I do not see mux for
> ECSPI_CLK_ROOT as well as other clocks you mentioned.  Instead, I can
> only see divider for these clocks.  Can you point out the registers
> and bits of these muxes you are seeing with these clocks?

No, I can't find them either ;) I must have looked into the wrong manual
at that moment. Sorry for the noise.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
