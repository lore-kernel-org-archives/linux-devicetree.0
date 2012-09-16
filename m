From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 2/5] Documentation: add description of DT binding for
 the gpio-mvebu driver
Date: Sun, 16 Sep 2012 09:56:01 +0200
Message-ID: <20120916075601.GN28177@lunn.ch>
References: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1347551658-24449-3-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347551658-24449-3-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +++ b/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
> @@ -0,0 +1,45 @@
> +* Marvell EBU GPIO controller
> +
> +Required properties:
> +
> +- compatible : Should be "marvell,orion-gpio", "marvell,mv78200-gpio"
> +  or "marvell,armadaxp-gpio". "marvell,orion-gpio" should be used for
> +  Orion, Kirkwood, Dove, Discovery (except MV78200) and Armada
> +  370. "marvell,mv78200-gpio" should be used for the Discovery
> +  MV78200. "marvel,armadaxp-gpio" should be used for all Armada XP
> +  SoCs (MV78230, MV78260, MV78460).
> +
> +- reg: Address and length of the register set for the device. Only one
> +  entry is expected, except for the "marvell,armadaxp-gpio" variant
> +  for which two entries are expected: one for the general registers,
> +  one for the per-cpu registers.
> +
> +- interrupts: The list of interrupts that are used for all the pins
> +  managed by this GPIO bank. There can be more than one interrupt
> +  (example: 1 interrupt per 8 pins on Armada XP, which means 4
> +  interrupts per bank of 32 GPIOs).
> +
> +- interrupt-controller: identifies the node as an interrupt controller
> +
> +- #interrupt-cells: specifies the number of celles needed to encode an
> +   interrupt source

Hi Thomas

Should this be #gpio-cells? The example below does not have
#interrupt-cells?

	Andrew

> +
> +- gpio-controller: marks the device node as a gpio controller
> +
> +- ngpios: number of GPIOs this controller has
> +
> +- #gpio-cells: Should be two. The first is the pin number. The second
> +   is reserved for flags, unused at the moment.
> +
> +Example:
> +
> +		gpio0: gpio@d0018100 {
> +			compatible = "marvell,armadaxp-gpio";
> +			reg = <0xd0018100 0x40>,
> +			    <0xd0018800 0x30>;
> +			ngpios = <32>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <16>, <17>, <18>, <19>;
> +		};
> -- 
> 1.7.9.5
> 
