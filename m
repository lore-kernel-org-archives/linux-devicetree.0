From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 3/7] rtc: mt6397: improvements of rtc driver
Date: Thu, 4 Jul 2019 11:13:51 +0200
Message-ID: <24975910-cb06-7faf-998f-def23ca0891f@gmail.com>
References: <20190703164822.17924-1-frank-w@public-files.de>
 <20190703164822.17924-4-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703164822.17924-4-frank-w@public-files.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg
Cc: Josef Friedl <josef.friedl@speed.at>
List-Id: devicetree@vger.kernel.org



On 03/07/2019 18:48, Frank Wunderlich wrote:
> From: Josef Friedl <josef.friedl@speed.at>
> 
> - use regmap_read_poll_timeout to drop while-loop
> - use devm-api to drop remove-callback
> - add new compatible for mt6323
>

It's up to the maintainer but I don't like patches doing clean-ups together with
adding support for new HW, although it's a trivial one here.


> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> =2D--
>  drivers/rtc/rtc-mt6397.c | 55 ++++++++++++++++------------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index c08ee5edf865..e5ddf0d0b6f1 100644
> =2D-- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -4,16 +4,19 @@
>  * Author: Tianping.Fang <tianping.fang@mediatek.com>

Missing in the CC list.
