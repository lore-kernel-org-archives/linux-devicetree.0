From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAzLzVdIEFSTTogZHRzOiBpbXgyNzogQWRkIDEtd2ly?=
 =?UTF-8?B?ZQ==?=
Date: Sun, 23 Jun 2013 12:54:34 +0400
Message-ID: <1371977674.224117544@f196.mail.ru>
References: <1371977061-9891-1-git-send-email-mpa@pengutronix.de>
 <1371977061-9891-4-git-send-email-mpa@pengutronix.de>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371977061-9891-4-git-send-email-mpa@pengutronix.de>
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
...
> +			owire: owire@10009000 {
> +				compatible = "fsl,imx27-owire", "fsl,imx21-owire";
> +				reg = <0x10009000 0x1000>;
> +				clocks = <&clks 35>;
> +				clock-names = "ipg";

Clock name can be discarded here.

> +				status = "disabled";
> +			};
> +


---
