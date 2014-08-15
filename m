Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] mmc: dw_mmc: move rockchip related code to a separate file
Date: Fri, 15 Aug 2014 21:52:32 +0200
Message-ID: <5377586.rAxPyABi4v@diego>
In-Reply-To: <CAD=FV=W-UFsELR-pLdqg+CC7bG8J3zCYa=fxy_4pd0vOnvc62w@mail.gmail.com>
References: <1406786498-3935-1-git-send-email-addy.ke@rock-chips.com> <1408003293-27375-1-git-send-email-addy.ke@rock-chips.com> <CAD=FV=W-UFsELR-pLdqg+CC7bG8J3zCYa=fxy_4pd0vOnvc62w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Doug Anderson <dianders@chromium.org>
Cc: Addy Ke <addy.ke@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>, Dinh Nguyen <dinguyen@altera.com>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "zhenfu.fang" <zhenfu.fang@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, lintao <lintao@rock-chips.com>, chenfen <chenfen@rock-chips.com>, zyf <zyf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Chris <zyw@rock-chips.com>, =?utf-8?B?5ae a5pm65oOF?= <yzq@rock-chips.com>, han jiang <hj@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, Lin Huang <hl@rock-chips.com>
List-ID: <devicetree@vger.kernel.org>

Am Donnerstag, 14. August 2014, 10:09:55 schrieb Doug Anderson:
> Addy,
> 
> On Thu, Aug 14, 2014 at 1:01 AM, Addy Ke <addy.ke@rock-chips.com> wrote:
> > diff --git a/drivers/mmc/host/dw_mmc-rockchip.c
> > b/drivers/mmc/host/dw_mmc-rockchip.c new file mode 100644
> > index 0000000..3d86ef3
> > --- /dev/null
> > +++ b/drivers/mmc/host/dw_mmc-rockchip.c

[...]

> > +static int dw_mci_rockchip_probe(struct platform_device *pdev)
> > +{
> > +       const struct dw_mci_drv_data *drv_data;
> > +       const struct of_device_id *match;
> > +
> > +       match = of_match_node(dw_mci_rockchip_match, pdev->dev.of_node);
> 
> Your code doesn't have "if (pdev->dev.of_node)".  That's OK (I think)
> but it means that your KConfig needs a "depends on OF", right?

Almost all of_* functions have stubs for the !CONFIG_OF case [0].
Instead I guess this simply needs a

if (!pdev->dev.of_node)
	return -ENODEV;

to handle the case when there is no of_node.


Heiko


[0] http://lxr.free-electrons.com/source/include/linux/of.h#L585
