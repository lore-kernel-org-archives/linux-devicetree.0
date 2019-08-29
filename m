From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: Aw: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related
 code from core driver
Date: Thu, 29 Aug 2019 14:24:36 +0800
Message-ID: <1567059876.15320.3.camel@mtksdaap41>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
         <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
         <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
         <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
         <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
         <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, "=?ISO-8859-1?Q?=22Ren=E9?= van Dorst\"" <opensource@vdorst.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Frank/Matthias,

On Fri, 2019-08-23 at 19:16 +0200, Frank Wunderlich wrote:
> > Gesendet: Freitag, 23. August 2019 um 17:42 Uhr
> > Von: "Matthias Brugger" <matthias.bgg@gmail.com>
> 
> > I suppose that's because 3/10 has code that should be in 2/10 and for some
> > reason 3/10 was not pushed for linux-next inclusion. Although it has the same
> > Acked-for-mfd-by tag.
> >
> > @Frank, can you test if adding 3/10 to your code base fixes the issue?
> 
> adding part 3 [1] seems to fix the issue too
> 
> [    4.960051] mt6323-regulator mt6323-regulator: Chip ID = 0x2023
> 
> thanks
> 
> [1] https://patchwork.kernel.org/patch/11110509/
Thanks for your comments.
The root cause seems I didn't split the code well.
I will fix it in the next version.
