From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] PCI: mediatek: Add system pm support for MT2712
Date: Fri, 1 Jun 2018 13:52:44 +0300
Message-ID: <CAHp75VcEp2kFO4hncvMS4Dh1AzvoFbrps7+FLmdk0RLyNTHz7g@mail.gmail.com>
References: <1527822270-30280-1-git-send-email-honghui.zhang@mediatek.com>
 <CAHp75VeBTmC=3nJ-t+OO9bp0mzJuTYsGBwi8fokT16bu2nE9RA@mail.gmail.com> <1527850145.28160.6.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527850145.28160.6.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Honghui Zhang <honghui.zhang@mediatek.com>
Cc: Arnd Bergmann <arnd.bergmann@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, yingjoe.chen@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, ryder.lee@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 1, 2018 at 1:49 PM, Honghui Zhang
<honghui.zhang@mediatek.com> wrote:
> On Fri, 2018-06-01 at 13:17 +0300, Andy Shevchenko wrote:
>> On Fri, Jun 1, 2018 at 6:04 AM,  <honghui.zhang@mediatek.com> wrote:
>> > From: Honghui Zhang <honghui.zhang@mediatek.com>
>>
>> > +#ifdef CONFIG_PM_SLEEP
>> > +static int mtk_pcie_suspend_noirq(struct device *dev)
>>
>> __maybe_unused
>>
>
> Hi, Andy, thanks for your review.
> Bjorn had point this out that at:
> https://www.spinics.net/lists/arm-kernel/msg656774.html

Nice, one more maintainer with strong opinion here.

Arnd, that's what I mentioned as a split in opinions earlier.
Any new developer or even existing contributor would be now really
confusing since maintainers asked for two different approaches on the
same matter.

-- 
With Best Regards,
Andy Shevchenko
