From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v3 3/4] clk: mediatek: Add basic clocks for Mediatek
 MT8135.
Date: Thu, 8 Jan 2015 10:59:41 +0800
Message-ID: <1420685981.27952.49.camel@mtksdaap41>
References: <1420601123-25859-1-git-send-email-jamesjj.liao@mediatek.com>
 <1420601123-25859-4-git-send-email-jamesjj.liao@mediatek.com>
 <CABuKBeJGpYRT6XKM--H80u=cWpE5k97wdsSzWz4sTOwp33yCDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBeJGpYRT6XKM--H80u=cWpE5k97wdsSzWz4sTOwp33yCDQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, srv_heupstream <srv_heupstream@mediatek.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, HenryC Chen <henryc.chen@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, jamesjj.liao@mediatek.com, Russell King <linux@arm.linux.org.uk>, huang eddie <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Wed, 2015-01-07 at 18:31 +0100, Matthias Brugger wrote:
> 2015-01-07 4:25 GMT+01:00 James Liao <jamesjj.liao@mediatek.com>:
> > +++ b/drivers/clk/Makefile
> > @@ -47,6 +47,7 @@ obj-$(CONFIG_ARCH_HI3xxx)             += hisilicon/
> >  obj-$(CONFIG_ARCH_HIP04)               += hisilicon/
> >  obj-$(CONFIG_ARCH_HIX5HD2)             += hisilicon/
> >  obj-$(CONFIG_COMMON_CLK_KEYSTONE)      += keystone/
> > +obj-$(CONFIG_ARCH_MEDIATEK)            += mediatek/
> 
> This should be part of patch 2 instead of 3.
> 
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -0,0 +1,2 @@
> > +obj-y += clk-mtk.o clk-pll.o clk-gate.o
> 
> This should be in patch 2 instead of 3.

OK. I'll separate common codes and platform codes in next patch.


Best regards,

James
