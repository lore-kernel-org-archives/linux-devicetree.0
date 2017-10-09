From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 01/12] usb: mtu3: fix error return code in
 ssusb_gadget_init()
Date: Mon, 9 Oct 2017 09:18:43 +0800
Message-ID: <1507511923.17567.28.camel@mhfsdcap03>
References: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
         <46f6e8f0-0398-e33e-10fc-d0db6ce06db0@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46f6e8f0-0398-e33e-10fc-d0db6ce06db0@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2017-09-30 at 16:00 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 9/28/2017 3:17 AM, Chunfeng Yun wrote:
> 
> > When fail to get irq number, platform_get_irq() may return
> 
>     Failing. IRQ. :-)
I'll modify it, thank you

> 
> > -EPROBE_DEFER, but we ignore it and always return -ENODEV,
> > so fix it.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/usb/mtu3/mtu3_core.c |    4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> > index 99c65b0..9475798 100644
> > --- a/drivers/usb/mtu3/mtu3_core.c
> > +++ b/drivers/usb/mtu3/mtu3_core.c
> > @@ -774,9 +774,9 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
> >   		return -ENOMEM;
> >   
> >   	mtu->irq = platform_get_irq(pdev, 0);
> > -	if (mtu->irq <= 0) {
> > +	if (mtu->irq < 0) {
> 
>     This is good as the function no longer returns 0 on error. Even when it 
> did, 0 could mean a valid IRQ as well...
> 
> >   		dev_err(dev, "fail to get irq number\n");
> > -		return -ENODEV;
> > +		return mtu->irq;
> >   	}
> >   	dev_info(dev, "irq %d\n", mtu->irq);
> >   
> 
> MBR, Sergei
