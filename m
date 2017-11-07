From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: AXP803 I2C support / AXP devicetree-bindings
Date: Tue, 7 Nov 2017 11:13:23 +0800
Message-ID: <CAGb2v642n4puXqKOjG0QxhFgFFW2nJKrpU4KV2ZRPNb6_zF4pw@mail.gmail.com>
References: <CAFBinCAm8pA-dh3+T4Ui+DvLv5C17Zup-FN8pvi0cUa5PgwJJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCAm8pA-dh3+T4Ui+DvLv5C17Zup-FN8pvi0cUa5PgwJJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 7, 2017 at 6:39 AM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hello,
>
> recently I discovered that there are some X-Powers AXP chips that
> support both, Allwinner's own "RSB" as well as the I2C ("TWSI" in the
> datasheet) busses.
>
> one chip that supports both interfaces is the AXP803
> the datasheet is linked in the public PINE64 wiki: [1] (direct link: [0])

All the RSB based PMICs support both modes. They start in I2C mode
when cold booted.

>
> currently the "x-powers,axp803" binding is "RSB" bus specific as it's
> currently only listed in drivers/mfd/axp20x-rsb.c
>
> was there a discussion about supporting both, the "RSB" and I2C bus
> for one chip (for example the AXP803) in the past (I couldn't find
> anything online)?

No. None of the boards actually use I2C instead of RSB. RSB mode is
initialized by the boot loader. There is no easy way for the kernel to
switch it back.

> what about the device-tree bindings in this case?

We can deal with it if someone actually comes up with a practical
case needing it. Otherwise things go untested, which is not what
we want.

ChenYu

>
>
> Regards
> Martin
>
>
> [0] http://files.pine64.org/doc/datasheet/pine64/AXP803_Datasheet_V1.0.pdf
> [1] http://wiki.pine64.org/index.php/PINE_A64_Main_Page#Datasheets_for_Components_and_Peripherals
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
