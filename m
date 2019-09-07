From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Date: Sat, 7 Sep 2019 12:51:23 +0900
Message-ID: <CAAFQd5AjF491heU7BJTnsB-OsZp2LnYeAFArnEqWcNRPXykKrQ@mail.gmail.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03>
 <20190905104546.GA5475@paasikivi.fi.intel.com>
 <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
 <20190905160512.GG5475@paasikivi.fi.intel.com>
 <CANMq1KDVMGkeBvu1nO5WHopWwec9mxHfhmLmX2BzvaYVLzxoXw@mail.gmail.com>
 <1567733585.21623.163.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1567733585.21623.163.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cao Bing Bu <bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 6, 2019 at 10:33 AM Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> On Fri, 2019-09-06 at 06:58 +0800, Nicolas Boichat wrote:
> > On Fri, Sep 6, 2019 at 12:05 AM Sakari Ailus
> > <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> > >
> > > On Thu, Sep 05, 2019 at 07:53:37PM +0900, Tomasz Figa wrote:
> > > > On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
> > > > <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> > > > >
> > > > > Hi Dongchun,
> > > > >
> > > > > On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > > > > + if (ret < 0) {
> > > > > > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > > > > > +         goto disable_clk;
> > > > > > > > + }
> > > > > > > > + msleep_range(7);
> > > > > > >
> > > > > > > This has some potential of clashing with more generic functions in the
> > > > > > > future. Please use usleep_range directly, or msleep.
> > > > > > >
> > > > > >
> > > > > > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > > > > > https://patchwork.kernel.org/patch/10957225/
> > > > >
> > > > > Yes, please.
> > > >
> > > > Why not just msleep()?
> > >
> > > msleep() is usually less accurate. I'm not sure it makes a big different in
> > > this case. Perhaps, if someone wants that the sensor is powered on and
> > > streaming as soon as possible.
> >
> > https://elixir.bootlin.com/linux/latest/source/Documentation/timers/timers-howto.txt#L70
> >
> > Use usleep_range for delays up to 20ms (at least that's what the
> > documentation (still) says?)
> >
>
> Thank you for your clarifications.
> From the doc,
> "msleep(1~20) may not do what the caller intends, and
> will often sleep longer (~20 ms actual sleep for any
> value given in the 1~20ms range). In many cases this
> is not the desired behavior."
>
> So, it is supposed to use usleep_range in shorter sleep case,
> such as 5ms.

Thanks for double checking. usleep_range() sounds good then. Sorry for
the noise.

Best regards,
Tomasz
