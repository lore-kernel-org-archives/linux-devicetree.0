From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7d: fix LCDIF clock assignment
Date: Wed, 23 Nov 2016 21:02:25 -0200
Message-ID: <CAOMZO5AqKupmmKb4biGfmy4v3ZwS-BFjPY=MLd8Rc0ZXL+vQvg@mail.gmail.com>
References: <20161123004204.10851-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161123004204.10851-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Liu Ying <Ying.Liu@freescale.com>, linux-kernel <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Peter Chen <peter.chen@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 10:42 PM, Stefan Agner <stefan@agner.ch> wrote:
> The eLCDIF IP of the i.MX 7 SoC knows multiple clocks and lists them
> separately:
>
> Clock      Clock Root              Description
> apb_clk    MAIN_AXI_CLK_ROOT       AXI clock
> pix_clk    LCDIF_PIXEL_CLK_ROOT    Pixel clock
> ipg_clk_s  MAIN_AXI_CLK_ROOT       Peripheral access clock
>
> All of them are switched by a single gate, which is part of the
> IMX7D_LCDIF_PIXEL_ROOT_CLK clock. Hence using that clock also for
> the AXI bus clock (clock-name "axi") makes sure the gate gets
> enabled when accessing registers.
>
> There seem to be no separate AXI display clock, and the clock is
> optional. Hence remove the dummy clock.
>
> This fixes kernel freezes when starting the X-Server (which
> disables/re-enables the display controller).
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
