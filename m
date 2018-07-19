From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 10/10] drivers: clk: Add ZynqMP clock driver
Date: Thu, 19 Jul 2018 12:30:30 +0200
Message-ID: <6dadc5a6-7bc1-0e37-4df6-0278d9046c96@xilinx.com>
References: <1531857547-16652-1-git-send-email-jollys@xilinx.com>
 <1531857547-16652-11-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531857547-16652-11-git-send-email-jollys@xilinx.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, Tejas Patel <tejasp@xilinx.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stephen and Mike,

On 17.7.2018 21:59, Jolly Shah wrote:
> From: Jolly Shah <jolly.shah@xilinx.com>
> 
> This patch adds CCF compliant clock driver for ZynqMP.
> Clock driver queries supported clock information from
> firmware and regiters pll and output clocks with CCF.
> 
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> Signed-off-by: Tejas Patel <tejasp@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---
>  drivers/clk/Kconfig                  |   1 +
>  drivers/clk/Makefile                 |   1 +
>  drivers/clk/zynqmp/Kconfig           |  10 +
>  drivers/clk/zynqmp/Makefile          |   4 +
>  drivers/clk/zynqmp/clk-gate-zynqmp.c | 144 +++++++
>  drivers/clk/zynqmp/clk-mux-zynqmp.c  | 141 +++++++
>  drivers/clk/zynqmp/clk-zynqmp.h      |  68 ++++
>  drivers/clk/zynqmp/clkc.c            | 719 +++++++++++++++++++++++++++++++++++
>  drivers/clk/zynqmp/divider.c         | 217 +++++++++++
>  drivers/clk/zynqmp/pll.c             | 335 ++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |   1 +
>  11 files changed, 1641 insertions(+)
>  create mode 100644 drivers/clk/zynqmp/Kconfig
>  create mode 100644 drivers/clk/zynqmp/Makefile
>  create mode 100644 drivers/clk/zynqmp/clk-gate-zynqmp.c
>  create mode 100644 drivers/clk/zynqmp/clk-mux-zynqmp.c
>  create mode 100644 drivers/clk/zynqmp/clk-zynqmp.h
>  create mode 100644 drivers/clk/zynqmp/clkc.c
>  create mode 100644 drivers/clk/zynqmp/divider.c
>  create mode 100644 drivers/clk/zynqmp/pll.c

DT binding was reviewed by Stephen but I can't see any review for the
driver itself. Should I wait for your review or do you want to take
binding doc 09/10 and 10/10 separately or this can go via arm-soc tree?

Thanks,
Michal
