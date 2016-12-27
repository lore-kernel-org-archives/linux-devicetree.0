From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/12] driver: pinctrl: imx: Add pinctrl driver support
 for imx6sll
Date: Tue, 27 Dec 2016 14:01:53 +0100
Message-ID: <CACRpkdZYH-X=SG7AfCOgKA9U0WL9941e-zo_tgUF74mdns2_7Q@mail.gmail.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-7-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1482832070-22668-7-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bai Ping <ping.bai@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, jacky.baip@gmail.com, Fabio Estevam <fabio.estevam@nxp.com>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2016 at 10:47 AM, Bai Ping <ping.bai@nxp.com> wrote:

> Add pinctrl driver support for imx6sll.
>
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
(...)
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -514,6 +514,7 @@ config SOC_IMX6SL
>
>  config SOC_IMX6SLL
>         bool "i.MX6 SoloLiteLite support"
> +       select PINCTRL_IMX6SLL

This needs to be separate so I can merge the pure pin control patch
to my tree.

Apart from that, look into using generic pinconf.

Yours,
Linus Walleij
