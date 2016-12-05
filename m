From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] ARM: dts: imx7d: fix LCDIF clock assignment
Date: Sun, 04 Dec 2016 17:26:58 -0800
Message-ID: <7e4829f484f6c4425fc9d01bea1a094f@agner.ch>
References: <20161123004204.10851-1-stefan@agner.ch>
 <CAOMZO5AqKupmmKb4biGfmy4v3ZwS-BFjPY=MLd8Rc0ZXL+vQvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5AqKupmmKb4biGfmy4v3ZwS-BFjPY=MLd8Rc0ZXL+vQvg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, Peter Chen <peter.chen@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Liu Ying <Ying.Liu@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn

On 2016-11-23 15:02, Fabio Estevam wrote:
> On Tue, Nov 22, 2016 at 10:42 PM, Stefan Agner <stefan@agner.ch> wrote:
>> The eLCDIF IP of the i.MX 7 SoC knows multiple clocks and lists them
>> separately:
>>
>> Clock      Clock Root              Description
>> apb_clk    MAIN_AXI_CLK_ROOT       AXI clock
>> pix_clk    LCDIF_PIXEL_CLK_ROOT    Pixel clock
>> ipg_clk_s  MAIN_AXI_CLK_ROOT       Peripheral access clock
>>
>> All of them are switched by a single gate, which is part of the
>> IMX7D_LCDIF_PIXEL_ROOT_CLK clock. Hence using that clock also for
>> the AXI bus clock (clock-name "axi") makes sure the gate gets
>> enabled when accessing registers.
>>
>> There seem to be no separate AXI display clock, and the clock is
>> optional. Hence remove the dummy clock.
>>
>> This fixes kernel freezes when starting the X-Server (which
>> disables/re-enables the display controller).
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Since this fixes a kernel freeze, is there a chance to get this still in
4.9?

--
Stefan
