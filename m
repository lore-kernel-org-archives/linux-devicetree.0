From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 03/13] dt-bindings: mfd: mediatek: add mt6323
 power-controller
Date: Mon, 2 Sep 2019 10:44:45 +0100
Message-ID: <20190902094445.GR32232@dell>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-4-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190818135611.7776-4-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, Josef Friedl <josef.friedl@speed.at>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Aug 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> - add powercontroller-section to existing binding-document
> - add mt6323-pwrc bindings-document with example
> 
> Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> changes since v5: split out non-pwrc related changes
> changes since v4: none
> changes since v3: none
> changes since v2: none (=v2 part 7)
> ---
>  .../devicetree/bindings/mfd/mt6397.txt        |  6 ++++++
>  .../bindings/power/reset/mt6323-poweroff.txt  | 20 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
