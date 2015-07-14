From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 4/5] clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS
Date: Tue, 14 Jul 2015 11:23:41 +0800
Message-ID: <CAGS+omAb8t0sLP1DHoa6z1-XweWUwOJQhqydofWZ+YiyPXzxhA@mail.gmail.com>
References: <1436522405-13923-1-git-send-email-jamesjj.liao@mediatek.com>
 <1436522405-13923-5-git-send-email-jamesjj.liao@mediatek.com>
 <CAGS+omBryA6f6gYje5RvF2XcJiebogYCHpyWNeN9K4B-MiHf1Q@mail.gmail.com> <1436841935.9416.10.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436841935.9416.10.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 14, 2015 at 10:45 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Hi Daniel,
>
> On Mon, 2015-07-13 at 22:46 +0800, Daniel Kurtz wrote:
>
>> > +static const struct clk_ops mtk_ref2usb_tx_ops = {
>> > +       .is_prepared    = mtk_ref2usb_tx_is_prepared,
>> > +       .prepare        = mtk_ref2usb_tx_prepare,
>> > +       .unprepare      = mtk_ref2usb_tx_unprepare,
>> > +};
>>
>> Burying the implementation of this special "mtk_ref2usb" clock in
>> clk-mt8173,c seems a bit awkward.
>> Can you please move it to its own file, like mediatek/clk-usb.c?
>
> Do you mean clk/mediatek/clk-usb.c?
>
> This clock is a MT8173 specific clock, which may not be reused by other
> SoCs. So I think it's not necessary to move it to a separated file.

Yes, this is a wrapper for a type of clock.  I think it would be
better in its own file, rather than embedded in clk-mt8173.c, which is
more about enumerating and initializing the clock tree.

Perhaps today it is only used for mt8173, but that may not be the case
in the future.

-Dan


>
>> > +
>> > +static struct clk *mtk_clk_register_ref2usb_tx(const char *name,
>> > +                       const char *parent_name, void __iomem *reg)
>> > +{
>> > +       struct mtk_ref2usb_tx *tx;
>> > +       struct clk_init_data init = {};
>> > +       struct clk *clk;
>> > +
>> > +       tx = kzalloc(sizeof(*tx), GFP_KERNEL);
>> > +       if (!tx)
>> > +               return ERR_PTR(-ENOMEM);
>> > +
>> > +       tx->base_addr = reg;
>> > +       tx->hw.init = &init;
>> > +
>> > +       init.name = name;
>> > +       init.ops = &mtk_ref2usb_tx_ops;
>> > +       init.parent_names = &parent_name;
>> > +       init.num_parents = 1;
>> > +
>> > +       clk = clk_register(NULL, &tx->hw);
>> > +
>> > +       if (IS_ERR(clk)) {
>> > +               pr_err("Failed to register clk %s: %ld\n", name, PTR_ERR(clk));
>> > +               kfree(tx);
>> > +       }
>> > +
>> > +       return clk;
>> > +}
>> > +
>> > +struct mtk_apmixed_ex {
>> > +       int id;
>> > +       const char *name;
>> > +       const char *parent;
>> > +       u32 reg_ofs;
>> > +};
>> > +
>> > +#define APMIXED_EX(_id, _name, _parent, _reg_ofs) {                    \
>> > +               .id = _id,                                              \
>> > +               .name = _name,                                          \
>> > +               .parent = _parent,                                      \
>> > +               .reg_ofs = _reg_ofs,                                    \
>> > +       }
>> > +
>> > +static const struct mtk_apmixed_ex apmixed_ex[] = {
>>
>> __initconst
>
> OK. I'll fix it in next patch.
>
>> > +       APMIXED_EX(CLK_APMIXED_REF2USB_TX, "ref2usb_tx", "clk26m", 0x8),
>> > +};
>> > +
>> > +static void __init mtk_clk_register_apmixedsys_special(struct device_node *node,
>> > +                       struct clk_onecell_data *clk_data)
>> > +{
>> > +       void __iomem *base;
>> > +       struct clk *clk;
>> > +       int i;
>> > +
>> > +       base = of_iomap(node, 0);
>> > +       if (!base) {
>> > +               pr_err("%s(): ioremap failed\n", __func__);
>> > +               return;
>> > +       }
>> > +
>> > +       for (i = 0; i < ARRAY_SIZE(apmixed_ex); i++) {
>> > +               const struct mtk_apmixed_ex *ape = &apmixed_ex[i];
>> > +
>> > +               clk = mtk_clk_register_ref2usb_tx(ape->name, ape->parent,
>> > +                                                       base + ape->reg_ofs);
>> > +
>> > +               if (IS_ERR(clk)) {
>> > +                       pr_err("Failed to register clk %s: %ld\n", ape->name,
>> > +                                       PTR_ERR(clk));
>> > +                       continue;
>> > +               }
>> > +
>> > +               clk_data->clks[CLK_APMIXED_REF2USB_TX] = clk;
>>
>> This works assuming ARRAY_SIZE(apmixed_ex) == 1.
>> Either remove the loop since it is unnecessary, or do:
>>   clk_data->clks[ape->id] = clk;
>
> It should be "clk_data->clks[ape->id] = clk". I'll fix it in next patch.
>
>
> Best regards,
>
> James
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
