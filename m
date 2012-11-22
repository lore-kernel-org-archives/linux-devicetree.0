From: "Philip, Avinash" <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Thu, 22 Nov 2012 14:37:58 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9EE329@DBDE01.ent.ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
 <1352978534.2221.33.camel@sauron.fi.intel.com>
 <518397C60809E147AF5323E0420B992E3E9EC70D@DBDE01.ent.ti.com>
 <1353581032.2701.34.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353581032.2701.34.camel-Bxnoe/o8FG+Ef9UqXRslZEEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
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
To: "artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "ivan.djelic-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org" <ivan.djelic-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: "Mohammed, Afzal" <afzal-l0cyMroinI0@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hebbar,
 Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 22, 2012 at 16:13:52, Artem Bityutskiy wrote:
> On Wed, 2012-11-21 at 07:01 +0000, Philip, Avinash wrote:
> > > I am not sure how this dependency has to be handled for this series,
> > > let me know whether you still want it to be made over l2-mtd?
> > 
> > Artem,
> > 
> > Is it possible for you to give ack for these patches so that these patches
> > can go in Tony's tree where Omap-gpmc changes are present?
> 
> I would prefer if people like Ivan could take a look at this first.

Ok.

> 
> Also, I am not sure this is a good idea. Or at least we should agree on
> some common strategy for bit-flips in the erased areas:
> 
> "+ * 1. If page is erased, check with standard ecc vector (ecc vector
> + * for erased page to find any bit flip). If check fails, bit flip
> + * is present in erased page. Count the bit flips in erased page and
> + * if it falls under correctable level, report page with 0xFF and
> + * update the correctable bit information."
> 

Idea here is to make faster scanning of erased page without bit flips.
For omap nand driver ecc reported by hardware is non-zero and non 0xff.
So comparing with the standard vector for erased page and skipping error
correction for erased page without bit flips.

Strategy for bit flips in erased page bit flips, can be
1. Don't make as erased page and mark it as bad.
2. Report the erased page with correctable bit flip if it falls under
   correctable level. Report the page with erased page with correctable
   errors.
Is the concern is here with erased page with correctable error?
I think as error is under correctable level, we still can use the page.
May be we can think of limiting the check to half of correctable level?

I would go for option 2, see discussion [1].
 
Option 2 adopted in this patch series.

> Basically, you are working-around JFFS2 limitations.
> 
> Do you suggest we do this in all the drivers?

I am not sure how the situation handled in other drivers.
This depends on the platforms. This method can be adopted for
platforms where ecc reported non-zero & non 0xff with erased page.

> 
> If we want to do this, may be we better do this in higher level, common
> to all drivers?
> 

I doubt how we handle in higher level with existing MTD setup.
Issues I am seeing on implementing at higher layer is
1. Calculation of standard ecc vector for erased page.
2. Skipping ecc error correction, as currently error correction in
   .read_page()
 Can be handled by adding common .read_page() method on certain flag,
 populated for platform specific.

1. http://lists.infradead.org/pipermail/linux-mtd/2011-April/034604.html

Thanks
Avinash

> -- 
> Best Regards,
> Artem Bityutskiy
> 
