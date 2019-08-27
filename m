From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 04/13] dt-bindings: rtc: mediatek: add missing mt6397
 rtc
Date: Tue, 27 Aug 2019 11:47:28 -0500
Message-ID: <20190827164728.GA20645@bogus>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-5-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190818135611.7776-5-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org, "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, Josef Friedl <josef.friedl@speed.at>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Aug 2019 15:56:02 +0200, Frank Wunderlich wrote:
> From: Josef Friedl <josef.friedl@speed.at>
> 
> add missing devicetree-binding document for mt6397 rtc
> in later patch driver is extended with mt6323 chip
> 
> Suggested-By: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v5: none
> changes since v4: use relative path
> changes since v3: moved SOB
> changes since v2: splitted rtc-mt6397.txt from first patch
> ---
>  .../devicetree/bindings/rtc/rtc-mt6397.txt    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
