From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v2 8/9] rtc: mt6397: fix alarm register overwrite
Date: Mon, 11 Mar 2019 14:05:02 +0800
Message-ID: <1552284302.19917.2.camel@mtksdaap41>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1552275991-34648-9-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552275991-34648-9-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, srv_heupstream <srv_heupstream@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <Sean.Wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2019-03-11 at 11:46 +0800, Hsin-Hsiung Wang wrote:
> From: Ran Bi <ran.bi@mediatek.com>
> 
> Alarm registers high byte was reserved for other functions.
> This add mask in alarm registers operation functions.
> This also fix error condition in interrupt handler.
> 
> Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 47 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 

Thanks your interrupt and race condition fix

Acked-by: Eddie Huang <eddie.huang@mediatek.com>
