From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 06/13] mfd: mt6397: add mutex include
Date: Mon, 2 Sep 2019 10:49:11 +0100
Message-ID: <20190902094911.GT32232@dell>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-7-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190818135611.7776-7-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, Josef Friedl <josef.friedl@speed.at>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Aug 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> add missing mutex.h

In future, please use correct English grammar in commit messages.

I will fix them for this submission.

> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v5: separated from "power: reset: add driver for mt6323 poweroff"
> ---
>  include/linux/mfd/mt6397/core.h | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
