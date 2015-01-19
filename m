From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] input: goodix: Add bindings documentation
Date: Mon, 19 Jan 2015 13:13:03 +0100
Message-ID: <2837065.M1EAkbKi5o@wuerfel>
References: <1421505253-7474-1-git-send-email-mamlinav@gmail.com> <1421505410-9537-1-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1421505410-9537-1-git-send-email-mamlinav@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Aleksei Mamlin <mamlinav@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 17 January 2015 17:36:50 Aleksei Mamlin wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/gt9xx.txt
> @@ -0,0 +1,23 @@
> +Device tree bindings for Goodix GT9xx series touchscreen controller
> +
> +Required properties:
> +
> + - compatible          : Should be "goodix,gt9xx"
> + - reg                 : I2C address of the chip
> + - interrupt-parent    : Interrupt controller to which the chip is connected
> + - interrupts          : Interrupt to which the chip is connected
> +
> 

You should avoid the use of wildcards in compatible strings. Better list
all the known part numbers, or (if they are 100% compatible with one another)
pick the oldest one we support and use that as the compatible string.

	Arnd
