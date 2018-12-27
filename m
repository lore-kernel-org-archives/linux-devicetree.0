From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/1] clk: imx8qxp: make the name of clock ID generic
Date: Thu, 27 Dec 2018 15:54:47 -0600
Message-ID: <20181227215447.GA12514@bogus>
References: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, 23 Dec 2018 16:20:02 +0000, Aisheng Dong wrote:
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's make the name of clock ID generic to allow other SoCs to reuse
> the common part.
> 
> This patch only changes the clock id name and file name, so no
> functional change.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> According to Stephen's suggestion[1], resend the needed changes
> for 4.21 separately, then we can pick it up and send it as part
> of a follow-on fixes PR during the merge window next week.
> As there's still no users in kernel and the plan is also to avoid
> any using of it, so please help review at an early time.
> v1->v2:
>  * resend Patch [4/5] which needs to change for v4.21.
>  * update headfile name accordingly
> [1] https://patchwork.kernel.org/patch/10737463/
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 148 +++++++--------
>  drivers/clk/imx/clk-imx8qxp.c             | 154 ++++++++--------
>  include/dt-bindings/clock/imx8-clock.h    | 289 ++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/imx8qxp-clock.h | 289 ------------------------------
>  4 files changed, 440 insertions(+), 440 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-clock.h
>  delete mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
