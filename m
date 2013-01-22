From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Mon, 21 Jan 2013 21:06:58 -0800
Message-ID: <053501cdf85e$507c2560$f1747020$@samsung.com>
References: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
 <20130118131013.GG4672@arwen.pp.htv.fi> <20130118131250.GH4672@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <20130118131250.GH4672@arwen.pp.htv.fi>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
To: balbi@ti.com
Cc: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, p.paneri@samsung.com, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

Felipe Balbi wrote:
> 
> On Fri, Jan 18, 2013 at 03:10:13PM +0200, Felipe Balbi wrote:
> > Hi,
> >
> > On Tue, Dec 18, 2012 at 09:09:40PM +0530, Vivek Gautam wrote:
> > > This patch-set enables the samsung-usbphy driver on exynos5250,
> > > which enables the support for USB2 type and USB3 type phys.
> > > The corresponding phy driver patches are available at:
> > >  1) https://lkml.org/lkml/2012/12/18/201
> > >  2) https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-
> December/024559.html
> > >
> > > Tested this patch-set on exynos5250 with following patch-sets for
> > > USB 2.0 and USB 3.0:
> > >  - https://patchwork.kernel.org/patch/1794651/
> > >  - https://lkml.org/lkml/2012/12/18/201
> > >  - https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-
> December/024559.html
> > >  - http://comments.gmane.org/gmane.linux.usb.general/76352
> > >  - https://lkml.org/lkml/2012/12/13/492
> > >
> > > Vivek Gautam (2):
> > >   ARM: Exynos5250: Enabling samsung-usbphy driver
> > >   ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy driver
> >
> > What should I do with this series ? Is it ready to apply ? If it is,
> > then please resend with Kukjim's Acked-by.
> 
> actually, now that I look again, it's all under arch/arm/, so Kukjim can
> take all of those through his tree ;-)
> 
Yes, once Vivek addresses comments from Sylwester, let me pick up into
Samsung tree :-)

Thanks.

- Kukjin
