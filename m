From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/5] GPIO driver for Maxim MAX3191x
Date: Fri, 13 Oct 2017 14:48:43 +0200
Message-ID: <CACRpkdbEeq3qeF41Mn1vE=DgdkrGJ1P91Yff4cAW98FhBJO-nw@mail.gmail.com>
References: <cover.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Rojhalat Ibrahim <imr@rtschenk.de>, Bart Van Assche <bart.vanassche@wdc.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Denys Vlasenko <dvlasenk@redhat.com>, linux-kernel@vger.kerne
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 12:40 PM, Lukas Wunner <lukas@wunner.de> wrote:

> - Patch [1/5]: Change the argument order of assign_bit() to reflect
>   traditional "dst = src" in C. (Peter Zijlstra)
>
> - Patch [2/5]: Update documentation. (Linus Walleij)
>   Drop const qualifier from struct gpio_desc ** in all function
>   signatures to avoid a cast when passing a non-const array created
>   with gpiod_get_array(), which is likely the most common use case.

Applied these two so we get the infrastructure in place so others
can use it too.

> - Patch [3/5]: Newly inserted patch to introduce common property for
>   number of daisy-chained devices.
>
> - Patch [4/5]: Add vendor prefix to GPIO identifiers, use boolean
>   instead of integer to select mode, rename boolean to ignore
>   undervoltage alarms, separate compatible strings with newlines.
>   (Rob Herring)
>
> - Patch [5/5]: Optimize algorithm in max3191x_get_multiple() to
>   iterate over the bits in the mask, instead of iterating over every
>   chip, thus implicitly skipping chips which are not selected at all
>   by the mask.

These are pending device tree maintainer review.

Yours,
Linus Walleij
