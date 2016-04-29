From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] pinctrl: iproc: Allow PINCONF to be disabled completely
Date: Fri, 29 Apr 2016 10:43:11 +0200
Message-ID: <CACRpkdZWxiUA4xr6MpaB4qRfYLcLsoqV3tEZ3dZiRNxOvxjKcw@mail.gmail.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
	<1460506523-6249-5-git-send-email-ray.jui@broadcom.com>
	<CACRpkdYmGUxQu5Sagw+J70wpFc+3Smg3V8mKxF2OFOhbMATYDw@mail.gmail.com>
	<3a66ff72-dac1-eaa9-2567-a20f24bba1cf@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <3a66ff72-dac1-eaa9-2567-a20f24bba1cf@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 18, 2016 at 9:30 PM, Ray Jui <ray.jui@broadcom.com> wrote:
> On 4/15/2016 1:24 AM, Linus Walleij wrote:
>>
>> On Wed, Apr 13, 2016 at 2:15 AM, Ray Jui <ray.jui@broadcom.com> wrote:
>>
>>> In some of the future iProc based SoCs, pinconf is handled by another
>>> block and the iProc GPIO controller is solely used as a GPIO controller.
>>> This patch adds support of a new compatible string
>>> "brcm,iproc-gpio-only",
>>> that is introduced to handle this case, where pinconf functions in this
>>> driver are completely disabled
>>>
>>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>>> Reviewed-by: Yendapally Reddy Dhananjaya Reddy
>>> <yendapally.reddy@broadcom.com>
>>> Reviewed-by: Jon Mason <jon.mason@broadcom.com>
>>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>>
>>
>> If this was entirely true, then the driver should end up only executing
>> [devm_]gpiochip_add_data() but that does not seem to be the case.
>
> Yes, in the case of compatible string "brcm,iproc-gpio-only" is detected,
> the driver only registers 'gpiochip_add_data'. Please check patch 2/4 of
> this series, which takes care of it.

OK.

>> You are still registering a pin controller, right? Just disabling some of
>> the pin config options. The pin multiplexing is still there, right?
>> Then it is not "solely a GPIO controller". Not at all.
>
> This driver does not register itself as a PINCONF driver if
> "brcm,iproc-gpio-only" compatible string is detected. This is addressed in
> patch 2/4 of this series.
>
> Pin based IOMUX GPIO override is only activated when
> 'chip->pinmux_is_supported' is true, and it is only true if the optional DT
> property "gpio-ranges" is defined.

OK.

> I believe the current issue with this patch series is now only on the naming
> of the new compatible string "brcm,iproc-gpio-only". Please correct me if
> I'm wrong.

Yeah I think I get it now. The patch set makes sense.
Looking forward to the next iteration!

Yours,
Linus Walleij
