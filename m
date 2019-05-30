From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add YADRO VESNIN BMC
Date: Thu, 30 May 2019 14:16:59 +0000
Message-ID: <CACPK8XfG7j4Z2bqX9CFxUeUrpx708Uqbh-5ts9W5SnDfDw-xYA@mail.gmail.com>
References: <20190530093948.12479-1-a.filippov@yadro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530093948.12479-1-a.filippov@yadro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Filippov <a.filippov@yadro.com>
Cc: linux-aspeed@lists.ozlabs.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 30 May 2019 at 09:40, Alexander Filippov <a.filippov@yadro.com> wrote:
> @@ -0,0 +1,262 @@

Can we get a SDPX license string at the top of the file? Something like this:

// SPDX-License-Identifier: GPL-2.0+
// Copyright 2019 <copyright holder>

> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +

> +&i2c3 {
> +       status = "okay";
> +       cpr2021@59 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "general,cpr2021", "general,pmbus";

Do you have a driver for this one you plan on submitting?
