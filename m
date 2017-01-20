From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v20 0/4] Mediatek MT8173 CMDQ support
Date: Fri, 20 Jan 2017 11:11:00 +0800
Message-ID: <1484881860.18967.1.camel@mtksdaap41>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
         <1484270826.14822.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484270826.14822.1.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dennis-YC Hsieh <dennis-yc.hsieh@media>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-01-13 at 09:27 +0800, Horng-Shyang Liao wrote:
> On Wed, 2017-01-04 at 11:06 +0800, HS Liao wrote:
> > Hi,
> > 
> > This is Mediatek MT8173 Command Queue(CMDQ) driver. The CMDQ is used
> > to help write registers with critical time limitation, such as
> > updating display configuration during the vblank. It controls Global
> > Command Engine (GCE) hardware to achieve this requirement.
> > 
> > These patches have a build dependency on top of v4.10-rc2.
> > 
> > Changes since v19:
> >  - rebase to v4.10-rc2
> > 
> > Best regards,
> > HS Liao
> > 
> > HS Liao (4):
> >   dt-bindings: soc: Add documentation for the MediaTek GCE unit
> >   mailbox: mediatek: Add Mediatek CMDQ driver
> >   arm64: dts: mt8173: Add GCE node
> >   soc: mediatek: Add Mediatek CMDQ helper
> > 
> >  .../devicetree/bindings/mailbox/mtk-gce.txt        |  43 ++
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
> >  drivers/mailbox/Kconfig                            |  10 +
> >  drivers/mailbox/Makefile                           |   2 +
> >  drivers/mailbox/mtk-cmdq-mailbox.c                 | 596 +++++++++++++++++++++
> >  drivers/soc/mediatek/Kconfig                       |  12 +
> >  drivers/soc/mediatek/Makefile                      |   1 +
> >  drivers/soc/mediatek/mtk-cmdq-helper.c             | 310 +++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h           |  75 +++
> >  include/linux/soc/mediatek/mtk-cmdq.h              | 174 ++++++
> >  10 files changed, 1233 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> >  create mode 100644 drivers/mailbox/mtk-cmdq-mailbox.c
> >  create mode 100644 drivers/soc/mediatek/mtk-cmdq-helper.c
> >  create mode 100644 include/linux/mailbox/mtk-cmdq-mailbox.h
> >  create mode 100644 include/linux/soc/mediatek/mtk-cmdq.h
> > 
> 
> Hi Jassi, Matthias,
> 
> Sorry to disturb you.
> Do you have any further comments on CMDQ v20?
> 
> Thanks.
> HS

Hi Jassi, Matthias,

Sorry to disturb you again.
Do you have any further comments on CMDQ v20?

Thanks.
HS


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
