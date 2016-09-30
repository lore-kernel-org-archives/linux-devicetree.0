From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v14 4/4] CMDQ: save more energy in idle
Date: Fri, 30 Sep 2016 16:56:06 +0800
Message-ID: <1475225766.25044.33.camel@mtksdaap41>
References: <1473039885-24009-1-git-send-email-hs.liao@mediatek.com>
         <1473039885-24009-5-git-send-email-hs.liao@mediatek.com>
         <CABb+yY1YqyReK5bii6n5a_rJ6fgpPi=aC3sfKJdomvM5+NG9FA@mail.gmail.com>
         <1474622885.21723.25.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474622885.21723.25.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jo
List-Id: devicetree@vger.kernel.org

On Fri, 2016-09-23 at 17:28 +0800, Horng-Shyang Liao wrote:
> On Thu, 2016-09-22 at 13:22 +0530, Jassi Brar wrote:
> > On Mon, Sep 5, 2016 at 7:14 AM, HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > Use clk_disable_unprepare instead of clk_disable to save more energy
> > > when CMDQ is idle.
> > >
> > > Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/mailbox/mtk-cmdq.c | 54 +++++++++++++++++++++++++++++++++++++++-------
> > 
> > The driver is introduced by second patch of the set, so it makes sense
> > to merge this patch into patch 2/4.
> 
> Hi Jassi,
> 
> Could you take a look at previous discussion between Matthias and me?
> http://lkml.iu.edu/hypermail/linux/kernel/1606.2/05239.html
> His basic idea is to simplify first working version.
> Therefore, I move some code to this patch.
> 
> Thanks,
> HS
> 

Hi Jassi,

What do you think about our previous discussion?

Thanks,
HS



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
