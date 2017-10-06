From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 09/18] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
Date: Fri, 6 Oct 2017 05:38:49 +0300
Message-ID: <806c5e8e-af85-e73b-a7a4-44ebf82dee7e@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737377-23191-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX1FZ3_iKCMRkDozsn7QzEmmvuUzkjq5Hn9+L42F=X7sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX1FZ3_iKCMRkDozsn7QzEmmvuUzkjq5Hn9+L42F=X7sQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for the review.

On 20.09.2017 15:59, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Sep 7, 2017 at 12:36 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> This supports USB2 PHY channel #0 on ULCB Kingfisher board
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> index ca8de1a..0854600 100644
>> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> @@ -60,6 +60,11 @@
>>                  groups = "scif1_data_b";
>>                  function = "scif1";
>>          };
>> +
>> +       usb0_pins: usb0 {
>> +               groups = "usb0";
>> +               function = "usb0";
>> +       };
>>   };
>>
>>   &scif1 {
>> @@ -68,3 +73,10 @@
>>
>>          status = "okay";
>>   };
>> +
>> +&usb2_phy0 {
>> +       pinctrl-0 = <&usb0_pins>;
>> +       pinctrl-names = "default";
>> +
> Don't you need
>
>      vbus-supply = <&vbus0_usb2>;
>
> with vbus0_usb2 a fixed regulator controlled by GPIO P11 (OTG_EXTLPn) from
> GPIO expander U11 (TCA9539)?
> May be optional, though. salvator-common.dtsi has it.
Yes, I need this gpio.
I need both OTG_EXTLPn and OTG_OFFVBUSn from the same gpio expander.

I've been considering to use either vbus-supply + gpio hog or use gpio 
hog for both of them for consistency.
What do you think about this?

I plan to add these gpios control as a separate patch.

-- 
Regards,
Vladimir
