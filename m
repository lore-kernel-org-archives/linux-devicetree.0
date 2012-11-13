From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC] MIPS: BCM63XX: register GPIO controller through Device
 Tree
Date: Mon, 12 Nov 2012 22:06:22 -0700
Message-ID: <50A1D54E.2090406@wwwdotorg.org>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com> <1352638249-29298-12-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352638249-29298-12-git-send-email-jonas.gorski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Maxime Bizon <mbizon@freebox.fr>, Florian Fainelli <florian@openwrt.org>, Kevin Cernekee <cernekee@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/11/2012 05:50 AM, Jonas Gorski wrote:
> Register the GPIO controller through Device Tree and add the
> appropriate values in the include files.
> 
> Since we can't register a platform driver at this early stage move the
> direct call to bcm63xx_gpio_init from prom_init to an arch initcall.

> diff --git a/Documentation/devicetree/bindings/gpio/bcm63xx-gpio.txt b/Documentation/devicetree/bindings/gpio/bcm63xx-gpio.txt

> +- #gpio-cells: Must be <2>. The first cell is the GPIO pin, and
> +  the second one the standard linux flags.

Also here, I think you want to explicitly document the flag values here
so the bindings don't rely on the Linux kernel code. I don't think
there's a standard central file which documents them though, although I
vaguely recall some discussion to create add them to gpio.txt?
