From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 0/7] ARM: dts: Add Advantech board support
Date: Mon, 21 Dec 2015 17:53:18 -0500
Message-ID: <CACrMeVC1ZrG2fd_z5KW3y=jgu7NHqnj44+kN+=iJ1z0BJ+vffQ@mail.gmail.com>
References: <1449177036-13317-1-git-send-email-akshay.bhat@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449177036-13317-1-git-send-email-akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Justin Waters <justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lucas, Shawn,

Any further review comments on the patches. If not can this be applied?

Thanks,
Akshay

On Thu, Dec 3, 2015 at 4:10 PM, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org> wrote:
> This series aims to add Advantech BA-16 module (iMX6 based) and GE board support.
>
> This series has been tested against linux-next tag next-20151202.
>
> Modifications:
> v4->v5:
> - BA16: Move SPI FLASH partitions to a "partitions" subnode
> - B450v3, B650v3 and B850v3: Fix model names
>
> History:
> --------
> [v1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/381872.html
> [v2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/383276.html
> [v3]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/384202.html
> [v4]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/390373.html
>
> Akshay Bhat (5):
>   of: Add vendor prefix for Advantech Corporation
>   of: Add vendor prefix for General Electric Company
>   ARM: dts: imx: Add support for Advantech/GE B450v3
>   ARM: dts: imx: Add support for Advantech/GE B650v3
>   ARM: dts: imx: Add support for Advantech/GE B850v3
>
> Justin Waters (2):
>   ARM: dts: imx: Add Advantech BA-16 Qseven module
>   ARM: dts: imx: Add support for Advantech/GE Bx50v3
>
>  .../devicetree/bindings/vendor-prefixes.txt        |   2 +
>  arch/arm/boot/dts/Makefile                         |   3 +
>  arch/arm/boot/dts/imx6q-b450v3.dts                 |  84 +++
>  arch/arm/boot/dts/imx6q-b650v3.dts                 |  84 +++
>  arch/arm/boot/dts/imx6q-b850v3.dts                 | 127 +++++
>  arch/arm/boot/dts/imx6q-ba16.dtsi                  | 589 +++++++++++++++++++++
>  arch/arm/boot/dts/imx6q-bx50v3.dtsi                | 207 ++++++++
>  7 files changed, 1096 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6q-b450v3.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-b650v3.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-b850v3.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-ba16.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6q-bx50v3.dtsi
>
> --
> 2.6.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
