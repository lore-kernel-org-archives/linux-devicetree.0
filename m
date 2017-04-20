From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/3] ARM: dts: sk-rzg1m: add SCIF0 pins
Date: Thu, 20 Apr 2017 18:45:54 +0300
Message-ID: <45efbee2-eb71-a702-5c96-5312cbb4eaac@cogentembedded.com>
References: <20170414211509.818645915@cogentembedded.com>
 <CAMuHMdWCan+XRgbjdMXNqWuUoY_ZeWR1hiicgYg3s5gKQRchpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWCan+XRgbjdMXNqWuUoY_ZeWR1hiicgYg3s5gKQRchpQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/20/2017 05:19 PM, Geert Uytterhoeven wrote:

>> Add the (previously omitted) SCIF0 pin data to the SK-RZG1M board's
>> device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  arch/arm/boot/dts/r8a7743-sk-rzg1m.dts |   12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
>> +++ renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
[...]
>> @@ -39,7 +39,17 @@
>>         clock-frequency = <20000000>;
>>  };
>>
>> +&pfc {
>> +       scif0_pins: scif0 {
>> +               groups = "scif0_data";
>
> I don't have schematics for this board, but you told me it's very similar to
> Porter. Hence I'd expect "scif0_data_d" instead.

    And you are absolutely right! Sorry about my overlook...

> In my experience, when changing pinctrl to map the lines of a device to a new
> set of pins, but not mapping another device to the old set of pins, it may
> output the signals on both the old and the new set of pins.
>
> Does serial console input work with "scif0_data"?

    Sure. :-)

MBR, Sergei
