From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAyLzVdIEFSTTogZHRzOiBpbXgyNzogQWRkIGlteCBm?=
 =?UTF-8?B?cmFtZWJ1ZmZlciBkZXZpY2U=?=
Date: Fri, 28 Jun 2013 19:10:06 +0400
Message-ID: <1372432206.785926201@f326.mail.ru>
References: <1372431037-13519-1-git-send-email-mpa@pengutronix.de>
 <1372431037-13519-3-git-send-email-mpa@pengutronix.de>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1372431037-13519-3-git-send-email-mpa@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?TWFya3VzIFBhcmdtYW5u?= <mpa@pengutronix.de>
Cc: =?UTF-8?B?RmFiaW8gRXN0ZXZhbQ==?= <fabio.estevam@freescale.com>, devicetree-discuss@lists.ozlabs.org, =?UTF-8?B?U2hhd24gR3Vv?= <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?U2FzY2hhIEhhdWVy?= <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx27.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
> index 8603886..10dcbd3 100644
> --- a/arch/arm/boot/dts/imx27.dtsi
> +++ b/arch/arm/boot/dts/imx27.dtsi
> @@ -342,6 +342,15 @@
>  			reg = <0x10020000 0x20000>;
>  			ranges;
>  
> +			imxfb: fb@10021000 {

If it can be fixed while applying, it would be right to use just "fb" here.
We now use a lot of devices without "imx"-prefix, so I do not see any need to use it here.

> +				compatible = "fsl,imx27-fb", "fsl,imx21-fb";
> +				interrupts = <61>;
> +				reg = <0x10021000 0x1000>;
> +				clocks = <&clks 36>, <&clks 65>, <&clks 59>;
> +				clock-names = "ipg", "ahb", "per";
> +				status = "disabled";
> +			};
> +

---
