From: Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
Date: Thu, 22 Aug 2019 21:26:01 +0800
Message-ID: <1566480361.12318.50.camel@mhfsdcap03>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-3-ran.bi@mediatek.com>
         <20190820201744.GZ3545@piout.net> <1566477254.12318.41.camel@mhfsdcap03>
         <20190822124628.GS27031@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822124628.GS27031@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flora Fu
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-22 at 14:46 +0200, Alexandre Belloni wrote:
> On 22/08/2019 20:34:14+0800, Ran Bi wrote:
> > > > +	/* RTC need POWERKEY1/2 match, then goto normal work mode */
> > > > +	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
> > > > +	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
> > > 
> > > This should be written when setting the time after power was lost.
> > > 
> > 
> > I suppose we can move this into mt2712_rtc_read_time function's "if
> > (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)" condition
> > which will be added at next patch. We need additional flag to mark this
> > condition or another if condition in mt2712_rtc_set_time fucntion if we
> > put these code in mt2712_rtc_set_time function.
> > 
> 
> It is fine to test both in read_time and in set_time.
> 

Do you mean that we can test powerkey and then set powerkey both in
read_time and in set_time?
