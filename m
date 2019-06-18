From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 2/2] macb: Add support for SiFive FU540-C000
Date: Tue, 18 Jun 2019 09:34:02 +0530
Message-ID: <CAJ2_jOEm1+HFewpvq6fdoHaTtghpnxkkz9LWTz3-xWJAtYp8-g@mail.gmail.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <1560745167-9866-3-git-send-email-yash.shah@sifive.com> <20190617155834.GK25211@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190617155834.GK25211@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 9:28 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Jun 17, 2019 at 09:49:27AM +0530, Yash Shah wrote:
...
> >  static const struct macb_config at91sam9260_config = {
> >       .caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
> >       .clk_init = macb_clk_init,
> > @@ -3992,6 +4112,9 @@ static int at91ether_init(struct platform_device *pdev)
> >       { .compatible = "cdns,emac", .data = &emac_config },
> >       { .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config},
> >       { .compatible = "cdns,zynq-gem", .data = &zynq_config },
> > +#ifdef CONFIG_MACB_SIFIVE_FU540
> > +     { .compatible = "sifive,fu540-macb", .data = &fu540_c000_config },
> > +#endif
>
> This #ifdef should not be needed.
>
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, macb_dt_ids);
> > @@ -4199,6 +4322,9 @@ static int macb_probe(struct platform_device *pdev)
> >
> >  err_disable_clocks:
> >       clk_disable_unprepare(tx_clk);
> > +#ifdef CONFIG_MACB_SIFIVE_FU540
> > +     clk_unregister(tx_clk);
> > +#endif
>
> So long as tx_clk is NULL, you can call clk_unregister(). So please
> remove the #ifdef.
>
>
> >       clk_disable_unprepare(hclk);
> >       clk_disable_unprepare(pclk);
> >       clk_disable_unprepare(rx_clk);
> > @@ -4233,6 +4359,9 @@ static int macb_remove(struct platform_device *pdev)
> >               pm_runtime_dont_use_autosuspend(&pdev->dev);
> >               if (!pm_runtime_suspended(&pdev->dev)) {
> >                       clk_disable_unprepare(bp->tx_clk);
> > +#ifdef CONFIG_MACB_SIFIVE_FU540
> > +                     clk_unregister(bp->tx_clk);
> > +#endif
>
> Same here.
>
> In general try to avoid #ifdef in C code.

Will remove all the #ifdef in v3.
Thanks for your comments.

- Yash
