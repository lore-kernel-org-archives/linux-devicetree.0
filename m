From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH v5 3/5] ARM: mediatek: Add Pinctrl/GPIO driver for mt8135.
Date: Wed, 11 Feb 2015 00:42:56 -0800
Message-ID: <1423644176.1967.12.camel@mussux00.eus.mediatek.inc>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
 <1421818097-9281-4-git-send-email-hongzhou.yang@mediatek.com>
 <CACRpkdasVPUtn=-DhJ4OUXGZh36sLKwLhvm-nD-mkZjP7gQXww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdasVPUtn=-DhJ4OUXGZh36sLKwLhvm-nD-mkZjP7gQXww@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, maoguang.meng@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>, alan.cheng@mediatek.com, Russell King <linux@arm.linux.org.uk>, toby.liu@mediatek.com, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrsoft.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, dandan.he@mediatek.com, huang eddie <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar
List-Id: devicetree@vger.kernel.org

On Tue, 2015-02-10 at 16:17 +0800, Linus Walleij wrote:
> On Wed, Jan 21, 2015 at 1:28 PM, Hongzhou Yang
> <hongzhou.yang@mediatek.com> wrote:
> 
> > From: Hongzhou Yang <hongzhou.yang@mediatek.com>
> >
> > The mediatek SoCs have GPIO controller that handle both the muxing and GPIOs.
> >
> > The GPIO controller have pinmux, pull enable, pull select, direction and output high/low control.
> >
> > This driver include common driver and mt8135 part.
> > The common driver include the pinctrl driver and GPIO driver.
> > The mt8135 part contain its special device data.
> >
> > Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> 
> I have merged this patch for v3.21, except:
> 
> >  arch/arm/mach-mediatek/Kconfig                |    1 +
> (...)
>  --- a/arch/arm/mach-mediatek/Kconfig
> > +++ b/arch/arm/mach-mediatek/Kconfig
> > @@ -1,6 +1,7 @@
> >  menuconfig ARCH_MEDIATEK
> >         bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
> >         select ARM_GIC
> > +       select PINCTRL
> >         select MTK_TIMER
> >         help
> >           Support for Mediatek MT65xx & MT81xx SoCs
> 
> This, which should come in through the ARM SoC tree. It's not
> dependent on this series anyway.
> 
> This will appear after the merge window as we start the v3.21 cycle.
> 
> Yours,
> Linus Walleij

Hi Linus,

Due to pinconf relate API changed at kernel-3.20, a build error
happened.
Do I need to send patch v6?
Thanks.

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 721f429..83f474b
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -391,7 +391,7 @@ static int mtk_pctrl_dt_subnode_to_map(struct
pinctrl_dev *pctldev,
                return -EINVAL;
        }

-       err = pinconf_generic_parse_dt_config(node, &configs,
&num_configs);
+       err = pinconf_generic_parse_dt_config(node, pctldev, &configs,
&num_configs);
        if (num_configs)
                has_config = 1;

@@ -716,7 +716,7 @@ int mtk_pctrl_init(struct platform_device *pdev,

        prop = of_find_property(np, "pins-are-numbered", NULL);
        if (!prop) {
-               dev_err(&pdev->dev, "only support pins-are-numbered
format\n", ret);
+               dev_err(&pdev->dev, "only support pins-are-numbered
format\n");
                return -EINVAL;
        }

Yours,
Hongzhou
