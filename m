MIME-Version: 1.0
In-Reply-To: <54D24E2B.9070006@wwwdotorg.org>
References: <1422555050-28509-1-git-send-email-stefan.wahren@i2se.com>
	<CAL_JsqJubTomhUPbBck_cBJoiL2tuDRv++tANoLtBidmSdxUYQ@mail.gmail.com>
	<54D24E2B.9070006@wwwdotorg.org>
Date: Tue, 21 Apr 2015 18:20:21 -0500
Message-ID: <CAL_Jsq+xMqMCz1Hi0fAY2ygWbEB4cO4Q1qLTcMGSBj8rr4t8qw@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 0/4] ARM: bcm2835: DT improvements
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Feb 4, 2015 at 10:51 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 02/03/2015 07:47 PM, Rob Herring wrote:
>>
>> On Thu, Jan 29, 2015 at 12:10 PM, Stefan Wahren <stefan.wahren@i2se.com>
>> wrote:
>>>
>>> This patch series contains DT improvements for the Raspberry Pi.
>>>
>>> Patch 1,2: Add missing vendor prefix and root compatible properties
>>> Patch 3,4: Use constants for pin function instead of error-prone numbers
>>>
>>> Changes in V2:
>>> - add all currently known Raspberry Pi boards to binding documentation
>>>    as suggested by Stephen Warren
>>>
>>> Stefan Wahren (4):
>>>    dt-bindings: Add vendor prefix for Raspberry Pi
>>>    dt-bindings: Add root properties for Raspberry Pi
>>>    ARM: bcm2835: Add header file for pinctrl constants
>>>    ARM: bcm2835: Use pinctrl header
>>>
>>>   Documentation/devicetree/bindings/arm/bcm2835.txt  |   31
>>> ++++++++++++++++++--
>>>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>>>   arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |    4 +--
>>>   arch/arm/boot/dts/bcm2835-rpi-b.dts                |    4 +--
>>>   arch/arm/boot/dts/bcm2835-rpi.dtsi                 |    8 ++---
>>>   arch/arm/boot/dts/bcm2835.dtsi                     |    3 +-
>>>   include/dt-bindings/pinctrl/bcm2835.h              |   27
>>> +++++++++++++++++
>>>   7 files changed, 67 insertions(+), 11 deletions(-)
>>>   create mode 100644 include/dt-bindings/pinctrl/bcm2835.h
>>
>>
>> Who do you intend to apply this? For the DT binding parts:
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>
>
> I assume Lee Jones will take this through the Tegra tree, to avoid any
> potential conflicts with other changes to these files in that tree.
>
> I do still want to double-check with the Pi Foundation's downstream tree
> what compatible values they use. If they already have board-specific values,
> and they're sane, it'd be nice to align with those. Unfortunately, I haven't
> got around to that yet:-(
