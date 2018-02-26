From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 1/9] mfd: madera: Add register definitions for Cirrus
 Logic Madera codecs
Date: Mon, 26 Feb 2018 15:46:50 +0200
Message-ID: <CAHp75VdTdtT8D0OmPo1DPZfjEogSJcBRJBuesHDPrB+bD9CVgA@mail.gmail.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com> <20180226130558.7634-2-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226130558.7634-2-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 3:05 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
> This patch adds a header file of register definitions for Cirrus
> Logic "Madera" class codecs. These codecs are all based off a common
> set of hardware IP so have a common register map (with a few minor
> device-to-device variations).
>
> The registers.h file is tool-generated directly from the hardware design
> but has been manually stripped down to reduce size (full register
> map is >44000 lines). All names are kept the same as datasheet names
> so that they can be cross-referenced between source and datasheet without
> confusion.
>
> The register map layout is kept fully-defined rather than factored into
> macros and/or block-indexing code. The major reasons for this are:
>
>  - #1 is that it makes the source highly greppable, which is important.
>    "What does the driver do with register bits XYZ" or "Where does it use
>    register bits XYZ" are commonly types of questions. These can be quickly
>    answered by a grep. Squashing definitions into generator macros or block-
>    indexing code is a way of defeating grep.
>
>  - most of the register definitions are used in tables, so a constant value
>    is required. Using generator macros make the table definition clunky and
>    obscure.
>
>  - the code is clearer when it's there in the source exactly what register
>    and field it is using
>
>  - it is easier to diff the register map of a new (unsupported) codec against
>    what is already supported and merge in differences
>
>  - it makes the register map available in source for maintenance/debugging
>    instead of having to refer back to the datasheet for a register map

...

> +#define MADERA_OTP_HPDET_GRADIENT_1X_MASK          0x0000FF00

> +#define MADERA_OTP_HPDET_GRADIENT_0X_MASK          0x000000FF

GENMASK() for all masks?

-- 
With Best Regards,
Andy Shevchenko
