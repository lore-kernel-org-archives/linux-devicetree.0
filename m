From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mfd: mc13xxx: add device tree probe support
Date: Tue, 20 Dec 2011 10:01:02 +0800
Message-ID: <20111220020101.GD5683@S2100-06.ap.freescale.net>
References: <1323702958-4831-1-git-send-email-shawn.guo@linaro.org>
 <1323702958-4831-2-git-send-email-shawn.guo@linaro.org>
 <20111220005708.GM2860@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111220005708.GM2860-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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

On Tue, Dec 20, 2011 at 12:57:09AM +0000, Mark Brown wrote:
> On Mon, Dec 12, 2011 at 11:15:56PM +0800, Shawn Guo wrote:
> 
> > +Sub-nodes:
> > +- regulators : Contain the regulator nodes.  The name of regulator node
> > +  is being used by mc13xxx regulator driver to find the correct relator
> > +  device.
> 
> Reading this I'm not clear what the name of the node is, or what the
> valid node names are.
> 
In the example below, the name would be 'mc13892__sw1'.

> > +			sw1_reg: mc13892__sw1 {
> 
> The examples don't really elucidate this either (and the __ is rather
> odd).

Yes, that's because the name defined by mc13892 regulator driver is odd.

There is a '_' in 'MC13892_' when using MC13xxx_DEFINE below.

#define MC13892_SW_DEFINE(name, reg, vsel_reg, voltages)        \
        MC13xxx_DEFINE(MC13892_, name, reg, vsel_reg, voltages, \
                        mc13892_sw_regulator_ops)

And the second one comes from the definition of .name below.

#define MC13xxx_DEFINE(prefix, _name, _reg, _vsel_reg, _voltages, _ops) \
        [prefix ## _name] = {                           \
                .desc = {                                               \
                        .name = #prefix "_" #_name,                     \

Using the regulator name to find the correct device is the approach I
can see that brings the least churn to the existing driver.  You may
think the regulator name is Linux mc13892 regulator driver specific.
But I think it should be something from hardware manual and should be
used in driver and device tree consistently.  Unfortunately, the driver
created an odd name first, and we have to use that name in device tree
to minimize the diff stat.

-- 
Regards,
Shawn
