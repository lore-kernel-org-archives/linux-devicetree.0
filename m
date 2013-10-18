From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: ux500: fix clock for GPIO blocks 6 and 7
Date: Fri, 18 Oct 2013 12:05:57 +0100
Message-ID: <20131018110557.GW19112@lee--X1>
References: <1382087112-31665-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382087112-31665-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Oct 2013, Linus Walleij wrote:

> The clock assignment in the device tree for GPIO blocks 6
> and 7 was incorrect, indicating this was managed by bit 1 on
> PRCC 2 while it was in fact bit 11 on PRCC 2.

Nice catch.

It's also wrong in the driver:

        clk =3D clk_reg_prcc_pclk("p2_pclk10", "per2clk", clkrst2_base,
                                BIT(10), 0);
        clk_register_clkdev(clk, "hsit_hclk", "ste_hsi.0");
        PRCC_PCLK_STORE(clk, 2, 10);
=20
        clk =3D clk_reg_prcc_pclk("p2_pclk11", "per2clk", clkrst2_base,
                                BIT(11), 0);
        clk_register_clkdev(clk, NULL, "gpio.6");
        clk_register_clkdev(clk, NULL, "gpio.7");
        clk_register_clkdev(clk, NULL, "gpioblock1");
        PRCC_PCLK_STORE(clk, 2, 1);
=20
        clk =3D clk_reg_prcc_pclk("p2_pclk12", "per2clk", clkrst2_base,
                                BIT(12), 0);
        PRCC_PCLK_STORE(clk, 2, 12);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
