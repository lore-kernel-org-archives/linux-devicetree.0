From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mfd: mc13xxx: add device tree probe support
Date: Wed, 21 Dec 2011 10:12:47 +0800
Message-ID: <20111221021246.GB5983@S2101-09.ap.freescale.net>
References: <20111220020101.GD5683@S2100-06.ap.freescale.net>
 <20111220015931.GX2860@opensource.wolfsonmicro.com>
 <20111220030347.GB2995@S2101-09.ap.freescale.net>
 <20111220112510.GL2866@opensource.wolfsonmicro.com>
 <20111220135251.GB5129@S2101-09.ap.freescale.net>
 <20111220143558.GT2866@opensource.wolfsonmicro.com>
 <20111220153101.GD5348@S2101-09.ap.freescale.net>
 <20111220232526.GA6551@opensource.wolfsonmicro.com>
 <20111221012519.GA5983@S2101-09.ap.freescale.net>
 <20111221013702.GB15398@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111221013702.GB15398-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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

On Wed, Dec 21, 2011 at 01:37:03AM +0000, Mark Brown wrote:
> On Wed, Dec 21, 2011 at 09:25:21AM +0800, Shawn Guo wrote:
> > The problem is even if we have the name defined that way, it has to be
> > matched to the name used in mc13892 driver somehow, if we want to use
> > name as the key to find the regulator defined in mc13892 driver as
> > array mc13892_regulators[].
> 
> This doesn't seem like a problem - the most obvious thing would just be
> to adjust the strings in the code to correspond to what the device tree
> binding says.
> 
Okay, that's it.  Something obvious to you is not obvious to me :)
As I'm migrating an existing driver to be DT aware, I'm trying to avoid
changing any non-dt code.  Your suggestion would be obvious to me if I'm
writing a new driver that only supports DT.

Anyway, I got your point, and will follow that since you seems fine
with changing non-dt code to adopt dt support.

-- 
Regards,
Shawn
