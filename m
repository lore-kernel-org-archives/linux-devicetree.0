From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 03/10] rtc: mt6397: move some common definitions into
 rtc.h
Date: Mon, 12 Aug 2019 11:18:38 +0100
Message-ID: <20190812101838.GG26727@dell>
References: <20190729174154.4335-1-frank-w@public-files.de>
 <20190729174154.4335-4-frank-w@public-files.de>
 <20190805134842.GG3600@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805134842.GG3600@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, Alessandro Zummo <a.zummo@towertech.it>, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kate Stewart <kstewart@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.o>
List-Id: devicetree@vger.kernel.org

On Mon, 05 Aug 2019, Alexandre Belloni wrote:

> On 29/07/2019 19:41:47+0200, Frank Wunderlich wrote:
> > From: Josef Friedl <josef.friedl@speed.at>
> > 
> > move code to separate header-file to reuse definitions later
> > in poweroff-driver (drivers/power/reset/mt6323-poweroff.c)
> > 
> > changes since v2: add missing commit-message
> 
> The changelog should be after the --- marker.
> > 
> > Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  drivers/rtc/rtc-mt6397.c       | 55 +-------------------------
> >  include/linux/mfd/mt6397/rtc.h | 71 ++++++++++++++++++++++++++++++++++

I think include/linux/rtc/mt6397.h would be better?

Certainly from a maintainance PoV, it would be better reviewed and
looked after by an RTC expert.

> >  2 files changed, 72 insertions(+), 54 deletions(-)
> >  create mode 100644 include/linux/mfd/mt6397/rtc.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
