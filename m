From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Subject: Re: [PATCHv9 30/43] ARM: dts: am33xx clock data
Date: Sat, 26 Oct 2013 02:36:24 +0200
Message-ID: <1382747784.6200.4.camel@polaris.local>
References: <1382716658-6964-1-git-send-email-t-kristo@ti.com>
	 <1382716658-6964-31-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1382716658-6964-31-git-send-email-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, paul@pwsan.com, tony@atomide.com, nm@ti.com, bcousson@baylibre.com, rnayak@ti.com, mturquette@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2013-10-25 at 18:57 +0300, Tero Kristo wrote:
> +       mcasp0_fck: mcasp0_fck {
> +               #clock-cells = <0>;
> +               compatible = "fixed-factor-clock";
> +               clocks = <&sys_clkin_ck>;
> +               clock-mult = <1>;
> +               clock-div = <1>;
> +       };
> +
> +       mcasp1_fck: mcasp1_fck {
> +               #clock-cells = <0>;
> +               compatible = "fixed-factor-clock";
> +               clocks = <&sys_clkin_ck>;
> +               clock-mult = <1>;
> +               clock-div = <1>;
> +       };

What is you use case for these clocks with a fixed factor of 1? Wouldn't
it be simpler to just use sys_clkin_ck from the devices?

Regards,
Jan

