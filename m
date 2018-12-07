Return-Path: <SRS0=CYZL=OQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46839 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbeLGJnx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Dec 2018 04:43:53 -0500
Received: by mail-lj1-f193.google.com with SMTP id v15-v6so2946580ljh.13
        for <devicetree@vger.kernel.org>; Fri, 07 Dec 2018 01:43:50 -0800 (PST)
MIME-Version: 1.0
References: <87r2f83uww.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87r2f83uww.fsf@soft-dev15.microsemi.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Dec 2018 10:43:38 +0100
Message-ID: <CACRpkdZ47tELuJR3DG-d8tsvz4ez_j6TxCYiiGT3L01CJ1LSTA@mail.gmail.com>
Subject: Re: [PATCH] mips: gpio: mscc_sgpio: Add DT bindings documentation
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: lars.povlsen@microchip.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Gregory Clement <gregory.clement@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Hi Lars,

thanks for your patch!

On Mon, Nov 26, 2018 at 1:22 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> +MSCC Serial GPIO driver

Expand the acronym please, if IIUC this is
"Microsemi Corporation (MSCC) Serial GPIO driver"

> +- mscc,sgpio-frequency: The frequency at which the serial bitstream is
> +  generated and sampled. Default: 12500000 (Hz).

Uhm what is a serial bitstream in this context, I am lost.
Please elaborate.

> +- mscc,sgpio-bitcount: The number of bits enabled per
> +  port. (1-4). Default: 2.

Can't you just use the standard "ngpios" property for this?
See
Documentation/devicetree/bindings/gpio/gpio.txt

Why is this a global setting for all ports and not per-port?

> +- mscc,sgpio-ports: A bitmask (32 bits) of which ports are enabled in
> +  the serialized gpio stream. Default: 0xFFFFFFFF.

I don't understand this either. Are there up to 32 ports?
(Also referred to as "banks") with 1-4 GPIOs each?

Yours,
Linus Walleij
