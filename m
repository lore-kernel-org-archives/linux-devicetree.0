From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4] gpio: New driver for LSI ZEVIO SoCs
Date: Mon, 26 Aug 2013 10:58:36 -0600
Message-ID: <521B893C.4090109@wwwdotorg.org>
References: <1377460180-6192-1-git-send-email-fabian@ritter-vogt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377460180-6192-1-git-send-email-fabian@ritter-vogt.de>
Sender: linux-doc-owner@vger.kernel.org
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, grant.likely@linaro.org, pawel.moll@arm.com, rob.herring@calxeda.com, mark.rutland@arm.com, ian.campbell@citrix.com
List-Id: devicetree@vger.kernel.org

On 08/25/2013 01:49 PM, Fabian Vogt wrote:
> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
> It has been successfully tested on a TI nspire CX calculator.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt

> +Optional:
> +- #ngpios = <32>: Number of GPIOs. Defaults to 32 if absent

I think the GPIO count should be derived from the compatible value
instead. If it turns out there's a clear need for the property, it can
be added later in a backwards-compatible way.
