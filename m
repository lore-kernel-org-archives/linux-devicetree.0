From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] i.MX6 OCOTP NVMEM support
Date: Mon, 24 Aug 2015 10:26:04 +0200
Message-ID: <1440404764.4444.2.camel@pengutronix.de>
References: <1438940901-5779-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438940901-5779-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

Am Freitag, den 07.08.2015, 11:48 +0200 schrieb Philipp Zabel:
> Hi,
> 
> These patches add support for the i.MX On-Chip OTP (eFuse) Controller found
> in i.MX6Q/D, i.MX6S/DL, i.MX6SL, and i.MX6SX SoCs to the NVMEM framework.
> Greg, could you take them into the char-misc tree together with the NVMEM
> framework?

is anything blocking this?

best regards
Philipp

> Changes since v1:
>  - Dropped unneeded clk.h include
>  - Fixed MODULE_LICENSE
>  - Droped third patch (adding the clock to the device tree node can be done separately)
> 
> Philipp Zabel (2):
>   nvmem: Add i.MX6 OCOTP device tree binding documentation
>   nvmem: imx-ocotp: Add i.MX6 OCOTP driver
> 
>  .../devicetree/bindings/nvmem/imx-ocotp.txt        |  20 +++
>  drivers/nvmem/Kconfig                              |  11 ++
>  drivers/nvmem/Makefile                             |   2 +
>  drivers/nvmem/imx-ocotp.c                          | 154 +++++++++++++++++++++
>  4 files changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
>  create mode 100644 drivers/nvmem/imx-ocotp.c


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
