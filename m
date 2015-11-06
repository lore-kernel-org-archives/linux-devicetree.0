From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 3/3] ARM: e3xx: Add header file for pinctrl constants
Date: Fri, 06 Nov 2015 09:54:46 +0100
Message-ID: <3715539.QztuvljIIp@wuerfel>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com> <1446766883-25703-4-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1446766883-25703-4-git-send-email-moritz.fischer@ettus.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 05 November 2015 15:41:23 Moritz Fischer wrote:
> +/* Pin names for the E31x usecase */
> +#define E31X_TX_BANDSEL_2      "DB_1"
> +#define E31X_RX1B_BANDSEL_0    "DB_3"
> +#define E31X_RX1B_BANDSEL_1    "DB_5"
> +#define E31X_VCTXRX2_V2                "DB_7"
> +#define E31X_TX_ENABLE1A       "DB_9"
> +#define E31X_TX_ENABLE2A       "DB_11"
> +#define E31X_TX_BANDSEL_0      "DB_12"

Why not put the strings directly into the .dts files and change the
lookup table in the driver accordingly:

+static const struct pinctrl_pin_desc e3xx_pins[] = {
+       /* pin0 doesn't exist */
+       PINCTRL_PIN(1, "TX_BANDSEL_2"),
+       PINCTRL_PIN(3, "RX1B_BANDSEL_0"),
+       PINCTRL_PIN(5, "RX1B_BANDSEL_1"),
+       PINCTRL_PIN(7, "VCTXRX2_V2"),

That would save you the hassle of the three-way dependency between the
dts file, the driver and the header when you want to change something
going through three different maintainer trees.

	arnd
