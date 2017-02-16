From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 00/10] ARM: davinci: add vpif display support
Date: Thu, 16 Feb 2017 18:48:57 +0100
Message-ID: <CAMpxmJW14cVtZfoo7dDXzEgNfKCm8TgqT619SrLW0zD1svEBcA@mail.gmail.com>
References: <1486485683-11427-1-git-send-email-bgolaszewski@baylibre.com> <058423ca-c53b-93a2-035e-54fe3ce6dcfe@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <058423ca-c53b-93a2-035e-54fe3ce6dcfe@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>, Patrick Titiano <ptitiano@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Alexandre Bailon <abailon@baylibre.com>, David Lechner <david@lechnology.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lad Prabhakar <prabhakar.csengg@gmail.com>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2017-02-13 10:22 GMT+01:00 Sekhar Nori <nsekhar@ti.com>:
> Hi Bartosz,
>
> On Tuesday 07 February 2017 10:11 PM, Bartosz Golaszewski wrote:
>> The following series adds support for v4l2 display on da850-evm with
>> a UI board in device tree boot mode.
>>
>> Patches 1/10 - 5/10 deal with the device tree: we fix whitespace
>> errors in dts files and bindings, extend the example and the dts for
>> da850-evm with the output port and address the pinmuxing.
>>
>> Patch 6/10 enables the relevant modules in the defconfig file.
>>
>> Patches 7/10 and 8/10 fix two already existing bugs encountered
>> during development.
>>
>> Patch 9/10 make it possible to use a different i2c adapter in the
>> vpif display driver.
>>
>> The last patch adds the pdata quirks necessary to enable v4l2 display.
>>
>> Tested with a modified version of yavta[1] as gstreamer support for
>> v4l2 seems to be broken and results in picture artifacts.
>>
>> [1] https://github.com/brgl/yavta davinci/vpif-display
>
> Can you also share the command line you used ?
>
> Thanks,
> Sekhar

Will do. I'll also send separate sets of patches for your different
branches as advised by Kevin.

Thanks,
Bartosz
