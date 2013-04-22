From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/23] ARM: u300: basic device tree support
Date: Mon, 22 Apr 2013 13:44:00 +0200
Message-ID: <201304221344.00422.arnd@arndb.de>
References: <1366624340-6293-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1366624340-6293-1-git-send-email-linus.walleij@stericsson.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 22 April 2013, Linus Walleij wrote:
> +/ {

We don't really care about the device node names in Linux, but please use the
common ones, without any trailing digits:

> +	timer: timer0@c0014000 {
> +		compatible = "stericsson,u300-apptimer";
> +		reg = <0xc0014000 0x1000>;
> +		interrupt-parent = <&vica>;
> +		interrupts = <24 25 26 27>;
> +	};

timer@c0014000

> +
> +	gpio: gpio0@c0016000 {
> +		compatible = "stericsson,gpio-coh901";
> +		reg = <0xc0016000 0x1000>;


gpio@c0016000

> +	pinctrl: pinctrl0@c0011000 {
> +		compatible = "stericsson,pinctrl-u300";
> +		reg = <0xc0011000 0x1000>;
> +	};

pinctrl@c0011000

> +		vica: intc@0xa0001000 {
> +			compatible = "arm,versatile-vic";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			reg = <0xa0001000 0x20>;
> +		};

interrupt-controller@a0001000

Note also the erroneous 0x part you have in the name here.

> +		uart0: uart@c0013000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0xc0013000 0x1000>;
> +			interrupt-parent = <&vica>;
> +			interrupts = <22>;
> +		};

serial@c0013000

	Arnd
