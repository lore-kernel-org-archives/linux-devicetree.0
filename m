Return-Path: <SRS0=O9TV=HB=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <a9497120-154b-4f87-9742-d7fd4c38d86b@rock-chips.com>
References: <1523496031-145755-1-git-send-email-shawn.lin@rock-chips.com>
 <1523496031-145755-2-git-send-email-shawn.lin@rock-chips.com>
 <CAPDyKFoMT90sayR3i783Zybr-O5S9Q2Zp4+DYLNehSQQntdbgw@mail.gmail.com>
 <3600d23a-7a5b-cb31-2f6a-9f7239f26981@rock-chips.com> <CAPDyKFrWw-AhON1janB83JA13dxZQz6o6zMg3LBQK2Hv2+Cw_w@mail.gmail.com>
 <a9497120-154b-4f87-9742-d7fd4c38d86b@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Apr 2018 13:47:02 +0200
Message-ID: <CACRpkdakcGvFUt4bLTyr_xzVOfCqOXtxAvf_NVHfoCQW_qK9=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Add tunable delay before detecting card
 after card is inserted
Content-Type: text/plain; charset="UTF-8"
To: Shawn Lin <shawn.lin@rock-chips.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 12, 2018 at 10:14 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> On 2018/4/12 15:58, Ulf Hansson wrote:
>> On 12 April 2018 at 09:34, Shawn Lin <shawn.lin@rock-chips.com> wrote:

>> However if I understand correctly, you are suggesting to use a 200 ms
>> default debounce value - and in case that is succeeded to be set for
>> the GPIO, then we don't need the delay when scheduling the detect
>> work. No?
>>
>> On top of that, you want the debounce value to come from DT?
>
> In case the debounce is passed on from the caller, it means the caller
> drivers want it. So we firstly try it by using gpio debounce, but anyway we
> could fall back to use software debounce method, namely
> mmc_detect_change(host, msecs_to_jiffies(ctx->cd_delay_ms));
>
> ctx->cd_delay_ms =  max_t(unsigned int, debounce, 200) could make sure
> we at least have a basic 200ms delay which keeps consistent with current
> code. But a longer delay is better if the caller ask it via debounce
> argument.

The debounce time is dependent on use case so it makes sense
for this to come from the configuration for a certain system.
200ms makes a lot of sense though.

But there is a real problem with the bigger picture here.

Please consult:
drivers/input/keyboard/gpio_keys.c

As you can see, GPIO keys implements a timer-based
software delay. The good thing is that this is thoroughly tested
code so if you do this, look at how the input subsystem is
doing it. A key isn't very different from a MMC/SD card slot.

But the hippo in the living room is of course that this will
lead to code duplication. Reinventing the wheel.

What I would like to happen, is for software debouncing
to be moved into gpiolib and used as a fallback in the cases
where the hardware does not support debounce.

This way gpiod_set_debounce() will never fail with -ENOTSUPP
and we can remove the code from in the input subsystem
and reuse it freely for MMC/SD card detection. Probably also
in drivers/extcon etc.

To me this makes most sense.

I understand it might be a bit much to ask and I think I tried
to factor this over from input to GPIO at one point but
failed. Would you like to give it a try, or do you want me to
take a stab at it? (It might take some time...)

Yours,
Linus Walleij
