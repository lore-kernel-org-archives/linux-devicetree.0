From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 02/14] drivers: soc: sunxi: Add dedicated compatibles
 for the A13, A20 and A33
Date: Thu, 10 May 2018 22:05:33 -0700
Message-ID: <CAGb2v67An8RSCKEDSgW_jY7m8iw22K4rRHb02q67decmCBcjhg@mail.gmail.com>
References: <20180507124500.20434-1-paul.kocialkowski@bootlin.com>
 <20180507124500.20434-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180507124500.20434-3-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Smitha T Murthy <smitha.t@samsung.com>, Randy Li <ayaka@soulik.info>, Rob Herring <robh+dt@kernel.org>, Hugues Fruchet <hugues.fruchet@st.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdu>
List-Id: devicetree@vger.kernel.org

On Mon, May 7, 2018 at 5:44 AM, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
> This introduces platform-specific compatibles for the A13, A20 and A33
> SRAM driver. No particular adaptation for these platforms is required at
> this point, although this might become the case in the future.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 74cb81f37bd6..43ebc3bd33f2 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -315,6 +315,9 @@ static int sunxi_sram_probe(struct platform_device *pdev)
>
>  static const struct of_device_id sunxi_sram_dt_match[] = {
>         { .compatible = "allwinner,sun4i-a10-sram-controller" },
> +       { .compatible = "allwinner,sun5i-a13-sram-controller" },
> +       { .compatible = "allwinner,sun7i-a20-sram-controller" },
> +       { .compatible = "allwinner,sun8i-a33-sram-controller" },

We should probably name these "system-controller". Maxime?

ChenYu

>         { .compatible = "allwinner,sun50i-a64-sram-controller" },
>         { },
>  };
> --
> 2.16.3
>
