From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V5] gpio: New driver for LSI ZEVIO SoCs
Date: Tue, 27 Aug 2013 14:09:39 -0600
Message-ID: <521D0783.9000804@wwwdotorg.org>
References: <1377541133-7427-1-git-send-email-fabian@ritter-vogt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377541133-7427-1-git-send-email-fabian@ritter-vogt.de>
Sender: linux-doc-owner@vger.kernel.org
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, grant.likely@linaro.org, pawel.moll@arm.com, rob.herring@calxeda.com, mark.rutland@arm.com, ian.campbell@citrix.com
List-Id: devicetree@vger.kernel.org

On 08/26/2013 12:18 PM, Fabian Vogt wrote:
> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
> It has been successfully tested on a TI nspire CX calculator.

What changed in v5 (or indeed any other versions?)

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt

> +Zevio GPIO controller
> +
> +Required properties:
> +- compatible = "lsi,zevio-gpio"
> +- reg = <BASEADDR SIZE>

Perhaps this should say:

reg: Contains a single register specifier for the GPIO module's registers.

> +- #gpio-cells = <2>

This should describe what those cells are. For example perhaps:

#gpio-cells. Must be 2. The first cell is the GPIO number. The second
  cell is used to specify optional parameters:
  - bit 0 specifies polarity (0 for normal, 1 for inverted)
