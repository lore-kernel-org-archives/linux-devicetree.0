From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: integrator: convert AMBA devices to device tree
Date: Thu, 16 Aug 2012 13:56:38 +0000
Message-ID: <201208161356.38997.arnd@arndb.de>
References: <1345119373-22774-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345119373-22774-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 16 August 2012, Linus Walleij wrote:
> +       fpga {
> +               compatible = "arm,amba-bus", "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               rtc: rtc@15000000 {
> +                       compatible = "arm,pl031", "arm,primecell";
> +                       reg = <0x15000000 0x1000>;
> +                       interrupt-parent = <&pic>;
> +                       interrupts = <8>;
> +                       arm,primecell-periphid = <0x00041030>;
> +               };
> +
> +               uart0: uart@16000000 {
> +                       compatible = "arm,pl011", "arm,primecell";
> +                       reg = <0x16000000 0x1000>;
> +                       interrupt-parent = <&pic>;
> +                       interrupts = <1>;
> +                       arm,primecell-periphid = <0x00041010>;
> +               };
> +
> +               uart1: uart@17000000 {
> +                       compatible = "arm,pl011", "arm,primecell";
> +                       reg = <0x17000000 0x1000>;
> +                       interrupt-parent = <&pic>;
> +                       interrupts = <2>;
> +                       arm,primecell-periphid = <0x00041010>;
> +               };

When all devices set the same interrupt-parent, you can just as well
move that property to the fpga node.

	Arnd
