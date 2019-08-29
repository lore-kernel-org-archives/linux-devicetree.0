From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 07/10] regulator: mt6358: Add support for MT6358
 regulator
Date: Thu, 29 Aug 2019 14:09:58 +0800
Message-ID: <1567058998.31616.2.camel@mtksdaap41>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1566531931-9772-8-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20190828104555.GE4298@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828104555.GE4298@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Wed, 2019-08-28 at 11:45 +0100, Mark Brown wrote:
> On Fri, Aug 23, 2019 at 11:45:28AM +0800, Hsin-Hsiung Wang wrote:
> > The MT6358 is a regulator found on boards based on MediaTek MT8183 and
> > probably other SoCs. It is a so called pmic and connects as a slave to
> > SoC using SPI, wrapped inside the pmic-wrapper.
> 
> This looks good - since there was only one small issue with the example
> in the binding document I'll apply both patches, please send a followup
> fixing the binding document.

Thanks for your comment.
I will update the binding document in the next patch.
