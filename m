From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCh v3 3/4] arm64: add support for i.MX8M EVK board
Date: Thu, 27 Sep 2018 14:16:06 -0500
Message-ID: <20180927191606.GA7705@bogus>
References: <20180921125626.21971-1-l.stach@pengutronix.de>
 <20180921125626.21971-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180921125626.21971-3-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Sep 2018 14:56:25 +0200, Lucas Stach wrote:
> This is the evaluation kit board for the i.MX8M. The current level of
> support yields a working console and is able to boot userspace from
> SD card or Network.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com> (v1)
> Tested-by: Tested-by: Baruch Siach <baruch@tkos.co.il> (v1)
> ---
> v2:
> - move to freescale folder
> - fix indentation
> - fix typo in Makefile
> - document compatible
> - switch to generic pinconf
> v3:
> - rebase to v4.19-rc1 and already merged pinctrl driver and pending
>   clk driver
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt |   4 +
>  arch/arm64/boot/dts/freescale/Makefile        |   2 +
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 291 ++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
