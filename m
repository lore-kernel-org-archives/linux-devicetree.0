From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/4] arm: defconfig: imx6: Added CONFIG_FHANDLE
Date: Mon, 13 Mar 2017 16:41:31 +0800
Message-ID: <20170313084129.GA3618@dragon>
References: <20170219202801.2082-1-plaes@plaes.org>
 <20170219202801.2082-2-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170219202801.2082-2-plaes@plaes.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Priit Laes <plaes@plaes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 19, 2017 at 10:27:58PM +0200, Priit Laes wrote:
> CONFIG_FHANDLE is a must-have for newer distributions with systemd
> support (including Debian stable).
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>

'ARM: imx_v6_v7_defconfig: ...' for subject prefix.

Shawn

> ---
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index cbe7faf..701db9a 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -1,5 +1,6 @@
>  CONFIG_KERNEL_LZO=y
>  CONFIG_SYSVIPC=y
> +CONFIG_FHANDLE=y
>  CONFIG_NO_HZ=y
>  CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_IKCONFIG=y
> -- 
> 2.9.3
> 
