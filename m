From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: Re: [PATCH v7 2/2] bus: add driver for the Technologic Systems NBUS
Date: Thu, 2 Nov 2017 10:37:45 -0400
Message-ID: <b7a79314-66ff-6f09-6e53-aa548286b962@savoirfairelinux.com>
References: <20171101171433.14445-1-sebastien.bourdelin@savoirfairelinux.com>
 <20171101171433.14445-2-sebastien.bourdelin@savoirfairelinux.com>
 <CACRpkdY4Y9g2PAXbt11e3mSzJk2Bri4WNXm-5dQ2iyTegBNYVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY4Y9g2PAXbt11e3mSzJk2Bri4WNXm-5dQ2iyTegBNYVw@mail.gmail.com>
Content-Language: fr-classic
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@savoirfairelinux.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Featherston <mark@embeddedarm.com>, kris@embeddedarm.com
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 11/02/2017 10:22 AM, Linus Walleij wrote:
> On Wed, Nov 1, 2017 at 6:14 PM, Sebastien Bourdelin
> <sebastien.bourdelin@savoirfairelinux.com> wrote:
> 
>> This driver implements a GPIOs bit-banged bus, called the NBUS by
>> Technologic Systems. It is used to communicate with the peripherals in
>> the FPGA on the TS-4600 SoM.
>>
>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> This is still a very nice driver.

Thanks that's very kind and greatly appreciate.
> 
> If you are working on supplemental patches: from the next merge window
> we will have:
> 
> + int gpiod_get_array_value_cansleep(unsigned int array_size,
> +                                          struct gpio_desc **desc_array,
> +                                          int *value_array);
> 
> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=devel&id=eec1d566cdf94b57e8f5ba9fe60eea214929bcfc
> 
> If your GPIO controller also has .get_multiple() implemented it just
> becomes one register read if you're lucky.
> 
Ok, i guess i will not if this is fine like that, i'll see if someone
suggested some changes.

> BTW do you have a way upstream for this patch? ARM SoC?
Honestly i have no idea, do you have a recommandation for this kind of
bus driver? should i re-submit just this patch to a specific tree?

> 
> Yours,
> Linus Walleij
> 

Thanks again for your inputs.

Best regards,
Sebastien Bourdelin.
