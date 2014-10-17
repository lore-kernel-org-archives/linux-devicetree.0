From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/3] power-domain: add power domain drivers for
 Rockchip platform
Date: Fri, 17 Oct 2014 15:56:57 +0200
Message-ID: <CAMuHMdUPCP2BZUBmLaxzxAnKM7U73UGu_wsuswHtEYm2aYurxg@mail.gmail.com>
References: <1413457353-4222-1-git-send-email-jinkun.hong@rock-chips.com>
	<1413457353-4222-2-git-send-email-jinkun.hong@rock-chips.com>
	<CAPDyKFoHkr-Z3PY0tTw9BPF8gJY_bVLtJL2KK7_uoq_008ymnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFoHkr-Z3PY0tTw9BPF8gJY_bVLtJL2KK7_uoq_008ymnw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "jinkun.hong" <jinkun.hong@rock-chips.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Jack Dai <jack.dai@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Ulf,

On Thu, Oct 16, 2014 at 3:06 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> +
>> +       ret = pm_clk_create(dev);
>> +       if (ret) {
>> +               dev_err(dev, "pm_clk_create failed %d\n", ret);
>> +               return;
>> +       };
>> +
>> +       while ((clk = of_clk_get(dev->of_node, i++)) && !IS_ERR(clk)) {
>> +               ret = pm_clk_add_clk(dev, clk);
>> +               if (ret) {
>> +                       dev_err(dev, "pm_clk_add_clk failed %d\n", ret);
>> +                       goto clk_err;
>> +               };
>> +       }
>> +
>> +       if (!IS_ENABLED(CONFIG_PM_RUNTIME)) {
>
> Could you elaborate on why you need to do this check here?

If runtime PM is enabled, the clocks are managed by runtime PM, and will
be enabled/disabled later when needed.

If runtime PM is disabled, the clocks are not managed by runtime PM,
so they should be enabled at initialization time.

Grygorii and I do the same thing for keystone resp. pm-rmobile.

> When I see a check for IS_ENABLED(CONFIG_PM_RUNTIME), that indicates
> to me that we actually have an another issue, perhaps in the PM clk
> API.

Good point. Perhaps this can be handled in pm_clk_add() instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
