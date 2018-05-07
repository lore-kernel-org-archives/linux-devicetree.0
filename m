From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v6 05/17] media: rkisp1: add Rockchip ISP1 subdev driver
Date: Mon, 7 May 2018 09:38:14 +0300
Message-ID: <20180507063814.vweb4p3nfgnoc3td@tarshish>
References: <20180308094807.9443-1-jacob-chen@iotwrt.com>
 <20180308094807.9443-6-jacob-chen@iotwrt.com>
 <20180503090909.o3dyhukzs2y7em5z@tarshish>
 <CAAFQd5CvBv4hkE=PSHBJTYa9Lj0SyggxpMBEAYD=if0=T0uzHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAFQd5CvBv4hkE=PSHBJTYa9Lj0SyggxpMBEAYD=if0=T0uzHw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: Jacob Chen <jacob-chen@iotwrt.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Shunqian Zheng <zhengsq@rock-chips.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?utf-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>, Eddie Cai <eddie.cai.linux@gmail.com>, Jeffy <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

On Mon, May 07, 2018 at 06:13:27AM +0000, Tomasz Figa wrote:
> On Thu, May 3, 2018 at 6:09 PM Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Mar 08, 2018 at 05:47:55PM +0800, Jacob Chen wrote:
> > > +static int rkisp1_isp_sd_s_power(struct v4l2_subdev *sd, int on)
> > > +{
> > > +     struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > > +     int ret;
> > > +
> > > +     v4l2_dbg(1, rkisp1_debug, &isp_dev->v4l2_dev, "s_power: %d\n",
> on);
> > > +
> > > +     if (on) {
> > > +             ret = pm_runtime_get_sync(isp_dev->dev);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             rkisp1_config_clk(isp_dev);
> > > +     } else {
> > > +             ret = pm_runtime_put(isp_dev->dev);
> 
> > I commented this line out to make more than one STREAMON work. Otherwise, 
> > the second STREAMON hangs. I guess the bug is not this driver. Probably
> > something in drivers/soc/rockchip/pm_domains.c. Just noting that in case 
> > you or someone on Cc would like to investigate it further.
> >
> > I tested v4.16-rc4 on the Tinkerboard.
> 
> Looks like that version doesn't include the IOMMU PM and clock handling
> rework [1], which should fix a lot of runtime PM issues. FWIW, linux-next
> seems to already include it.
> 
> [1] https://lkml.org/lkml/2018/3/23/44

Thanks for the reference.

It looks like the iommu driver part is in Linus' tree already. The DT part is 
in the v4.18-armsoc/dts32 branch of Heiko's tree. Am I missing anything?

Anyway, I'll take a look.

Thanks again,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
