From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 1/4] dt-bindings: fsl: scu: add general interrupt
 support
Date: Wed, 20 Feb 2019 05:33:26 +0000
Message-ID: <AM6PR04MB42159D22AC552CB81AEEF6DE807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1550545569-7197-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550545569-7197-1-git-send-email-Anson.Huang@nxp.com>
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
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> From: Anson Huang
> Sent: Tuesday, February 19, 2019 11:11 AM
> Subject: [PATCH V3 1/4] dt-bindings: fsl: scu: add general interrupt support
> 
> Add scu general interrupt function support.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> No change since V2.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt      | 18
> ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index f388ec6..e5def3e 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -22,9 +22,11 @@ Required properties:
>  -------------------
>  - compatible:	should be "fsl,imx-scu".
>  - mbox-names:	should include "tx0", "tx1", "tx2", "tx3",
> -			       "rx0", "rx1", "rx2", "rx3".
> -- mboxes:	List of phandle of 4 MU channels for tx and 4 MU channels
> -		for rx. All 8 MU channels must be in the same MU instance.
> +			       "rx0", "rx1", "rx2", "rx3",
> +			       "gi3".

Should it be optional as SCU firmware does not require it for normal function?

And as MU also support sending interrupt via GIRn register,
How about using gip3 to distinguish sending general purpose interrupt?

Regards
Dong Aisheng
> +- mboxes:	List of phandle of 4 MU channels for tx, 4 MU channels for
> +		rx, and 1 MU channel for general interrupt. All 9 MU channels
> +		must be in the same MU instance.
>  		Cross instances are not allowed. The MU instance can only
>  		be one of LSIO MU0~M4 for imx8qxp and imx8qm. Users need
>  		to make sure use the one which is not conflict with other @@ -34,6
> +36,7 @@ Required properties:
>  		Channel 1 must be "tx1" or "rx1".
>  		Channel 2 must be "tx2" or "rx2".
>  		Channel 3 must be "tx3" or "rx3".
> +		General interrupt channel must be "gi3".

This can be:
		General interrupt Rx channel must be "gip3"

Regards
Dong Aisheng

>  		e.g.
>  		mboxes = <&lsio_mu1 0 0
>  			  &lsio_mu1 0 1
> @@ -42,7 +45,8 @@ Required properties:
>  			  &lsio_mu1 1 0
>  			  &lsio_mu1 1 1
>  			  &lsio_mu1 1 2
> -			  &lsio_mu1 1 3>;
> +			  &lsio_mu1 1 3
> +			  &lsio_mu1 3 3>;
>  		See Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>  		for detailed mailbox binding.
> 
> @@ -153,7 +157,8 @@ firmware {
>  	scu {
>  		compatible = "fsl,imx-scu";
>  		mbox-names = "tx0", "tx1", "tx2", "tx3",
> -			     "rx0", "rx1", "rx2", "rx3";
> +			     "rx0", "rx1", "rx2", "rx3",
> +			     "gi3";
>  		mboxes = <&lsio_mu1 0 0
>  			  &lsio_mu1 0 1
>  			  &lsio_mu1 0 2
> @@ -161,7 +166,8 @@ firmware {
>  			  &lsio_mu1 1 0
>  			  &lsio_mu1 1 1
>  			  &lsio_mu1 1 2
> -			  &lsio_mu1 1 3>;
> +			  &lsio_mu1 1 3
> +			  &lsio_mu1 3 3>;
> 
>  		clk: clk {
>  			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> --
> 2.7.4
