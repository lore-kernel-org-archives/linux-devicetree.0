From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v3 2/4] clk: mediatek: Add initial common clock support
 for Mediatek SoCs.
Date: Thu, 8 Jan 2015 10:55:01 +0800
Message-ID: <1420685701.27952.44.camel@mtksdaap41>
References: <1420601123-25859-1-git-send-email-jamesjj.liao@mediatek.com>
 <1420601123-25859-3-git-send-email-jamesjj.liao@mediatek.com>
 <CABuKBeLQkTBYWkBWAYXjYudMAza+1zueRSqGFPd+480p1rYNwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBeLQkTBYWkBWAYXjYudMAza+1zueRSqGFPd+480p1rYNwg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, srv_heupstream <srv_heupstream@mediatek.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, HenryC Chen <henryc.chen@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, huang eddie <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Wed, 2015-01-07 at 18:22 +0100, Matthias Brugger wrote:
> 2015-01-07 4:25 GMT+01:00 James Liao <jamesjj.liao@mediatek.com>:
> > +
> > +static void cg_set_mask(struct mtk_clk_gate *cg, u32 mask)
> 
> Please add mtk_ prefix to all functions generic for the mediatek SoCs.

OK.

> 
> > +       if (cg->flags & CLK_GATE_NO_SETCLR_REG) {
> 
> Is the CLK_GATE_NO_SETCLR_REG ever used?
> As far as I can see, in this patch set it is not.

No, this flag is not used in this patch. I'll remove it or add clocks
which use this flag in next patch.

> > +
> > +       if (cg->flags & CLK_GATE_INVERSE)
> > +               cg_set_mask(cg, mask);
> > +       else
> > +               cg_clr_mask(cg, mask);
> > +
> > +       mtk_clk_unlock(flags);
> > +
> > +       return 0;
> > +}
> 
> Actually we should use CLK_GATE_SET_TO_DISABLE instead of inventing a
> new bit, right?

CLK_GATE_SET_TO_DISABLE is used by struct clk_gate, which is different
from struct mtk_clk_gate. Should we use the same constant in these 2
different implementation? If yes, how do we avoid bit conflict between
clk_gate and mtk_clk_gate if we both add more flags in the future?


> > +       pr_debug("%s(): %d, %s, bit[%d]\n",
> > +               __func__, r, __clk_get_name(hw->clk), (int)cg->bit);
> 
> Same here. Please review all debug messages.

OK, I'll remove them in next patch.


> > +
> > +#define CLK_DEBUG              0
> > +#define DUMMY_REG_TEST         0
> 
> This defines are not used, delete them.

OK.

> > +
> > +extern spinlock_t *get_mtk_clk_lock(void);
> > +
> > +#define mtk_clk_lock(flags)    spin_lock_irqsave(get_mtk_clk_lock(), flags)
> > +#define mtk_clk_unlock(flags)  \
> > +       spin_unlock_irqrestore(get_mtk_clk_lock(), flags)
> 
> Please use the spinlock directly without this akward defines.

Do you mean we should export clk_ops_lock (from clk-mtk.c) directly
instead of get_mtk_clk_lock()? Or simply remove mtk_clk_lock/unlock()?


Best regards,

James
