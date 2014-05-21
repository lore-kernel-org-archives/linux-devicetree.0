From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch v4 4/5] ARM: dts: keystone: update reset node to work with reset driver
Date: Wed, 21 May 2014 16:50:55 +0200
Message-ID: <15259908.YoiO6LMEzV@wuerfel>
References: <1400682454-24535-1-git-send-email-ivan.khoronzhuk@ti.com> <1400682454-24535-5-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400682454-24535-5-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, rdunlap@infradead.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m-karicheri2@ti.com
List-Id: devicetree@vger.kernel.org

On Wednesday 21 May 2014 17:27:33 Ivan Khoronzhuk wrote:
> The keystone driver requires the next additional properties:
> 
> "ti,syscon-pll" - syscon register range used to access pll controller
>                   registers in order to use reset control registers.
> "ti,syscon-dev" - syscon register range used to access device state
>                   control registers in order to use mux block
>                   registers for all watchdogs.
> 
> "ti,wdt_list"   - option to declare what watchdog are used to reboot
>                   the SoC, so set "0" WDT as default.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>

Same comment as what I had for the binding: it's not a register range
any more, but a phandle for a device.

> ---
>  arch/arm/boot/dts/keystone.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
> index 8b899ba..783da60 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -78,7 +78,9 @@
>  
>                 rstctrl: reset-controller {
>                         compatible = "ti,keystone-reset";
> -                       reg = <0x023100e8 4>;   /* pll reset control reg */
> +                       ti,syscon-pll = <&pllctrl>;
> +                       ti,syscon-dev = <&devctrl>;
> +                       ti,wdt_list = <0>;
>                 };
>  

I don't see a definition for the two labels, so this will cause a
build error. It makes sense to add them in the same patch.

	Arnd
