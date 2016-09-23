From: Horng-Shyang Liao <hs.liao@mediatek.com>
Subject: Re: [PATCH v14 4/4] CMDQ: save more energy in idle
Date: Fri, 23 Sep 2016 17:28:05 +0800
Message-ID: <1474622885.21723.25.camel@mtksdaap41>
References: <1473039885-24009-1-git-send-email-hs.liao@mediatek.com>
         <1473039885-24009-5-git-send-email-hs.liao@mediatek.com>
         <CABb+yY1YqyReK5bii6n5a_rJ6fgpPi=aC3sfKJdomvM5+NG9FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY1YqyReK5bii6n5a_rJ6fgpPi=aC3sfKJdomvM5+NG9FA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Jo
List-Id: devicetree@vger.kernel.org

On Thu, 2016-09-22 at 13:22 +0530, Jassi Brar wrote:
> On Mon, Sep 5, 2016 at 7:14 AM, HS Liao <hs.liao@mediatek.com> wrote:
> > Use clk_disable_unprepare instead of clk_disable to save more energy
> > when CMDQ is idle.
> >
> > Signed-off-by: HS Liao <hs.liao@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq.c | 54 +++++++++++++++++++++++++++++++++++++++-------
> 
> The driver is introduced by second patch of the set, so it makes sense
> to merge this patch into patch 2/4.

Hi Jassi,

Could you take a look at previous discussion between Matthias and me?
http://lkml.iu.edu/hypermail/linux/kernel/1606.2/05239.html
His basic idea is to simplify first working version.
Therefore, I move some code to this patch.

Thanks,
HS
