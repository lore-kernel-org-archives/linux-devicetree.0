From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 8/9] pinctrl: madera: Add driver for Cirrus Logic
 Madera codecs
Date: Wed, 21 Mar 2018 09:07:28 +0100
Message-ID: <CACRpkdaV=NK_wXyjHnwRZ44MN1dgdpu9vm-S4fa9swdi04iEvQ@mail.gmail.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com> <20180226130558.7634-9-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226130558.7634-9-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 2:05 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> These codecs have a variable number of I/O lines each of which
> is individually selectable to a wide range of possible functions.
>
> The functionality is slightly different from the traditional muxed
> GPIO since most of the functions can be mapped to any pin (and even
> the same function to multiple pins). Most pins have a dedicated
> "alternate" function that is only available on that pin. The
> alternate functions are usually a group of signals, though it is
> not always necessary to enable the full group, depending on the
> alternate function and how it is to be used. The mapping between
> alternate functions and GPIO pins varies between codecs depending
> on the number of alternate functions and available pins.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> There are some minor changes since LinusW last reviewed this patch but as
> they are trivial I have carried forward Linus's Reviewed-by:
> - SPDX license headers
> - can now build it as a module
> - avoided a minor checkpatch warning about an unnecessary else {} in
>     madera_get_group_name()

It's fine. Keep my Review tag.

Yours,
Linus Walleij
