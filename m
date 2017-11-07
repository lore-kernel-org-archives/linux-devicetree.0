From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: AXP803 I2C support / AXP devicetree-bindings
Date: Tue, 7 Nov 2017 23:32:23 +0100
Message-ID: <CAFBinCDVh2DpuQBx-x2OC_n9GJyYF8E84V1muYYvMJp2FYxjTQ@mail.gmail.com>
References: <CAFBinCAm8pA-dh3+T4Ui+DvLv5C17Zup-FN8pvi0cUa5PgwJJw@mail.gmail.com>
 <CAGb2v642n4puXqKOjG0QxhFgFFW2nJKrpU4KV2ZRPNb6_zF4pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v642n4puXqKOjG0QxhFgFFW2nJKrpU4KV2ZRPNb6_zF4pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi ChenYu,

On Tue, Nov 7, 2017 at 4:13 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Tue, Nov 7, 2017 at 6:39 AM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Hello,
>>
>> recently I discovered that there are some X-Powers AXP chips that
>> support both, Allwinner's own "RSB" as well as the I2C ("TWSI" in the
>> datasheet) busses.
>>
>> one chip that supports both interfaces is the AXP803
>> the datasheet is linked in the public PINE64 wiki: [1] (direct link: [0])
>
> All the RSB based PMICs support both modes. They start in I2C mode
> when cold booted.
I did not know that - thank you for that info!

>>
>> currently the "x-powers,axp803" binding is "RSB" bus specific as it's
>> currently only listed in drivers/mfd/axp20x-rsb.c
>>
>> was there a discussion about supporting both, the "RSB" and I2C bus
>> for one chip (for example the AXP803) in the past (I couldn't find
>> anything online)?
>
> No. None of the boards actually use I2C instead of RSB. RSB mode is
> initialized by the boot loader. There is no easy way for the kernel to
> switch it back.
I'm not trying to change this on an existing board

>> what about the device-tree bindings in this case?
>
> We can deal with it if someone actually comes up with a practical
> case needing it. Otherwise things go untested, which is not what
> we want.
OK, thank you for this information

if there is a valid use-case for this: would you like to see a RfC
patch-series (along with a description why it's needed) or discuss
this further before sending any patches?


Regards
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
