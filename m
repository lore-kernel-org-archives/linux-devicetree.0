Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:41346 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752958Ab3G3QWg (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 12:22:36 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz10so6357520pad.16
        for <devicetree@vger.kernel.org>; Tue, 30 Jul 2013 09:22:36 -0700 (PDT)
Date: Tue, 30 Jul 2013 09:22:41 -0700
From: Olof Johansson <olof@lixom.net>
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
Message-ID: <20130730162241.GA13634@quad.lixom.net>
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 30, 2013 at 03:18:35PM +0400, Alexander Shiyan wrote:
> This patch adds DT support for generic (MMIO) GPIO driver.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/gpio/gpio-generic.txt      | 25 ++++++++++++++
>  drivers/gpio/gpio-generic.c                        | 40 +++++++++++++++-------
>  2 files changed, 53 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-generic.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
> new file mode 100644
> index 0000000..a9417ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
> @@ -0,0 +1,25 @@
> +Generic memory-mapped GPIO controller
> +
> +Required properties:
> +- compatible: Should be "basic-mmio-gpio" or "basic-mmio-gpio-be".
> +- reg: Physical base GPIO controller registers location and length.
> +- reg-names: Should be the names of reg resources. Each register uses
> +  its own reg name, so there should be as many reg names as referenced
> +  registers:
> +  "dat"		: Input/output register (Required),
> +  "set"		: Register for set output bits (Optional),
> +  "clr"		: Register for clear output bits (Optional),
> +  "dirout"	: Register for setup direction as output (Optional),
> +  "dirin"	: Register for setup direction as input (Optional).
> +- gpio-controller: Marks the device node as a gpio controller.
> +- #gpio-cells: Should be two.
> +
> +Example (Simple 8-bit memory cell):
> +
> +bgpio: gpio@20000000 {
> +	compatible = "basic-mmio-gpio";
> +	reg = <0x20000000 0x1>;
> +	reg-names = "dat";
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +};

I'm trying to figure out what to say about this binding. It's not really
describing hardware, instead it's strongly tied to how the basic-mmio-gpio
driver expects the platform data to look.

It makes more sense to actually describe the hardware in question,
and then have the driver handle that as expected. I.e. either have a
small conversion layer that binds to the actual hardware compatible
value and registers a basic-mmio-gpio device from there, or extend the
basic-mmio-gpio driver to do it by itself.


-Olof
