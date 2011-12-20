From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mfd: mc13xxx: add device tree probe support
Date: Tue, 20 Dec 2011 11:03:48 +0800
Message-ID: <20111220030347.GB2995@S2101-09.ap.freescale.net>
References: <1323702958-4831-1-git-send-email-shawn.guo@linaro.org>
 <1323702958-4831-2-git-send-email-shawn.guo@linaro.org>
 <20111220005708.GM2860@opensource.wolfsonmicro.com>
 <20111220020101.GD5683@S2100-06.ap.freescale.net>
 <20111220015931.GX2860@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111220015931.GX2860-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2011 at 01:59:32AM +0000, Mark Brown wrote:
> On Tue, Dec 20, 2011 at 10:01:02AM +0800, Shawn Guo wrote:
> > On Tue, Dec 20, 2011 at 12:57:09AM +0000, Mark Brown wrote:
> > > On Mon, Dec 12, 2011 at 11:15:56PM +0800, Shawn Guo wrote:
> 
> > > > +Sub-nodes:
> > > > +- regulators : Contain the regulator nodes.  The name of regulator node
> > > > +  is being used by mc13xxx regulator driver to find the correct relator
> > > > +  device.
> 
> > > Reading this I'm not clear what the name of the node is, or what the
> > > valid node names are.
> 
> > In the example below, the name would be 'mc13892__sw1'.
> 
> You're missing the point - someone reading the documentation needs to be
> able to figure out what strings they need to use for all the different
> regulators on the chip are without groveling through the driver code.
> 
> > > > +			sw1_reg: mc13892__sw1 {
> 
> > > The examples don't really elucidate this either (and the __ is rather
> > > odd).
> 
> > Yes, that's because the name defined by mc13892 regulator driver is odd.
> 
> That's *not* something that we should be exposing in the device tree
> bindings.  This is an implementation detail of the Linux driver which
> might well change in future.
> 
Any suggestion on a better binding for mc13892 regulator device?

-- 
Regards,
Shawn
