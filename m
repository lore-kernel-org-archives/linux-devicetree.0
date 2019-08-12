From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v5 03/10] rtc: mt6397: move some common definitions into
 rtc.h
Date: Mon, 12 Aug 2019 17:38:56 +0200
Message-ID: <20190812153856.GR3600@piout.net>
References: <20190812121511.4169-1-frank-w@public-files.de>
 <20190812121511.4169-4-frank-w@public-files.de>
 <20190812151128.GV26727@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812151128.GV26727@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, Alessandro Zummo <a.zummo@towertech.it>, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kate Stewart <kstewart@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.o>
List-Id: devicetree@vger.kernel.org

On 12/08/2019 16:11:29+0100, Lee Jones wrote:
> On Mon, 12 Aug 2019, Frank Wunderlich wrote:
> 
> > From: Josef Friedl <josef.friedl@speed.at>
> > 
> > move code to separate header-file to reuse definitions later
> > in poweroff-driver (drivers/power/reset/mt6323-poweroff.c)
> > 
> > Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > changes since v4: none
> > changes since v3: none
> > changes since v2: add missing commit-message
> > ---
> >  drivers/rtc/rtc-mt6397.c       | 55 +-------------------------
> >  include/linux/mfd/mt6397/rtc.h | 71 ++++++++++++++++++++++++++++++++++
> 
> include/linux/rtc/mt6397.h?
> 

It's just a bunch of registers and bit definitions so it may as well
stay close to include/linux/mfd/mt6397/registers.h


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
