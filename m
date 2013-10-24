From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCA2LzddIEFSTTogZHRzOiBpbXgyNyBwaHljb3JlIHBp?=
 =?UTF-8?B?bmN0cmw=?=
Date: Thu, 24 Oct 2013 12:30:24 +0400
Message-ID: <1382603424.519504719@f304.i.mail.ru>
References: <1382601233-24253-1-git-send-email-mpa@pengutronix.de>
 <1382601233-24253-7-git-send-email-mpa@pengutronix.de>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1382601233-24253-7-git-send-email-mpa@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, =?UTF-8?B?TGludXMgV2FsbGVpag==?= <linus.walleij@linaro.org>, =?UTF-8?B?U2hhd24gR3Vv?= <shawn.guo@linaro.org>, =?UTF-8?B?U2FzY2hhIEhhdWVy?= <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> Enable pinctrl for phycore devices.
> 
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
...
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
> index 4ec402c..3dbdb5e 100644
> --- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
> +++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
...
>  &uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1_1 &pinctrl_uart1_rtscts_1>;
>  	status = "okay";
>  };

No. Please put RTS & CTS pins into RDK. There are no hardware dependencies for SOM.

---
