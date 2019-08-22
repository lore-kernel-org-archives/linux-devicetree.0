From: Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
Date: Thu, 22 Aug 2019 19:47:49 +0800
Message-ID: <1566474469.12318.7.camel@mhfsdcap03>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-3-ran.bi@mediatek.com>
         <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flor
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-22 at 11:12 +0200, Matthias Brugger wrote:
> 
> On 01/08/2019 13:01, Ran Bi wrote:
> > This add support for the MediaTek MT2712 RTC. It was SoC based RTC, but
> > had different architecture compared with MT7622 RTC.
> > 
> > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > ---
> >  drivers/rtc/Kconfig      |  10 +
> >  drivers/rtc/Makefile     |   1 +
> >  drivers/rtc/rtc-mt2712.c | 444 +++++++++++++++++++++++++++++++++++++++
> 
> Can't we just adjust rtc-mt7622.c (and rename it) to unify the source for both
> devices. What is the difference that we need to write a driver of our own?
> 
> Regards,
> Matthias

We cannot merge rtc-mt7622.c and rtc-mt2712.c together. These two rtc
hardwares have totally different design. Registers naming, registers
offset and operating method are different.
