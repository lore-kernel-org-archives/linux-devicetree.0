From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 4/4] [media] dt-bindings: add TI VPIF documentation
Date: Mon, 21 Nov 2016 16:09:40 -0800
Message-ID: <m28tsc1ikb.fsf@baylibre.com>
References: <20161119003208.10550-1-khilman@baylibre.com>
        <20161119003208.10550-4-khilman@baylibre.com>
        <165090919.oFnaNnsijv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <165090919.oFnaNnsijv@wuerfel> (Arnd Bergmann's message of "Mon,
        21 Nov 2016 15:15:07 +0100")
Sender: linux-media-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Axel Haslam <ahaslam@baylibre.com>, Bartosz =?utf-8?Q?Go=C5=82aszewski?= <bgolaszewski@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, David Lechner <david@lechnology.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> On Friday, November 18, 2016 4:32:08 PM CET Kevin Hilman wrote:
>> +
>> +Required properties:
>> +- compatible: must be "ti,vpif-capture"
>> +- reg: physical base address and length of the registers set for the device;
>> +- interrupts: should contain IRQ line for the VPIF
>> +
>> 
>
> Shouldn't this have a SoC specific identifier or a version number
> in the compatible string? "vpif" seems rather generic, so it's
> likely that TI made more than one variant of it.

AFAICT, they used this for a single generation of davinci SoCs (dm6467,
da850) and then moved on to using something completely different.

But, that still proves your point because it's very SoC specific, so
I'll make the compatible specific.

Thanks for the review,

Kevin
