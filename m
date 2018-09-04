From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/7] clk: imx6q: add mmdc0 ipg clock
Date: Tue, 04 Sep 2018 08:36:55 -0500
Message-ID: <5b8e8a78.1c69fb81.7f961.8d87@mx.google.com>
References: <1535701998-20443-1-git-send-email-Anson.Huang@nxp.com>
 <1535701998-20443-7-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535701998-20443-7-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: mark.rutland@arm.com, aisheng.dong@nxp.com, shengjiu.wang@nxp.com, ping.bai@nxp.com, devicetree@vger.kernel.org, sboyd@kernel.org, s.hauer@pengutronix.de, linux-clk@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, colin.didier@devialet.com, robh+dt@kernel.org, clement.peron@devialet.com, Linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, michael@amarulasolutions.com, shawnguo@kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, matteo.lisi@engicam.com
List-Id: devicetree@vger.kernel.org

On Fri, 31 Aug 2018 15:53:17 +0800, Anson Huang wrote:
> i.MX6Q has MMDC0 ipg clock in CCM CCGR, add it into
> clock tree for clock management.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx6q.c               | 1 +
>  include/dt-bindings/clock/imx6qdl-clock.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
