From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSHYyXVsgMi8yXSBBUk06IGR0czogQWRkIHN1cHBvcnQgZm9y?=
 =?UTF-8?B?IHRoZSBjcHVpbXg1MyBib2FyZCBmcm9tIEV1a3JlYSBhbmQgaXRzIGJhc2Vi?=
 =?UTF-8?B?b2FyZC4=?=
Date: Fri, 06 Dec 2013 14:11:45 +0400
Message-ID: <1386324705.359638944@f208.i.mail.ru>
References: <1386323958-783-1-git-send-email-denis@eukrea.com>
 <1386323958-783-2-git-send-email-denis@eukrea.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386323958-783-2-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?RGVuaXMgQ2FyaWtsaQ==?= <denis@eukrea.com>
Cc: =?UTF-8?B?TWFyayBSdXRsYW5k?= <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?B?U2FzY2hhIEhhdWVy?= <kernel@pengutronix.de>, =?UTF-8?B?UGF3ZWwgTW9sbA==?= <pawel.moll@arm.com>, =?UTF-8?B?U3RlcGhlbiBXYXJyZW4=?= <swarren@wwwdotorg.org>, =?UTF-8?B?SWFuIENhbXBiZWxs?= <ijc+devicetree@hellion.org.uk>, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring@calxeda.com>, =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>, =?UTF-8?B?R3JhbnQgTGlrZWx5?= <grant.likely@linaro.org>, =?UTF-8?B?U2hhd24gR3Vv?= <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

> The following devices/functionalities were added:
>  * Main and secondary UARTs.
>  * i2c and the pcf8563 device.
>  * Ethernet.
>  * NAND.
>  * The BP1 button.
>  * The LED.
>  * Watchdog.
>  * SD.
>  * USB host.
...

> +		reg_3p3v: regulator@0 {
> +			reg = <0>;
> +			compatible = "regulator-fixed";
> +			regulator-name = "3P3V";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;

"regulator-always-on" make no sense for virtual supplies.

...
> +		pinctrl_uart1: uart1grp {
> +			fsl,pins = <MX53_UART1_PINGRP2>;
> +		};
> +
> +		pinctrl_uart2: uart2grp {
> +			fsl,pins = <MX53_UART2_PINGRP2>;
> +		};
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	fsl,uart-has-rtscts;

So if you use "fsl,uart-has-rtscts", should you add MX53_UART1_PINGRP3
into pinctls too?

---
