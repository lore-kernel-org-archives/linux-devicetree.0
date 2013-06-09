From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: nomadik: add the new clocks to the device tree
Date: Sun, 9 Jun 2013 16:21:02 +0200
Message-ID: <201306091621.02506.arnd@arndb.de>
References: <1370775348-7440-1-git-send-email-linus.walleij@linaro.org>
 <1370775348-7440-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370775348-7440-2-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 09 June 2013, Linus Walleij wrote:
> +               /*
> +                * IP AMBA bus clocks, driving the bus side of the
> +                * peripheral clocking, clock gates.
> +                */
> +
> +               hclkdma0: hclkdma0@48M {
> +                       #clock-cells = <0>;
> +                       compatible = "st,nomadik-src-clock";
> +                       clock-id = <0>;
> +                       clocks = <&hclk>;
> +               };
> +               hclksmc: hclksmc@48M {
> +                       #clock-cells = <0>;
> +                       compatible = "st,nomadik-src-clock";
> +                       clock-id = <1>;
> +                       clocks = <&hclk>;
> +               };
> +               hclksdram: hclksdram@48M {
> +                       #clock-cells = <0>;
> +                       compatible = "st,nomadik-src-clock";
> +                       clock-id = <2>;
> +                       clocks = <&hclk>;
> +               };
> +               hclkdma1: hclkdma1@48M {
> +                       #clock-cells = <0>;
> +                       compatible = "st,nomadik-src-clock";
> +                       clock-id = <3>;
> +                       clocks = <&hclk>;
> +               };

Sorry if I'm being slow to understand how the clock bindings work, but if
you have 63 identical clocks that only differ in ther clock-id, can't you
just have a single DT node for them instead with #clock-cells=1 to pass the
number from the device using it?

	Arnd
