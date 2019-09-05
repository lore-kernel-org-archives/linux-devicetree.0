From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Date: Thu, 5 Sep 2019 19:05:12 +0300
Message-ID: <20190905160512.GG5475@paasikivi.fi.intel.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03>
 <20190905104546.GA5475@paasikivi.fi.intel.com>
 <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream <srv_heupstream@mediatek.com>, shengnan.wang@mediatek.com, Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 07:53:37PM +0900, Tomasz Figa wrote:
> On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dongchun,
> >
> > On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
> >
> > ...
> >
> > > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > + if (ret < 0) {
> > > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > > +         goto disable_clk;
> > > > > + }
> > > > > + msleep_range(7);
> > > >
> > > > This has some potential of clashing with more generic functions in the
> > > > future. Please use usleep_range directly, or msleep.
> > > >
> > >
> > > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > > https://patchwork.kernel.org/patch/10957225/
> >
> > Yes, please.
> 
> Why not just msleep()?

msleep() is usually less accurate. I'm not sure it makes a big different in
this case. Perhaps, if someone wants that the sensor is powered on and
streaming as soon as possible.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
