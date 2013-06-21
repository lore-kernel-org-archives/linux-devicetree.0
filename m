From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: imx27 cpufreq-cpu0 frequencies
Date: Fri, 21 Jun 2013 09:47:40 +0100
Message-ID: <20130621084740.GA14268@e102568-lin.cambridge.arm.com>
References: <1371739815-6666-1-git-send-email-mpa@pengutronix.de>
 <1371739815-6666-6-git-send-email-mpa@pengutronix.de>
 <20130621024406.GB24268@S2101-09.ap.freescale.net>
 <1371790493.32418815@f415.i.mail.ru>
 <20130621052344.GA25633@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130621052344.GA25633-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Disposition: inline
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2013 at 06:23:46AM +0100, Shawn Guo wrote:
> On Fri, Jun 21, 2013 at 08:54:53AM +0400, Alexander Shiyan wrote:
> > > On Thu, Jun 20, 2013 at 04:50:14PM +0200, Markus Pargmann wrote:
> > > > +	cpus {
> > > > +		#size-cells = <0>;
> > > > +		#address-cells = <1>;
> > > > +
> > > > +		cpu@0 {
> > > > +			device_type = "cpu";
> > > > +			compatible = "fsl,imx27", "arm,arm926ejs";
> > > 
> > > From what Documentation/devicetree/bindings/arm/cpus.txt tells, it
> > > should be "arm,arm926".  Also, why do you put "fsl,imx27" there?
> > > "imx27" is a SoC name not cpu core.
> > 
> > I think Markus take this ARM property from one of existing DTS.
> > 
> > shc@shc /home/git/linux-mx27/arch/arm/boot/dts $ grep arm926 *.dtsi
> > at91sam9260.dtsi:                       compatible = "arm,arm926ejs";
> > at91sam9263.dtsi:                       compatible = "arm,arm926ejs";
> > at91sam9g45.dtsi:                       compatible = "arm,arm926ejs";
> > at91sam9n12.dtsi:                       compatible = "arm,arm926ejs";
> > at91sam9x5.dtsi:                        compatible = "arm,arm926ejs";
> > imx23.dtsi:                     compatible = "arm,arm926ejs";
> > imx28.dtsi:                     compatible = "arm,arm926ejs";
> > lpc32xx.dtsi:                   compatible = "arm,arm926ejs";
> > s3c2416.dtsi:                   compatible = "arm,arm926ejs";
> > spear3xx.dtsi:                  compatible = "arm,arm926ejs";
> > spear600.dtsi:                  compatible = "arm,arm926ejs";
> > wm8505.dtsi:                    compatible = "arm,arm926ejs";
> > 
> > So, documentation need to be updated or these values should be fixed.
> > Another solution  is specify compatible string as:
> > compatible = "arm,arm926ejs", "arm,arm926";
> > What you think about this?
> 
> I assume that the compatible string in the binding doc has been reviewed
> and agreed by people, so we should fix the existing users before kernel
> starts using it to for matching something.
> 
> Lorenzo, comment?

I patched them all and changes are queued through arm-soc, according to the
latest bindings that should get merged this cycle and are available here:

git://linux-arm.org/linux-2.6-lp.git dt-cpus-bindings

If you are queuing dts updates please follow rules in there, waiting for
that document to get merged.

Lorenzo
