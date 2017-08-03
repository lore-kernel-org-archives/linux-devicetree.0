From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6ul-liteboard: Support poweroff
Date: Thu, 3 Aug 2017 10:12:09 +0800
Message-ID: <20170803021207.GH31819@dragon>
References: <20170801141456.10844-1-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170801141456.10844-1-m.niestroj@grinn-global.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 01, 2017 at 04:14:56PM +0200, Marcin Niestroj wrote:
> Support proper system power-off, which disables main regulator. This
> results in much lower power consumption and support of power-on issued
> by button press.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  arch/arm/boot/dts/imx6ul-liteboard.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-liteboard.dts b/arch/arm/boot/dts/imx6ul-liteboard.dts
> index ed1d891d6a89..c4fb5ea28e86 100644
> --- a/arch/arm/boot/dts/imx6ul-liteboard.dts
> +++ b/arch/arm/boot/dts/imx6ul-liteboard.dts
> @@ -145,3 +145,7 @@
>  	wakeup-source;
>  	status = "okay";
>  };
> +
> +&snvs_poweroff {
> +	status = "okay";
> +};

Please add the labelled node in alphabetical order.

Shawn

> -- 
> 2.13.3
> 
