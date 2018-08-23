From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] ARM: dts: imx6ull: correct machine model name
Date: Thu, 23 Aug 2018 08:52:58 +0200
Message-ID: <69b53468-ce73-9eeb-e11a-b6fa012a7ea6@i2se.com>
References: <1535005849-14046-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535005849-14046-1-git-send-email-Anson.Huang@nxp.com>
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
To: Anson Huang <Anson.Huang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Anson,


Am 23.08.2018 um 08:30 schrieb Anson Huang:
> i.MX6ULL is a lite version of i.MX6UL, its full name
> is i.MX6 UltraLiteLite, NOT UlltraLite.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx6ull-14x14-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/imx6ull-14x14-evk.dts b/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> index 30ef603..0ba6454 100644
> --- a/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> +++ b/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> @@ -45,7 +45,7 @@
>  #include "imx6ul-14x14-evk.dtsi"
>  
>  / {
> -	model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
> +	model = "Freescale i.MX6 UltraLiteLite 14x14 EVK Board";
>  	compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
>  };
>  

looks good, but this compatible should be documented in
Documentation/devicetree/bindings/arm/fsl.txt (should be a separate patch).

Regards
Stefan
