From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Wed, 1 May 2019 15:10:10 -0500
Message-ID: <20190501201010.GA7249@bogus>
References: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 28, 2019 at 03:27:00AM +0000, Anson Huang wrote:
> i.MX system controller watchdog has pretimeout function which
> depends on i.MX SCU driver, so watchdog DT node needs to be
> subnode of SCU, this patch adds i.MX system controller watchdog
> binding to SCU binding doc.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 5d7dbab..1b56557 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -133,6 +133,16 @@ RTC bindings based on SCU Message Protocol
>  Required properties:
>  - compatible: should be "fsl,imx8qxp-sc-rtc";
>  
> +Watchdog bindings based on SCU Message Protocol
> +------------------------------------------------------------
> +
> +Required properties:
> +- compatible: should be:
> +              "fsl,imx8qxp-sc-wdt"
> +              followed by "fsl,imx-sc-wdt";
> +Optional properties:
> +- timeout-sec: contains the watchdog timeout in seconds.

This should be the time to reset the system, but the subject talks about 
the pre-timeout which I guess is just an interrupt. If it is pre-timeout 
you want add a new property and don't abuse the existing one.

Rob
