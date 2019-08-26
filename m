From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Date: Mon, 26 Aug 2019 15:54:25 +0900
Message-ID: <CAAFQd5A-ze9FgDqNpPgyu7gA3nQPUW_G0zEG8ThNGjVEb=_jjA@mail.gmail.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190821103038.GA148543@chromium.org>
 <20190821110542.GD31967@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190821110542.GD31967-z7MJbOB4PBP+e+fPlCVrcFDQ4js95KgL@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cao Bing Bu <bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 8:05 PM Sakari Ailus
<sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>
> Hi Tomasz,
>
> On Wed, Aug 21, 2019 at 07:30:38PM +0900, Tomasz Figa wrote:
[snip]
> > Is it really correct to enable the clock before the regulators?
> >
> > According to the datasheet, it should be:
> >  - PD pin HIGH,
> >  - nRST pin LOW,
> >  - DVDDIO and AVDD28 power up and stabilize,
> >  - clock enabled,
> >  - min 5 ms delay,
> >  - PD pin LOW,
> >  - min 4 ms delay,
> >  - nRST pin HIGH,
> >  - min 5 ms delay,
> >  - I2C interface ready.
> >
> > > +
> > > +   /* Note: set 0 is high, set 1 is low */
> >
> > Why is that? If there is some inverter on the way that should be handled
> > outside of this driver. (GPIO DT bindings have flags for this purpose.
> >
> > If the pins are nRESET and nPOWERDOWN in the hardware datasheet, we should
> > call them like this in the driver too (+/- the lowercase and underscore
> > convention).
> >
> > According to the datasheet, the reset pin is called RST and inverted, so we should
> > call it n_rst, but the powerdown signal, called PD, is not inverted, so pd
> > would be the right name.
>
> For what it's worth sensors generally have xshutdown (or reset) pin that is
> active high. Looking at the code, it is not the case here. It's a bit odd
> since the usual arrangement saves power when the camera is not in use; it's
> not a lot but still. Oh well.
>

I guess we could drive powerdown low after disabling the regulators
and clocks, but that wouldn't work for the cases where the regulators
are actually shared with something else, especially if that is not
related to the same camera module.

> ...
>
> > > +static struct i2c_driver ov02a10_i2c_driver = {
> > > +   .driver = {
> > > +           .name = "ov02a10",
> > > +           .pm = &ov02a10_pm_ops,
> > > +           .of_match_table = ov02a10_of_match,
> >
> > Please use of_match_ptr() wrapper.
>
> Not really needed; the driver does expect regulators, GPIOs etc., but by
> leaving out of_match_ptr(), the driver will also probe on ACPI based
> systems.

Good point, I always keep forgetting about the ability to probe OF
drivers from ACPI. Then we also need to remove the #if
IS_ENABLED(CONFIG_OF) from ov02a10_of_match.

Best regards,
Tomasz
