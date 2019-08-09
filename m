From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 19/21] ARM: dts: imx6/7-colibri: switch dr_mode to otg
Date: Fri, 9 Aug 2019 15:50:38 +0000
Message-ID: <6fdbd56b71c1192c67b2e28accd611ced92de555.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
 <20190807082556.5013-20-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190807082556.5013-20-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <D139DAE6FC76ED4083AA45298C565149@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Philippe

On Wed, 2019-08-07 at 08:26 +0000, Philippe Schenker wrote:
> In order for the otg ports, that these modules support, it is needed
> that dr_mode is on otg. Switch to use that feature.

Isn't further extcon integration required for this to truly work?

> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx6qdl-colibri.dtsi | 2 +-
>  arch/arm/boot/dts/imx7-colibri.dtsi    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> index 9a63debab0b5..6674198346d2 100644
> --- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
> @@ -388,7 +388,7 @@
>  &usbotg {
>  	pinctrl-names = "default";
>  	disable-over-current;
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
>  	status = "disabled";
>  };
>  
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> b/arch/arm/boot/dts/imx7-colibri.dtsi
> index 67f5e0c87fdc..42478f1aa146 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -320,7 +320,7 @@
>  };
>  
>  &usbotg1 {
> -	dr_mode = "host";
> +	dr_mode = "otg";
>  };
>  
>  &usdhc1 {

Cheers

Marcel
