From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V3 RESEND 3/4] defconfig: arm64: enable i.MX8 SCU octop
 driver
Date: Thu, 23 May 2019 20:52:36 +0800
Message-ID: <20190523125235.GV9261@dragon>
References: <20190522020040.30283-1-peng.fan@nxp.com>
 <20190522020040.30283-3-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190522020040.30283-3-peng.fan@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Maxime Ripard <maxime.ripard@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, dl-linux-imx <linux-imx@nxp.com>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 01:47:05AM +0000, Peng Fan wrote:
> Build in CONFIG_NVMEM_IMX_OCOTP_SCU.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Please do not use base64 encoding for patch posting.

Shawn

> ---
> 
> V3:
>  No change
> V2:
>  rename patch title, add review tag
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 979a95c915b6..32b85102b857 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -748,6 +748,7 @@ CONFIG_HISI_PMU=y
>  CONFIG_QCOM_L2_PMU=y
>  CONFIG_QCOM_L3_PMU=y
>  CONFIG_NVMEM_IMX_OCOTP=y
> +CONFIG_NVMEM_IMX_OCOTP_SCU=y
>  CONFIG_QCOM_QFPROM=y
>  CONFIG_ROCKCHIP_EFUSE=y
>  CONFIG_UNIPHIER_EFUSE=y
> -- 
> 2.16.4
> 
