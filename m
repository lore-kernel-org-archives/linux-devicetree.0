From: David Bauer <mail@david-bauer.net>
Subject: Re: [PATCH] gpio: 74x164: add lines-initial-states property
Date: Mon, 20 Aug 2018 01:55:03 +0200
Message-ID: <1f8d8cd0-000a-ea46-2776-caee79ca6e01@david-bauer.net>
References: <20180815201855.29738-1-mail@david-bauer.net>
 <CACRpkdYTxvWjLizTr8Qg-FmSPjnnU+kj2+VrUUcz5F0nkhrUrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYTxvWjLizTr8Qg-FmSPjnnU+kj2+VrUUcz5F0nkhrUrg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 8/16/18 10:11 AM, Linus Walleij wrote:
> This sounds like something that should be generic, and not use
> a bitmask, but offsets. It should work even if the number of
> GPIOs from the chip is > 32.
> 
> Is the usecase different from hogs?
> See Documentation/devicetree/bindings/gpio.txt

Thanks for pointing that out. Indeed for my use-case (Asserting single
output to be high on driver probe) hogs are are sufficient solution.

Best wishes
David
