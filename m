From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCA2LzZdIEFSTTogZHRzOiBBZGQgZGV2aWNlIHRyZWUgc3Vw?=
 =?UTF-8?B?cG9ydCBmb3IgcGh5Y2FyZCBwY2ExMDA=?=
Date: Thu, 20 Jun 2013 19:21:10 +0400
Message-ID: <1371741670.186508416@f66.mail.ru>
References: <1371739815-6666-1-git-send-email-mpa@pengutronix.de>
 <1371739815-6666-7-git-send-email-mpa@pengutronix.de>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371739815-6666-7-git-send-email-mpa@pengutronix.de>
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
Cc: =?UTF-8?B?RmFiaW8gRXN0ZXZhbQ==?= <fabio.estevam@freescale.com>, =?UTF-8?B?U3RlZmZlbiBUcnVtdHJhcg==?= <s.trumtrar@pengutronix.de>, =?UTF-8?B?SmFuIEx1ZWJiZQ==?= <jlu@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, =?UTF-8?B?U2FzY2hhIEhhdWVy?= <kernel@pengutronix.de>, =?UTF-8?B?U2hhd24gR3Vv?= <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> Based on patches from:
> 
> Steffen Trumtrar <s.trumtrar@pengutronix.de>:
>  - Original patch
>  - ARM: dts: Set partition offsets for phycard
>  - ARM: dts: Use CSPI1 instead of CSPI2 on phycard pca100
>  - ARM: imx27-phytec-phycard-S.dts: resize nand partitions
> 
> Jan Luebbe <jlu@pengutronix.de>:
>  - ARM: dts: Enable bad block table in NAND
> 
> Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Cc: Jan Luebbe <jlu@pengutronix.de>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
...
> +			gpio@10015000 {
> +				status = "okay";
> +			};
> +
> +			gpio@10015100 {
> +				status = "okay";
> +			};
> +
> +			gpio@10015200 {
> +				status = "okay";
> +			};
> +
> +			gpio@10015300 {
> +				status = "okay";
> +			};
> +
> +			gpio@10015400 {
> +				status = "okay";
> +			};
> +
> +			gpio@10015500 {
> +				status = "okay";
> +			};

No need setup status for devices which not disabled in imx27.dts

---
