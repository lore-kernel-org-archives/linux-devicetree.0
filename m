From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 2/6] usb: mtu3: add reference clock
Date: Fri, 20 Jan 2017 10:20:25 +0800
Message-ID: <1484878825.10292.58.camel@mhfsdcap03>
References: <1484719707-12107-1-git-send-email-chunfeng.yun@mediatek.com>
         <1484719707-12107-2-git-send-email-chunfeng.yun@mediatek.com>
         <7fc9de99-4bef-ddf2-c5fe-985f8d2348d2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7fc9de99-4bef-ddf2-c5fe-985f8d2348d2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-01-19 at 13:22 +0100, Matthias Brugger wrote:
> 
> On 18/01/17 07:08, Chunfeng Yun wrote:
> > usually, the reference clock comes from 26M oscillator directly,
> > but some SoCs are not, add it for compatibility.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/mtu3/mtu3.h      |    1 +
> >  drivers/usb/mtu3/mtu3_plat.c |   21 +++++++++++++++++++--
> >  2 files changed, 20 insertions(+), 2 deletions(-)
[...]
> > @@ -154,6 +162,7 @@ static int ssusb_rscs_init(struct ssusb_mtk *ssusb)
> >  static void ssusb_rscs_exit(struct ssusb_mtk *ssusb)
> >  {
> >  	clk_disable_unprepare(ssusb->sys_clk);
> > +	clk_disable_unprepare(ssusb->ref_clk);
> >  	regulator_disable(ssusb->vusb33);
> >  	ssusb_phy_power_off(ssusb);
> >  	ssusb_phy_exit(ssusb);
> > @@ -216,6 +225,12 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
> >  		return PTR_ERR(ssusb->sys_clk);
> >  	}
> >
> > +	ssusb->ref_clk = devm_clk_get(dev, "ref_ck");
> > +	if (IS_ERR(ssusb->ref_clk)) {
> > +		dev_err(dev, "failed to get ref clock\n");
> > +		return PTR_ERR(ssusb->ref_clk);
> > +	}
> > +
> 
> That would break older dts bindings, right?
Yes, So I send a new patch for the related dts. Maybe it's not a
problem, only one dts file need be updated currently.

> ref_ck must be optional for the code.
I tend to make it be optional for the dts, but not for the code.
There are some "fixed-clock" which can be treated as dummy ones, and if
a clock is really optional, we can use one fixed-clock in dts, and keep
the code simple.
In fact, the reference clock is essential for usb controller.
> 
> Regards,
> Matthias
