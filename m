From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Sat, 24 Mar 2018 15:32:05 +0100
Message-ID: <CACRpkdY396hwrZtAqH=L8nvrr_f5An9zF+EFhO=4mz4XSc45=A@mail.gmail.com>
References: <20180312155201.30108-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312155201.30108-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 12, 2018 at 4:52 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Now GPIOD has support for both pdata systems and for non-standard DT
> bindings the Arizona reset GPIO can be converted to use it. Worth
> noting gpiod_set_raw_value_cansleep is used to match the behaviour
> of the old GPIOs. This is because the part is fairly widely used and
> it is unknown how many DTs are correctly setting active low through
> device tree, so to avoid breaking any existing users it is best to
> match the previous behaviour.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Changes since v4:
>  - Don't use a switch statement for handling return values
>  - Add some comments to the handling for the older binding
>  - Use gpiod_set_raw_value_cansleep to avoid potential breakage
>
> I have also removed Linus's reviewed-by was a bit border line but
> I felt there have probably been enough code changes since he gave
> it that it was probably safer to remove it.

It's fine.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

The use of gpiod_set_raw* should be done with caution, but this
is one of the cases where we need to take out the big hammer to
make sure things stay compatible.

I haven't read why it is like so but I guess because the right flags
in the device tree can not be guaranteed?

Yours,
Linus Walleij
