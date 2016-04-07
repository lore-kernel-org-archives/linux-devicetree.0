From: Yassin Jaffer <yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors
 Interface) module clock driver for sun[457]i
Date: Thu, 7 Apr 2016 04:55:42 -0700 (PDT)
Message-ID: <ed04cdff-ef29-4fdf-811a-d8084ca86e4a@googlegroups.com>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
 <20160318192535.GR30977@lukather>
Reply-To: yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1562_1348376410.1460030142312"
Return-path: <linux-sunxi+bncBDCKXM7WZYLRBP4VTG4AKGQEH7PHZRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160318192535.GR30977@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_1562_1348376410.1460030142312
Content-Type: multipart/alternative;
	boundary="----=_Part_1563_2068990815.1460030142313"

------=_Part_1563_2068990815.1460030142313
Content-Type: text/plain; charset=UTF-8

Hi Maxime

I had a look at your display clock driver.The only issue I have is setting 
the clock parents. A simple mask wont do it. 
I guess using table is the only way. The CSI is only clock which is using 
irregular parents mux. The remaining clocks
including VE, can be based on your display clock driver. 
Thanx.

On Monday, March 21, 2016 at 7:42:48 PM UTC+11, Maxime Ripard wrote:
>
> Hi Yassin, 
>
> On Thu, Mar 17, 2016 at 07:43:42PM +1100, yassin...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 
> <javascript:> wrote: 
> > From: Yassin Jaffer <yassin...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:>> 
> > 
> > This patch adds a composite clock type consisting of 
> > a clock gate, mux, configurable dividers, and a reset control. 
> > 
> > Signed-off-by: Yassin Jaffer <yassin...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:>> 
> > --- 
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   1 + 
> >  drivers/clk/sunxi/Makefile                        |   1 + 
> >  drivers/clk/sunxi/clk-a10-csi.c                   | 188 
> ++++++++++++++++++++++ 
> >  3 files changed, 190 insertions(+) 
> >  create mode 100644 drivers/clk/sunxi/clk-a10-csi.c 
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt 
> b/Documentation/devicetree/bindings/clock/sunxi.txt 
> > index e59f57b..c3826f7 100644 
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt 
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt 
> > @@ -77,6 +77,7 @@ Required properties: 
> >          "allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on 
> A80 
> >          "allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets 
> on A80 
> >          "allwinner,sun4i-a10-ve-clk" - for the Video Engine clock 
> > +        "allwinner,sun4i-a10-csi-clk" - for the CSI module 
> >   
> >  Required properties for all clocks: 
> >  - reg : shall be the control register address for the clock. 
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile 
> > index 3fd7901..42ce752 100644 
> > --- a/drivers/clk/sunxi/Makefile 
> > +++ b/drivers/clk/sunxi/Makefile 
> > @@ -7,6 +7,7 @@ obj-y += clk-a10-codec.o 
> >  obj-y += clk-a10-hosc.o 
> >  obj-y += clk-a10-mod1.o 
> >  obj-y += clk-a10-pll2.o 
> > +obj-y += clk-a10-csi.o 
> >  obj-y += clk-a10-ve.o 
> >  obj-y += clk-a20-gmac.o 
> >  obj-y += clk-mod0.o 
> > diff --git a/drivers/clk/sunxi/clk-a10-csi.c 
> b/drivers/clk/sunxi/clk-a10-csi.c 
> > new file mode 100644 
> > index 0000000..f17d206 
> > --- /dev/null 
> > +++ b/drivers/clk/sunxi/clk-a10-csi.c 
> > @@ -0,0 +1,188 @@ 
> > +/* 
> > + * Copyright 2016 Yassin Jaffer 
> > + * 
> > + * Yassin Jaffer <yassin...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:>> 
> > + * 
> > + * This program is free software; you can redistribute it and/or modify 
> > + * it under the terms of the GNU General Public License as published by 
> > + * the Free Software Foundation; either version 2 of the License, or 
> > + * (at your option) any later version. 
> > + * 
> > + * This program is distributed in the hope that it will be useful, 
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of 
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
> > + * GNU General Public License for more details. 
> > + */ 
> > + 
> > +#include <linux/clk-provider.h> 
> > +#include <linux/of_address.h> 
> > +#include <linux/reset-controller.h> 
> > +#include <linux/slab.h> 
> > +#include <linux/spinlock.h> 
> > + 
> > +static DEFINE_SPINLOCK(sun4i_csi_lock); 
> > + 
> > +#define SUN4I_CSI_PARENTS       5 
> > +#define SUN4I_CSI_GATE_BIT      31 
> > +#define SUN4I_CSI_RESET_BIT     30 
> > +#define SUN4I_CSI_MUX_SHIFT     24 
> > +#define SUN4I_CSI_DIV_WIDTH     5 
> > +#define SUN4I_CSI_DIV_SHIFT     0 
> > + 
> > +static u32 sun4i_csi_mux_table[SUN4I_CSI_PARENTS] = { 
> > +        0x0, 
> > +        0x1, 
> > +        0x2, 
> > +        0x5, 
> > +        0x6, 
> > +}; 
> > + 
> > +struct csi_reset_data { 
> > +        void __iomem                        *reg; 
> > +        spinlock_t                        *lock; /* lock for reset 
> handling */ 
> > +        struct reset_controller_dev        rcdev; 
> > +}; 
> > + 
> > +static int sun4i_csi_assert(struct reset_controller_dev *rcdev, 
> > +                            unsigned long id) 
> > +{ 
> > +        struct csi_reset_data *data = container_of(rcdev, 
> > +                                                  struct 
> csi_reset_data, 
> > +                                                  rcdev); 
> > +        unsigned long flags; 
> > +        u32 reg; 
> > + 
> > +        spin_lock_irqsave(data->lock, flags); 
> > + 
> > +        reg = readl(data->reg); 
> > +        writel(reg & ~BIT(SUN4I_CSI_RESET_BIT), data->reg); 
> > + 
> > +        spin_unlock_irqrestore(data->lock, flags); 
> > + 
> > +        return 0; 
> > +} 
> > + 
> > +static int sun4i_csi_deassert(struct reset_controller_dev *rcdev, 
> > +                              unsigned long id) 
> > +{ 
> > +        struct csi_reset_data *data = container_of(rcdev, 
> > +                                                  struct 
> csi_reset_data, 
> > +                                                  rcdev); 
> > +        unsigned long flags; 
> > +        u32 reg; 
> > + 
> > +        spin_lock_irqsave(data->lock, flags); 
> > + 
> > +        reg = readl(data->reg); 
> > +        writel(reg | BIT(SUN4I_CSI_RESET_BIT), data->reg); 
> > + 
> > +        spin_unlock_irqrestore(data->lock, flags); 
> > + 
> > +        return 0; 
> > +} 
> > + 
> > +static int sun4i_csi_of_xlate(struct reset_controller_dev *rcdev, 
> > +                              const struct of_phandle_args *reset_spec) 
> > +{ 
> > +        if (WARN_ON(reset_spec->args_count != 0)) 
> > +                return -EINVAL; 
> > + 
> > +        return 0; 
> > +} 
> > + 
> > +static struct reset_control_ops sun4i_csi_reset_ops = { 
> > +        .assert                = sun4i_csi_assert, 
> > +        .deassert        = sun4i_csi_deassert, 
> > +}; 
> > + 
> > +static void __init sun4i_csi_clk_setup(struct device_node *node) 
> > +{ 
> > +        const char *parents[SUN4I_CSI_PARENTS]; 
> > +        const char *clk_name = node->name; 
> > +        struct csi_reset_data *reset_data; 
> > +        struct clk_divider *div; 
> > +        struct clk_gate *gate; 
> > +        struct clk_mux *mux; 
> > +        void __iomem *reg; 
> > +        struct clk *clk; 
> > +        int i = 0; 
> > + 
> > +        reg = of_io_request_and_map(node, 0, of_node_full_name(node)); 
> > +        if (IS_ERR(reg)) 
> > +                return; 
> > + 
> > +        of_property_read_string(node, "clock-output-names", &clk_name); 
> > + 
> > +        i = of_clk_parent_fill(node, parents, SUN4I_CSI_PARENTS); 
> > + 
> > +        mux = kzalloc(sizeof(*mux), GFP_KERNEL); 
> > +        if (!mux) 
> > +                goto err_unmap; 
> > + 
> > +        mux->reg = reg; 
> > +        mux->shift = SUN4I_CSI_MUX_SHIFT; 
> > +        mux->table = sun4i_csi_mux_table; 
> > +        mux->lock = &sun4i_csi_lock; 
> > + 
> > +        gate = kzalloc(sizeof(*gate), GFP_KERNEL); 
> > +        if (!gate) 
> > +                goto err_free_mux; 
> > + 
> > +        gate->reg = reg; 
> > +        gate->bit_idx = SUN4I_CSI_GATE_BIT; 
> > +        gate->lock = &sun4i_csi_lock; 
> > + 
> > +        div = kzalloc(sizeof(*div), GFP_KERNEL); 
> > +        if (!div) 
> > +                goto err_free_gate; 
> > + 
> > +        div->reg = reg; 
> > +        div->shift = SUN4I_CSI_DIV_SHIFT; 
> > +        div->width = SUN4I_CSI_DIV_WIDTH; 
> > +        div->lock = &sun4i_csi_lock; 
> > + 
> > +        clk = clk_register_composite(NULL, clk_name, 
> > +                                     parents, i, 
> > +                                     &mux->hw, &clk_mux_ops, 
> > +                                     &div->hw, &clk_divider_ops, 
> > +                                     &gate->hw, &clk_gate_ops, 
> > +                                     CLK_SET_RATE_PARENT); 
> > +        if (IS_ERR(clk)) 
> > +                goto err_free_div; 
> > + 
> > +        of_clk_add_provider(node, of_clk_src_simple_get, clk); 
> > + 
> > +        reset_data = kzalloc(sizeof(*reset_data), GFP_KERNEL); 
> > +        if (!reset_data) 
> > +                goto err_free_clk; 
> > + 
> > +        reset_data->reg = reg; 
> > +        reset_data->lock = &sun4i_csi_lock; 
> > +        reset_data->rcdev.nr_resets = 1; 
> > +        reset_data->rcdev.ops = &sun4i_csi_reset_ops; 
> > +        reset_data->rcdev.of_node = node; 
> > +        reset_data->rcdev.of_xlate = sun4i_csi_of_xlate; 
> > +        reset_data->rcdev.of_reset_n_cells = 0; 
> > + 
> > +        if (reset_controller_register(&reset_data->rcdev)) 
> > +                goto err_free_reset; 
> > + 
> > +        return; 
> > + 
> > +err_free_reset: 
> > +        kfree(reset_data); 
> > +err_free_clk: 
> > +        clk_unregister(clk); 
> > +err_free_div: 
> > +        kfree(div); 
> > +err_free_gate: 
> > +        kfree(gate); 
> > +err_free_mux: 
> > +        kfree(mux); 
> > +err_unmap: 
> > +        iounmap(reg); 
> > +} 
> > + 
> > +CLK_OF_DECLARE(sun4i_csi, "allwinner,sun4i-a10-csi-clk", 
> > +               sun4i_csi_clk_setup); 
> > + 
>
> That's great, but it shares a lot of infrastructure of boilerplate 
> code with the display clocks that are part of my DRM serie. 
>
> I plan to post them early next week, I'll cc you so that you can base 
> your clock on top of it. 
>
> Thanks! 
> Maxime 
>
> -- 
> Maxime Ripard, Free Electrons 
> Embedded Linux, Kernel and Android engineering 
> http://free-electrons.com 
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_1563_2068990815.1460030142313
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgTWF4aW1lPGJyPjxicj5JIGhhZCBhIGxvb2sgYXQgeW91ciBkaXNw
bGF5IGNsb2NrIGRyaXZlci5UaGUgb25seSBpc3N1ZSBJIGhhdmUgaXMgc2V0dGluZyB0aGUgY2xv
Y2sgcGFyZW50cy4gQSBzaW1wbGUgbWFzayB3b250IGRvIGl0LiA8YnI+SSBndWVzcyB1c2luZyB0
YWJsZSBpcyB0aGUgb25seSB3YXkuIFRoZSBDU0kgaXMgb25seSBjbG9jayB3aGljaCBpcyB1c2lu
ZyBpcnJlZ3VsYXIgcGFyZW50cyBtdXguIFRoZSByZW1haW5pbmcgY2xvY2tzPGJyPmluY2x1ZGlu
ZyBWRSwgY2FuIGJlIGJhc2VkIG9uIHlvdXIgZGlzcGxheSBjbG9jayBkcml2ZXIuIDxicj5UaGFu
eC48YnI+PGJyPk9uIE1vbmRheSwgTWFyY2ggMjEsIDIwMTYgYXQgNzo0Mjo0OCBQTSBVVEMrMTEs
IE1heGltZSBSaXBhcmQgd3JvdGU6PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOiAwO21hcmdpbi1sZWZ0OiAwLjhleDtib3JkZXItbGVmdDogMXB4ICNjY2Mgc29s
aWQ7cGFkZGluZy1sZWZ0OiAxZXg7Ij5IaSBZYXNzaW4sDQo8YnI+DQo8YnI+T24gVGh1LCBNYXIg
MTcsIDIwMTYgYXQgMDc6NDM6NDJQTSArMTEwMCwgPGEgaHJlZj0iamF2YXNjcmlwdDoiIHRhcmdl
dD0iX2JsYW5rIiBnZGYtb2JmdXNjYXRlZC1tYWlsdG89IjVYckhmYkJtQXdBSiIgcmVsPSJub2Zv
bGxvdyIgb25tb3VzZWRvd249InRoaXMuaHJlZj0mIzM5O2phdmFzY3JpcHQ6JiMzOTs7cmV0dXJu
IHRydWU7IiBvbmNsaWNrPSJ0aGlzLmhyZWY9JiMzOTtqYXZhc2NyaXB0OiYjMzk7O3JldHVybiB0
cnVlOyI+eWFzc2luLi4uQGdtYWlsLmNvbTwvYT4gd3JvdGU6DQo8YnI+Jmd0OyBGcm9tOiBZYXNz
aW4gSmFmZmVyICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OiIgdGFyZ2V0PSJfYmxhbmsiIGdkZi1v
YmZ1c2NhdGVkLW1haWx0bz0iNVhySGZiQm1Bd0FKIiByZWw9Im5vZm9sbG93IiBvbm1vdXNlZG93
bj0idGhpcy5ocmVmPSYjMzk7amF2YXNjcmlwdDomIzM5OztyZXR1cm4gdHJ1ZTsiIG9uY2xpY2s9
InRoaXMuaHJlZj0mIzM5O2phdmFzY3JpcHQ6JiMzOTs7cmV0dXJuIHRydWU7Ij55YXNzaW4uLi5A
Z21haWwuY29tPC9hPiZndDsNCjxicj4mZ3Q7IA0KPGJyPiZndDsgVGhpcyBwYXRjaCBhZGRzIGEg
Y29tcG9zaXRlIGNsb2NrIHR5cGUgY29uc2lzdGluZyBvZg0KPGJyPiZndDsgYSBjbG9jayBnYXRl
LCBtdXgsIGNvbmZpZ3VyYWJsZSBkaXZpZGVycywgYW5kIGEgcmVzZXQgY29udHJvbC4NCjxicj4m
Z3Q7IA0KPGJyPiZndDsgU2lnbmVkLW9mZi1ieTogWWFzc2luIEphZmZlciAmbHQ7PGEgaHJlZj0i
amF2YXNjcmlwdDoiIHRhcmdldD0iX2JsYW5rIiBnZGYtb2JmdXNjYXRlZC1tYWlsdG89IjVYckhm
YkJtQXdBSiIgcmVsPSJub2ZvbGxvdyIgb25tb3VzZWRvd249InRoaXMuaHJlZj0mIzM5O2phdmFz
Y3JpcHQ6JiMzOTs7cmV0dXJuIHRydWU7IiBvbmNsaWNrPSJ0aGlzLmhyZWY9JiMzOTtqYXZhc2Ny
aXB0OiYjMzk7O3JldHVybiB0cnVlOyI+eWFzc2luLi4uQGdtYWlsLmNvbTwvYT4mZ3Q7DQo8YnI+
Jmd0OyAtLS0NCjxicj4mZ3Q7IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlLzx3YnI+YmluZGlu
Z3MvY2xvY2svc3VueGkudHh0IHwgwqAgMSArDQo8YnI+Jmd0OyDCoGRyaXZlcnMvY2xrL3N1bnhp
L01ha2VmaWxlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCDCoCAxICsNCjxi
cj4mZ3Q7IMKgZHJpdmVycy9jbGsvc3VueGkvY2xrLWExMC08d2JyPmNzaS5jIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHwgMTg4ICsrKysrKysrKysrKysrKysrKysrKysNCjxicj4mZ3Q7IMKg
MyBmaWxlcyBjaGFuZ2VkLCAxOTAgaW5zZXJ0aW9ucygrKQ0KPGJyPiZndDsgwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9jbGsvc3VueGkvY2xrLWExMC1jc2kuPHdicj5jDQo8YnI+Jmd0OyAN
Cjxicj4mZ3Q7IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvPHdicj5iaW5k
aW5ncy9jbG9jay9zdW54aS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvPHdicj5iaW5k
aW5ncy9jbG9jay9zdW54aS50eHQNCjxicj4mZ3Q7IGluZGV4IGU1OWY1N2IuLmMzODI2ZjcgMTAw
NjQ0DQo8YnI+Jmd0OyAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvPHdicj5iaW5kaW5n
cy9jbG9jay9zdW54aS50eHQNCjxicj4mZ3Q7ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS88d2JyPmJpbmRpbmdzL2Nsb2NrL3N1bnhpLnR4dA0KPGJyPiZndDsgQEAgLTc3LDYgKzc3LDcg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoNCjxicj4mZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoCZxdW90
O2FsbHdpbm5lcixzdW45aS1hODAtPHdicj51c2ItbW9kLWNsayZxdW90OyAtIGZvciB1c2IgZ2F0
ZXMgKyByZXNldHMgb24gQTgwDQo8YnI+Jmd0OyDCoMKgwqDCoMKgwqDCoMKgwqAmcXVvdDthbGx3
aW5uZXIsc3VuOWktYTgwLTx3YnI+dXNiLXBoeS1jbGsmcXVvdDsgLSBmb3IgdXNiIHBoeSBnYXRl
cyArIHJlc2V0cyBvbiBBODANCjxicj4mZ3Q7IMKgwqDCoMKgwqDCoMKgwqDCoCZxdW90O2FsbHdp
bm5lcixzdW40aS1hMTAtPHdicj52ZS1jbGsmcXVvdDsgLSBmb3IgdGhlIFZpZGVvIEVuZ2luZSBj
bG9jaw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqAmcXVvdDthbGx3aW5uZXIsc3VuNGktYTEw
LTx3YnI+Y3NpLWNsayZxdW90OyAtIGZvciB0aGUgQ1NJIG1vZHVsZQ0KPGJyPiZndDsgwqANCjxi
cj4mZ3Q7IMKgUmVxdWlyZWQgcHJvcGVydGllcyBmb3IgYWxsIGNsb2NrczoNCjxicj4mZ3Q7IMKg
LSByZWcgOiBzaGFsbCBiZSB0aGUgY29udHJvbCByZWdpc3RlciBhZGRyZXNzIGZvciB0aGUgY2xv
Y2suDQo8YnI+Jmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3VueGkvTWFrZWZpbGUgYi9k
cml2ZXJzL2Nsay9zdW54aS9NYWtlZmlsZQ0KPGJyPiZndDsgaW5kZXggM2ZkNzkwMS4uNDJjZTc1
MiAxMDA2NDQNCjxicj4mZ3Q7IC0tLSBhL2RyaXZlcnMvY2xrL3N1bnhpL01ha2VmaWxlDQo8YnI+
Jmd0OyArKysgYi9kcml2ZXJzL2Nsay9zdW54aS9NYWtlZmlsZQ0KPGJyPiZndDsgQEAgLTcsNiAr
Nyw3IEBAIG9iai15ICs9IGNsay1hMTAtY29kZWMubw0KPGJyPiZndDsgwqBvYmoteSArPSBjbGst
YTEwLWhvc2Mubw0KPGJyPiZndDsgwqBvYmoteSArPSBjbGstYTEwLW1vZDEubw0KPGJyPiZndDsg
wqBvYmoteSArPSBjbGstYTEwLXBsbDIubw0KPGJyPiZndDsgK29iai15ICs9IGNsay1hMTAtY3Np
Lm8NCjxicj4mZ3Q7IMKgb2JqLXkgKz0gY2xrLWExMC12ZS5vDQo8YnI+Jmd0OyDCoG9iai15ICs9
IGNsay1hMjAtZ21hYy5vDQo8YnI+Jmd0OyDCoG9iai15ICs9IGNsay1tb2QwLm8NCjxicj4mZ3Q7
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS9jbGstYTEwLTx3YnI+Y3NpLmMgYi9kcml2
ZXJzL2Nsay9zdW54aS9jbGstYTEwLTx3YnI+Y3NpLmMNCjxicj4mZ3Q7IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo8YnI+Jmd0OyBpbmRleCAwMDAwMDAwLi5mMTdkMjA2DQo8YnI+Jmd0OyAtLS0gL2Rl
di9udWxsDQo8YnI+Jmd0OyArKysgYi9kcml2ZXJzL2Nsay9zdW54aS9jbGstYTEwLTx3YnI+Y3Np
LmMNCjxicj4mZ3Q7IEBAIC0wLDAgKzEsMTg4IEBADQo8YnI+Jmd0OyArLyoNCjxicj4mZ3Q7ICsg
KiBDb3B5cmlnaHQgMjAxNiBZYXNzaW4gSmFmZmVyDQo8YnI+Jmd0OyArICoNCjxicj4mZ3Q7ICsg
KiBZYXNzaW4gSmFmZmVyICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OiIgdGFyZ2V0PSJfYmxhbmsi
IGdkZi1vYmZ1c2NhdGVkLW1haWx0bz0iNVhySGZiQm1Bd0FKIiByZWw9Im5vZm9sbG93IiBvbm1v
dXNlZG93bj0idGhpcy5ocmVmPSYjMzk7amF2YXNjcmlwdDomIzM5OztyZXR1cm4gdHJ1ZTsiIG9u
Y2xpY2s9InRoaXMuaHJlZj0mIzM5O2phdmFzY3JpcHQ6JiMzOTs7cmV0dXJuIHRydWU7Ij55YXNz
aW4uLi5AZ21haWwuY29tPC9hPiZndDsNCjxicj4mZ3Q7ICsgKg0KPGJyPiZndDsgKyAqIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3Ig
bW9kaWZ5DQo8YnI+Jmd0OyArICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCjxicj4mZ3Q7ICsgKiB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcg0K
PGJyPiZndDsgKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uDQo8YnI+Jmd0
OyArICoNCjxicj4mZ3Q7ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhv
cGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCjxicj4mZ3Q7ICsgKiBidXQgV0lUSE9VVCBBTlkg
V0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPGJyPiZndDsg
KyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
wqBTZWUgdGhlDQo8YnI+Jmd0OyArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4NCjxicj4mZ3Q7ICsgKi8NCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7ICsjaW5jbHVk
ZSAmbHQ7bGludXgvY2xrLXByb3ZpZGVyLmgmZ3Q7DQo8YnI+Jmd0OyArI2luY2x1ZGUgJmx0O2xp
bnV4L29mX2FkZHJlc3MuaCZndDsNCjxicj4mZ3Q7ICsjaW5jbHVkZSAmbHQ7bGludXgvcmVzZXQt
Y29udHJvbGxlci5oJmd0Ow0KPGJyPiZndDsgKyNpbmNsdWRlICZsdDtsaW51eC9zbGFiLmgmZ3Q7
DQo8YnI+Jmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L3NwaW5sb2NrLmgmZ3Q7DQo8YnI+Jmd0OyAr
DQo8YnI+Jmd0OyArc3RhdGljIERFRklORV9TUElOTE9DSyhzdW40aV9jc2lfPHdicj5sb2NrKTsN
Cjxicj4mZ3Q7ICsNCjxicj4mZ3Q7ICsjZGVmaW5lIFNVTjRJX0NTSV9QQVJFTlRTIMKgIMKgIMKg
IDUNCjxicj4mZ3Q7ICsjZGVmaW5lIFNVTjRJX0NTSV9HQVRFX0JJVCDCoCDCoCDCoDMxDQo8YnI+
Jmd0OyArI2RlZmluZSBTVU40SV9DU0lfUkVTRVRfQklUIMKgIMKgIDMwDQo8YnI+Jmd0OyArI2Rl
ZmluZSBTVU40SV9DU0lfTVVYX1NISUZUIMKgIMKgIDI0DQo8YnI+Jmd0OyArI2RlZmluZSBTVU40
SV9DU0lfRElWX1dJRFRIIMKgIMKgIDUNCjxicj4mZ3Q7ICsjZGVmaW5lIFNVTjRJX0NTSV9ESVZf
U0hJRlQgwqAgwqAgMA0KPGJyPiZndDsgKw0KPGJyPiZndDsgK3N0YXRpYyB1MzIgc3VuNGlfY3Np
X211eF90YWJsZVtTVU40SV9DU0lfPHdicj5QQVJFTlRTXSA9IHsNCjxicj4mZ3Q7ICvCoMKgwqDC
oMKgwqDCoMKgMHgwLA0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqAweDEsDQo8YnI+Jmd0OyAr
wqDCoMKgwqDCoMKgwqDCoDB4MiwNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgMHg1LA0KPGJy
PiZndDsgK8KgwqDCoMKgwqDCoMKgwqAweDYsDQo8YnI+Jmd0OyArfTsNCjxicj4mZ3Q7ICsNCjxi
cj4mZ3Q7ICtzdHJ1Y3QgY3NpX3Jlc2V0X2RhdGEgew0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKg
wqB2b2lkIF9faW9tZW3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgPHdicj7CoCpyZWc7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHNwaW5sb2NrX3TCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgPHdicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpsb2NrOyAv
KiBsb2NrIGZvciByZXNldCBoYW5kbGluZyAqLw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXbCoMKgwqDCoMKgwqDCoMKgPHdicj5yY2RldjsNCjxi
cj4mZ3Q7ICt9Ow0KPGJyPiZndDsgKw0KPGJyPiZndDsgK3N0YXRpYyBpbnQgc3VuNGlfY3NpX2Fz
c2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KPGJyPiZndDsgK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoCDCoHVuc2lnbmVk
IGxvbmcgaWQpDQo8YnI+Jmd0OyArew0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
Y3NpX3Jlc2V0X2RhdGEgKmRhdGEgPSBjb250YWluZXJfb2YocmNkZXYsDQo8YnI+Jmd0OyArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqBzdHJ1Y3QgY3NpX3Jl
c2V0X2RhdGEsDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgwqByY2Rldik7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxv
bmcgZmxhZ3M7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHUzMiByZWc7DQo8YnI+Jmd0OyAr
DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pcnFzYXZlKDx3YnI+ZGF0YS0m
Z3Q7bG9jaywgZmxhZ3MpOw0KPGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBy
ZWcgPSByZWFkbChkYXRhLSZndDtyZWcpOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqB3cml0
ZWwocmVnICZhbXA7IH5CSVQoU1VONElfQ1NJX1JFU0VUX0JJVCksIGRhdGEtJmd0O3JlZyk7DQo8
YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrXzx3YnI+aXJx
cmVzdG9yZShkYXRhLSZndDtsb2NrLCBmbGFncyk7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPGJyPiZndDsgK30NCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7
ICtzdGF0aWMgaW50IHN1bjRpX2NzaV9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9k
ZXYgKnJjZGV2LA0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgaWQpDQo8YnI+Jmd0OyArew0KPGJy
PiZndDsgK8KgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY3NpX3Jlc2V0X2RhdGEgKmRhdGEgPSBjb250
YWluZXJfb2YocmNkZXYsDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgwqBzdHJ1Y3QgY3NpX3Jlc2V0X2RhdGEsDQo8YnI+Jmd0OyArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDx3YnI+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqByY2Rldik7DQo8YnI+Jmd0
OyArwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo8YnI+Jmd0OyArwqDCoMKg
wqDCoMKgwqDCoHUzMiByZWc7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDC
oHNwaW5fbG9ja19pcnFzYXZlKDx3YnI+ZGF0YS0mZ3Q7bG9jaywgZmxhZ3MpOw0KPGJyPiZndDsg
Kw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqByZWcgPSByZWFkbChkYXRhLSZndDtyZWcpOw0K
PGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqB3cml0ZWwocmVnIHwgQklUKFNVTjRJX0NTSV9SRVNF
VF9CSVQpLCBkYXRhLSZndDtyZWcpOw0KPGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDC
oMKgwqBzcGluX3VubG9ja188d2JyPmlycXJlc3RvcmUoZGF0YS0mZ3Q7bG9jaywgZmxhZ3MpOw0K
PGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCjxicj4mZ3Q7
ICt9DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArc3RhdGljIGludCBzdW40aV9jc2lfb2ZfeGxhdGUo
c3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCjxicj4mZ3Q7ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAgwqAgwqBjb25zdCBzdHJ1
Y3Qgb2ZfcGhhbmRsZV9hcmdzICpyZXNldF9zcGVjKQ0KPGJyPiZndDsgK3sNCjxicj4mZ3Q7ICvC
oMKgwqDCoMKgwqDCoMKgaWYgKFdBUk5fT04ocmVzZXRfc3BlYy0mZ3Q7YXJnc188d2JyPmNvdW50
ICE9IDApKQ0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IC1FSU5WQUw7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHJldHVybiAw
Ow0KPGJyPiZndDsgK30NCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7ICtzdGF0aWMgc3RydWN0IHJlc2V0
X2NvbnRyb2xfb3BzIHN1bjRpX2NzaV9yZXNldF9vcHMgPSB7DQo8YnI+Jmd0OyArwqDCoMKgwqDC
oMKgwqDCoC5hc3NlcnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPHdicj7CoMKgPSBzdW40
aV9jc2lfYXNzZXJ0LA0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqAuZGVhc3NlcnTCoMKgwqDC
oMKgwqDCoMKgPSBzdW40aV9jc2lfZGVhc3NlcnQsDQo8YnI+Jmd0OyArfTsNCjxicj4mZ3Q7ICsN
Cjxicj4mZ3Q7ICtzdGF0aWMgdm9pZCBfX2luaXQgc3VuNGlfY3NpX2Nsa19zZXR1cChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUpDQo8YnI+Jmd0OyArew0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKg
wqBjb25zdCBjaGFyICpwYXJlbnRzW1NVTjRJX0NTSV9QQVJFTlRTXTsNCjxicj4mZ3Q7ICvCoMKg
wqDCoMKgwqDCoMKgY29uc3QgY2hhciAqY2xrX25hbWUgPSBub2RlLSZndDtuYW1lOw0KPGJyPiZn
dDsgK8KgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY3NpX3Jlc2V0X2RhdGEgKnJlc2V0X2RhdGE7DQo8
YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBjbGtfZGl2aWRlciAqZGl2Ow0KPGJyPiZn
dDsgK8KgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY2xrX2dhdGUgKmdhdGU7DQo8YnI+Jmd0OyArwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBjbGtfbXV4ICptdXg7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKg
wqDCoHZvaWQgX19pb21lbSAqcmVnOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
Y2xrICpjbGs7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoGludCBpID0gMDsNCjxicj4mZ3Q7
ICsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgcmVnID0gb2ZfaW9fcmVxdWVzdF9hbmRfbWFw
KG5vZGUsIDAsIG9mX25vZGVfZnVsbF9uYW1lKG5vZGUpKTsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKg
wqDCoMKgaWYgKElTX0VSUihyZWcpKQ0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuOw0KPGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBv
Zl9wcm9wZXJ0eV9yZWFkXzx3YnI+c3RyaW5nKG5vZGUsICZxdW90O2Nsb2NrLW91dHB1dC1uYW1l
cyZxdW90OywgJmFtcDtjbGtfbmFtZSk7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDCoMKgwqDC
oMKgwqDCoGkgPSBvZl9jbGtfcGFyZW50X2ZpbGwobm9kZSwgcGFyZW50cywgU1VONElfQ1NJX1BB
UkVOVFMpOw0KPGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBtdXggPSBremFs
bG9jKHNpemVvZigqbXV4KSwgR0ZQX0tFUk5FTCk7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDC
oGlmICghbXV4KQ0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBlcnJfdW5tYXA7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoG11eC0m
Z3Q7cmVnID0gcmVnOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBtdXgtJmd0O3NoaWZ0ID0g
U1VONElfQ1NJX01VWF9TSElGVDsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgbXV4LSZndDt0
YWJsZSA9IHN1bjRpX2NzaV9tdXhfdGFibGU7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoG11
eC0mZ3Q7bG9jayA9ICZhbXA7c3VuNGlfY3NpX2xvY2s7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyAr
wqDCoMKgwqDCoMKgwqDCoGdhdGUgPSBremFsbG9jKHNpemVvZigqZ2F0ZSksIEdGUF9LRVJORUwp
Ow0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBpZiAoIWdhdGUpDQo8YnI+Jmd0OyArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9mcmVlX211eDsNCjxicj4mZ3Q7ICsN
Cjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgZ2F0ZS0mZ3Q7cmVnID0gcmVnOw0KPGJyPiZndDsg
K8KgwqDCoMKgwqDCoMKgwqBnYXRlLSZndDtiaXRfaWR4ID0gU1VONElfQ1NJX0dBVEVfQklUOw0K
PGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBnYXRlLSZndDtsb2NrID0gJmFtcDtzdW40aV9jc2lf
bG9jazsNCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgZGl2ID0ga3phbGxv
YyhzaXplb2YoKmRpdiksIEdGUF9LRVJORUwpOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBp
ZiAoIWRpdikNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZXJyX2ZyZWVfZ2F0ZTsNCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgZGl2
LSZndDtyZWcgPSByZWc7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoGRpdi0mZ3Q7c2hpZnQg
PSBTVU40SV9DU0lfRElWX1NISUZUOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBkaXYtJmd0
O3dpZHRoID0gU1VONElfQ1NJX0RJVl9XSURUSDsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKg
ZGl2LSZndDtsb2NrID0gJmFtcDtzdW40aV9jc2lfbG9jazsNCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7
ICvCoMKgwqDCoMKgwqDCoMKgY2xrID0gY2xrX3JlZ2lzdGVyX2NvbXBvc2l0ZShOVUxMLCBjbGtf
bmFtZSwNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgPHdicj7CoMKgwqAgwqAgwqAgcGFyZW50cywgaSwNCjxicj4mZ3Q7
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgPHdicj7CoMKgwqAgwqAgwqAgJmFtcDttdXgtJmd0O2h3LCAmYW1wO2Nsa19tdXhfb3BzLA0K
PGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqA8d2JyPsKgwqDCoCDCoCDCoCAmYW1wO2Rpdi0mZ3Q7aHcsICZhbXA7Y2xrX2Rp
dmlkZXJfb3BzLA0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA8d2JyPsKgwqDCoCDCoCDCoCAmYW1wO2dhdGUtJmd0O2h3
LCAmYW1wO2Nsa19nYXRlX29wcywNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPHdicj7CoMKgwqAgwqAgwqAgQ0xLX1NF
VF9SQVRFX1BBUkVOVCk7DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIoY2xr
KSkNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2Zy
ZWVfZGl2Ow0KPGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBvZl9jbGtfYWRk
X3Byb3ZpZGVyKDx3YnI+bm9kZSwgb2ZfY2xrX3NyY19zaW1wbGVfZ2V0LCBjbGspOw0KPGJyPiZn
dDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqByZXNldF9kYXRhID0ga3phbGxvYyhzaXpl
b2YoKnJlc2V0X2RhdGEpLCBHRlBfS0VSTkVMKTsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKg
aWYgKCFyZXNldF9kYXRhKQ0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ290byBlcnJfZnJlZV9jbGs7DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKg
wqDCoHJlc2V0X2RhdGEtJmd0O3JlZyA9IHJlZzsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKg
cmVzZXRfZGF0YS0mZ3Q7bG9jayA9ICZhbXA7c3VuNGlfY3NpX2xvY2s7DQo8YnI+Jmd0OyArwqDC
oMKgwqDCoMKgwqDCoHJlc2V0X2RhdGEtJmd0O3JjZGV2Lm5yXzx3YnI+cmVzZXRzID0gMTsNCjxi
cj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgcmVzZXRfZGF0YS0mZ3Q7cmNkZXYub3BzID0gJmFtcDtz
dW40aV9jc2lfcmVzZXRfb3BzOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqByZXNldF9kYXRh
LSZndDtyY2Rldi5vZl88d2JyPm5vZGUgPSBub2RlOw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKg
wqByZXNldF9kYXRhLSZndDtyY2Rldi5vZl88d2JyPnhsYXRlID0gc3VuNGlfY3NpX29mX3hsYXRl
Ow0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqByZXNldF9kYXRhLSZndDtyY2Rldi5vZl88d2Jy
PnJlc2V0X25fY2VsbHMgPSAwOw0KPGJyPiZndDsgKw0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKg
wqBpZiAocmVzZXRfY29udHJvbGxlcl9yZWdpc3RlcigmYW1wOzx3YnI+cmVzZXRfZGF0YS0mZ3Q7
cmNkZXYpKQ0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBl
cnJfZnJlZV9yZXNldDsNCjxicj4mZ3Q7ICsNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuOw0KPGJyPiZndDsgKw0KPGJyPiZndDsgK2Vycl9mcmVlX3Jlc2V0Og0KPGJyPiZndDsgK8Kg
wqDCoMKgwqDCoMKgwqBrZnJlZShyZXNldF9kYXRhKTsNCjxicj4mZ3Q7ICtlcnJfZnJlZV9jbGs6
DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoGNsa191bnJlZ2lzdGVyKGNsayk7DQo8YnI+Jmd0
OyArZXJyX2ZyZWVfZGl2Og0KPGJyPiZndDsgK8KgwqDCoMKgwqDCoMKgwqBrZnJlZShkaXYpOw0K
PGJyPiZndDsgK2Vycl9mcmVlX2dhdGU6DQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoGtmcmVl
KGdhdGUpOw0KPGJyPiZndDsgK2Vycl9mcmVlX211eDoNCjxicj4mZ3Q7ICvCoMKgwqDCoMKgwqDC
oMKga2ZyZWUobXV4KTsNCjxicj4mZ3Q7ICtlcnJfdW5tYXA6DQo8YnI+Jmd0OyArwqDCoMKgwqDC
oMKgwqDCoGlvdW5tYXAocmVnKTsNCjxicj4mZ3Q7ICt9DQo8YnI+Jmd0OyArDQo8YnI+Jmd0OyAr
Q0xLX09GX0RFQ0xBUkUoc3VuNGlfY3NpLCAmcXVvdDthbGx3aW5uZXIsc3VuNGktYTEwLWNzaS1j
bGsmcXVvdDssDQo8YnI+Jmd0OyArwqDCoMKgwqDCoMKgwqDCoCDCoCDCoCDCoCBzdW40aV9jc2lf
Y2xrX3NldHVwKTsNCjxicj4mZ3Q7ICsNCjxicj4NCjxicj5UaGF0JiMzOTtzIGdyZWF0LCBidXQg
aXQgc2hhcmVzIGEgbG90IG9mIGluZnJhc3RydWN0dXJlIG9mIGJvaWxlcnBsYXRlDQo8YnI+Y29k
ZSB3aXRoIHRoZSBkaXNwbGF5IGNsb2NrcyB0aGF0IGFyZSBwYXJ0IG9mIG15IERSTSBzZXJpZS4N
Cjxicj4NCjxicj5JIHBsYW4gdG8gcG9zdCB0aGVtIGVhcmx5IG5leHQgd2VlaywgSSYjMzk7bGwg
Y2MgeW91IHNvIHRoYXQgeW91IGNhbiBiYXNlDQo8YnI+eW91ciBjbG9jayBvbiB0b3Agb2YgaXQu
DQo8YnI+DQo8YnI+VGhhbmtzIQ0KPGJyPk1heGltZQ0KPGJyPg0KPGJyPi0tIA0KPGJyPk1heGlt
ZSBSaXBhcmQsIEZyZWUgRWxlY3Ryb25zDQo8YnI+RW1iZWRkZWQgTGludXgsIEtlcm5lbCBhbmQg
QW5kcm9pZCBlbmdpbmVlcmluZw0KPGJyPjxhIGhyZWY9Imh0dHA6Ly9mcmVlLWVsZWN0cm9ucy5j
b20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vZm9sbG93IiBvbm1vdXNlZG93bj0idGhpcy5ocmVm
PSYjMzk7aHR0cDovL3d3dy5nb29nbGUuY29tL3VybD9xXDc1aHR0cCUzQSUyRiUyRmZyZWUtZWxl
Y3Ryb25zLmNvbVw0NnNhXDc1RFw0NnNudHpcMDc1MVw0NnVzZ1w3NUFGUWpDTkdDOEM5cFQ3eEtK
RWFiSVRMR0w1Y3F0b2xpZlEmIzM5OztyZXR1cm4gdHJ1ZTsiIG9uY2xpY2s9InRoaXMuaHJlZj0m
IzM5O2h0dHA6Ly93d3cuZ29vZ2xlLmNvbS91cmw/cVw3NWh0dHAlM0ElMkYlMkZmcmVlLWVsZWN0
cm9ucy5jb21cNDZzYVw3NURcNDZzbnR6XDA3NTFcNDZ1c2dcNzVBRlFqQ05HQzhDOXBUN3hLSkVh
YklUTEdMNWNxdG9saWZRJiMzOTs7cmV0dXJuIHRydWU7Ij5odHRwOi8vZnJlZS1lbGVjdHJvbnMu
Y29tPC9hPg0KPGJyPjwvYmxvY2txdW90ZT48L2Rpdj4NCg0KPHA+PC9wPgoKLS0gPGJyIC8+Cllv
dSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhl
IEdvb2dsZSBHcm91cHMgJnF1b3Q7bGludXgtc3VueGkmcXVvdDsgZ3JvdXAuPGJyIC8+ClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20g
aXQsIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOmxpbnV4LXN1bnhpK3Vuc3Vic2Ny
aWJlQGdvb2dsZWdyb3Vwcy5jb20iPmxpbnV4LXN1bnhpK3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+LjxiciAvPgpGb3IgbW9yZSBvcHRpb25zLCB2aXNpdCA8YSBocmVmPSJodHRwczov
L2dyb3Vwcy5nb29nbGUuY29tL2Qvb3B0b3V0Ij5odHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2Qv
b3B0b3V0PC9hPi48YnIgLz4K
------=_Part_1563_2068990815.1460030142313--

------=_Part_1562_1348376410.1460030142312--
