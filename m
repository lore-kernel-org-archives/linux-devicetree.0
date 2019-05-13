From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm2835: bcm7211: Add support for 7211
 pull-up functionality
Date: Mon, 13 May 2019 09:27:34 -0700
Message-ID: <2c5b0576-bdba-d746-4056-8520e194de86@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
 <20190509205955.27842-4-f.fainelli@gmail.com>
 <eb73a935-3638-e7b5-c85e-7857d61a7511@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eb73a935-3638-e7b5-c85e-7857d61a7511@i2se.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Al Cooper <alcooperx@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Doug Berger <opendmb@gmail.com>, Matheus Castello <matheus@castello.eng.br>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Lukas Wunner <lukas@wunner.de>, Nathan Chancellor <natechancellor@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, moderated list:BROADCOM BCM2835 ARM ARCHITECTURE
List-Id: devicetree@vger.kernel.org

On 5/13/19 1:14 AM, Stefan Wahren wrote:
> Hi Florian,
> 
> On 09.05.19 22:59, Florian Fainelli wrote:
>> From: Al Cooper <alcooperx@gmail.com>
>>
>> The 7211 has a new way of selecting the pull-up/pull-down setting
>> for a GPIO pin. The registers used for the bcm2837, GP_PUD and
>> GP_PUDCLKn0, are no longer connected. A new set of registers,
>> GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
>> a new compatible string "brcm,bcm7211-gpio" and the kernel
>> driver will use it to select which method is used to select
>> pull-up/pull-down.
>>
>> Signed-off-by: Al Cooper <alcooperx@gmail.com>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 85 +++++++++++++++++++++++++--
>>  1 file changed, 80 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> index 183d1ffe6a75..35d9f9593000 100644
>> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> @@ -57,15 +57,26 @@
>>  #define GPAFEN0		0x88	/* Pin Async Falling Edge Detect */
>>  #define GPPUD		0x94	/* Pin Pull-up/down Enable */
>>  #define GPPUDCLK0	0x98	/* Pin Pull-up/down Enable Clock */
>> +#define GP_GPIO_PUP_PDN_CNTRL_REG0 0xe4 /* 7211 Pin Pull-up/down select */
>>  
>>  #define FSEL_REG(p)		(GPFSEL0 + (((p) / 10) * 4))
>>  #define FSEL_SHIFT(p)		(((p) % 10) * 3)
>>  #define GPIO_REG_OFFSET(p)	((p) / 32)
>>  #define GPIO_REG_SHIFT(p)	((p) % 32)
>>  
>> +#define PUD_7211_MASK		0x3
>> +#define PUD_7211_REG_OFFSET(p)	((p) / 16)
>> +#define PUD_7211_REG_SHIFT(p)	(((p) % 16) * 2)
>> +
>>  /* argument: bcm2835_pinconf_pull */
>>  #define BCM2835_PINCONF_PARAM_PULL	(PIN_CONFIG_END + 1)
>>  
>> +enum bcm7211_pinconf_pull {
>> +	BCM7211_PINCONFIG_PULL_NONE,
>> +	BCM7211_PINCONFIG_PULL_UP,
>> +	BCM7211_PINCONFIG_PULL_DOWN,
>> +};
> 
> unfortunately this not usable for DTS files.
> 
> Please look at:
> include/dt-bindings/pinctrl/bcm2835.h

Good point, indeed, looks like I misported this from our downstream
kernel to upstream and the pins were already set correctly.

> 
> Btw the meaning between BCM2835 and BCM7211 of pull down and up is
> different :(
> 
That can be resolved entirely within the driver though, but yes, that's
unfortunate.
-- 
Florian
