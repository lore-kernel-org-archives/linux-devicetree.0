From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator warning
Date: Fri, 11 Jan 2019 10:51:09 -0800
Message-ID: <7h1s5jowo2.fsf@baylibre.com>
References: <20190111092235.28161-1-linux.amoon@gmail.com> <772bd70c-2cd9-a1be-d18f-7824a9ea0556@baylibre.com> <CANAwSgTX4Rs7xXzjpNi-zizRyyO0FiFF0baOuQZ0fx9WEM9NCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgTX4Rs7xXzjpNi-zizRyyO0FiFF0baOuQZ0fx9WEM9NCA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Anand Moon <linux.amoon@gmail.com> writes:

> Hi Neil,
>
> On Fri, 11 Jan 2019 at 19:10, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Anand,
>>
>> On 11/01/2019 10:22, Anand Moon wrote:
>> > Add missing vin-supply 5V regulator node on usb_phy nodes needed
>> > to power usb bus ports. Override the dr_mode from "host" to "peripheral"
>> > for initialization of dwc2 usb0 phy node,changes fix the below
>> > warning for usb initialization.
>>
>> I would have switch the dr_mode to peripheral in another patch,
>> fix the regulator issue in this patch only.
>>
>> Neil
>>
> [snip]
>
> Ok will split this into two patches and send after next dts updates.
>

When you split, please be specific about which part fixes which
problem.  e.g. it appears the dr_mode fixes the WARNING from the
regulator core by itself, and the vin-supply fixes the usb resets,
correct?  It wasn't obvious upon reading the changelog.

In either case, feel free to add:

Tested-by: Kevin Hilman <khilman@baylibre.com>

I tested on meson-gxbb-odroidc2 and it looks good.

Thanks for fixing this,

Kevin
