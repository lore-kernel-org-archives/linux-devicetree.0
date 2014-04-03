From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v7 2/3] clk: exynos5410: register clocks using common clock
 framework
Date: Wed, 02 Apr 2014 21:21:39 -0700
Message-ID: <20140403042139.5762.23354@quantum>
References: <1393213435-20863-1-git-send-email-t.dakhran@samsung.com>
 <1393213435-20863-3-git-send-email-t.dakhran@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1393213435-20863-3-git-send-email-t.dakhran@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>, Tarek Dakhran <t.dakhran@samsung.com>
List-Id: devicetree@vger.kernel.org

Quoting Tarek Dakhran (2014-02-23 19:43:54)
> +External clock:
> +
> +There is clock that is generated outside the SoC. It is expected
> +that it is defined using standard clock bindings with following
> +clock-output-name:
> + - "fin_pll" - PLL input clock - required.

<snip>

> +Example 2: Required external clock.
> +
> +       fin_pll: clock-fin-pll {
> +               compatible = "fixed-clock";
> +               reg = <0>;
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +               clock-output-names = "fin_pll";
> +       };

I guess this part is a little strange for a binding definition.
Basically this is DTS data specific to 5410; not sure why it belongs in
the DT binding definition.

Rest of the clock driver appears OK to me.

Regards,
Mike
