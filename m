From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v3 1/5] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Mon, 8 Dec 2014 11:45:18 -0800
Message-ID: <5485FFCE.9000009@broadcom.com>
References: <1418064468-8512-3-git-send-email-rjui@broadcom.com> <2129851.JzMQjVqeL2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2129851.JzMQjVqeL2@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/8/2014 11:38 AM, Arnd Bergmann wrote:
> On Monday 08 December 2014 10:47:44 Ray Jui wrote:
>> +
>> +- no-drv-stregnth:
>> +    Specifies the GPIO controller does not support drive strength configuration
>> +
>>
>
> Typo:
>
> 	strength, not stregnth
>
> Otherwise looks good.
>
> 	Arnd
>
Right...Let me fix that. Also noticed the following in the device tree 
binding example that needs to be fixed:
	gpio_crmu: gpio@03024800 {

		compatible = "brcm,cygnus-crmu-gpio";
The above line needs to be fixed with:
		compatible = "brcm,cygnus-gpio";

		reg = <0x03024800 0x50>;
		ngpios = <6>;
		#gpio-cells = <2>;
		gpio-controller;
		no-drv-stregnth;
	};
