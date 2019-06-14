From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: Document short/long press
 duration for bd718x7
Date: Fri, 14 Jun 2019 10:42:23 -0600
Message-ID: <20190614164222.GA30277@bogus>
References: <cover.1558471150.git.leonard.crestez@nxp.com>
 <ec750ff0021c942b3c477e1cc7dc35f957600c96.1558471150.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ec750ff0021c942b3c477e1cc7dc35f957600c96.1558471150.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Angus Ainslie <angus@akkea.ca>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Robin Gong <yibin.gong@nxp.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2019 at 08:41:13PM +0000, Leonard Crestez wrote:
> These values can be overwritten at probe time.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> index d5f68ac78d15..3649c1191432 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> @@ -36,10 +36,18 @@ switched power state to SNVS. If reset is done via READY state the power
>  outputs will be returned to HW control by OTP loading. Thus the reset
>  target state is set to READY by default. If SNVS state is used the boot
>  crucial regulators must have the regulator-always-on and regulator-boot-on
>  properties set in regulator node.
>  
> +- rohm,short-press-ms	: Short press duration in milliseconds
> +- rohm,long-press-ms	: Long press duration in milliseconds
> +
> +Configure the "short press" and "long press" timers for the power button.
> +Values are rounded to what hardware supports (500ms multiple for short and
> +1000ms multiple for long). If these properties are not present the existing
> +configuration (from bootloader or OTP) is not touched.

We already have a standard property 'power-off-time-sec' for at least 
part of this assuming 'long' or 'short' causes a power off. 'long' and 
'short' don't describe anything useful. The action should be described.

Rob
