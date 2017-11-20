From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: add pfc node for USB3.0
 channel 0
Date: Mon, 20 Nov 2017 11:08:53 +0300
Message-ID: <51d9e15a-31e4-2e6e-c0d6-9c38643b60e0@cogentembedded.com>
References: <1510146398-31805-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX+7cHF4ZWBkZ8jQzhuycKYGNdFuZK5Ge9e9coX9pUKcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX+7cHF4ZWBkZ8jQzhuycKYGNdFuZK5Ge9e9coX9pUKcQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for valuable review.

On 15.11.2017 19:49, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Wed, Nov 8, 2017 at 2:06 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> Adds the pfc node for USB3.0 channel 0.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> ---
>>   arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> index 48a2e8f..2ecb6ac 100644
>> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> @@ -173,6 +173,11 @@
>>                  groups = "usb0";
>>                  function = "usb0";
>>          };
>> +
>> +       usb30_pins: usb30 {
>> +               groups = "usb30";
>> +               function = "usb30";
> This enabled USB30_PWEN and USB30_OVC.
>
> However, these pins are routed via CN1A pins A97/A98 to HDMI_CS_A
> and HDMI_CS_B, not to a USB PHY?
>
> USB30_PWEN of the real USB PHY is provided by the i2c GPIO
> expander U11.
>
> I'm a bit puzzled by this... What am I missing?
This is my fault.
(Seems I've been looking for older KF schematic).

Please ignore this patch.

>
>> +       };
>>   };
>>
>>   &scif1 {
>> @@ -191,5 +196,8 @@
>>   };
>>
>>   &xhci0 {
>> +       pinctrl-0 = <&usb30_pins>;
>> +       pinctrl-names = "default";
>> +
>>          status = "okay";
>>   };
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


-- 
Regards,
Vladimir
