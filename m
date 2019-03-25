From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V9 1/4] dt-bindings: watchdog: add i.MX system controller
 watchdog
Date: Mon, 25 Mar 2019 15:37:27 -0500
Message-ID: <20190325203727.GA27661@bogus>
References: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
 <1553134884-1720-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553134884-1720-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, Andy Gross <andy.gross@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, bjorn.andersson@
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 02:26:38AM +0000, Anson Huang wrote:
> Add i.MX system controller watchdog binding doc.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V8:
> 	- add optional property "timeout-sec" according to driver change.
> ---
>  .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt

I still think what's in ATF should be discoverable, but:

Acked-by: Rob Herring <robh@kernel.org>
