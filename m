From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 1/2] ARM64: dts: Add support for Meson GXM
Date: Wed, 23 Nov 2016 07:58:23 -0800
Message-ID: <m2r362w5ls.fsf@baylibre.com>
References: <20161122100046.25899-1-narmstrong@baylibre.com>
        <20161122100046.25899-2-narmstrong@baylibre.com>
        <CAFBinCAbUK-6uLc_ceJ5d-oD4N_HGz9rbtCvivTp1N8OOVBNBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAbUK-6uLc_ceJ5d-oD4N_HGz9rbtCvivTp1N8OOVBNBg@mail.gmail.com>
        (Martin Blumenstingl's message of "Wed, 23 Nov 2016 13:23:24 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, carlo@caione.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Tue, Nov 22, 2016 at 11:00 AM, Neil Armstrong
> <narmstrong@baylibre.com> wrote:
>> Following the Amlogic Linux kernel, it seem the only differences
>> between the GXL and GXM SoCs are the CPU Clusters.
>>
>> This commit renames the gxl-s905d-p23x DTSI in a common file for
>> S905D p23x and S912 q20x boards.
>>
>> Then adds a meson-gxm dtsi and reproduce the P23x to Q20x boards
>> dts files since the S905D and S912 SoCs shares the same pinout
>> and the P23x and Q20x boards are identical.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> I have tested this successfully on a Mecool BB2 (similar to the Q200
> reference board).

Thanks for testing (and reporting),

Kevin
