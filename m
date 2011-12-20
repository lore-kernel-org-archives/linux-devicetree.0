From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mfd: mc13xxx: add device tree probe support
Date: Tue, 20 Dec 2011 23:25:27 +0000
Message-ID: <20111220232526.GA6551@opensource.wolfsonmicro.com>
References: <1323702958-4831-1-git-send-email-shawn.guo@linaro.org>
 <1323702958-4831-2-git-send-email-shawn.guo@linaro.org>
 <20111220005708.GM2860@opensource.wolfsonmicro.com>
 <20111220020101.GD5683@S2100-06.ap.freescale.net>
 <20111220015931.GX2860@opensource.wolfsonmicro.com>
 <20111220030347.GB2995@S2101-09.ap.freescale.net>
 <20111220112510.GL2866@opensource.wolfsonmicro.com>
 <20111220135251.GB5129@S2101-09.ap.freescale.net>
 <20111220143558.GT2866@opensource.wolfsonmicro.com>
 <20111220153101.GD5348@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111220153101.GD5348-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2011 at 11:31:03PM +0800, Shawn Guo wrote:
> On Tue, Dec 20, 2011 at 02:35:58PM +0000, Mark Brown wrote:

> > I don't know that that helps, register numbers and shifts aren't going
> > to do anything for legibility.

> I think it helps.  It's not about legibility but identification.  For
> mc13892 driver to work, it has to match the register number and enable
> bit shift given by mc13892 reference manual.  So register number +
> enable bit shift is stable and unique to identify a mc13892 regulator.

It's unique but I feel the disadvantages in terms of legibility of the
resulting device trees are substantial - we want humans to be able to
read and write device trees, preferrably without having to dig out the
datasheet for the part.  So long as the names are reasonably sensible
and can be understood in the case of any lack of clarity we should be
OK.

> > The problem with the names was that the
> > names chosen were poorly defined (why call DCDCn chipname__dcdcn?) and
> > not documented in the binding, not that they were names.

> The problem with name is it's name.  The mc13892 driver can still work
> with naming regulator differently from mc13892 reference manual.  So
> using name to bind a regulator means we are binding with Linux mc13892
> driver.  In that case, DT probe works if and only if the name in dts
> matches the name used in mc13892 driver, and it does not work as long
> as the name dts does not match the name used in mc13892 driver.

This is the whole reason why I'm saying that you need to define the
names used in the binding - if the names are a defined part of the
binding then there's nothing driver specific about them.
