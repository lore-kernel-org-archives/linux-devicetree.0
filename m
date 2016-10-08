From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: lpc18xx: add boot rom node
Date: Sat, 8 Oct 2016 12:28:55 +0200
Message-ID: <CAGhQ9Vy=M50Da9N9Yx5V6FLEzsiW1ECoYehjUPXStW_f-hOg5Q@mail.gmail.com>
References: <20160913195117.2887-1-manabian@gmail.com> <20160913195117.2887-4-manabian@gmail.com>
 <7d4f9e48-e93a-db9e-fba0-e1b64e7056d7@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7d4f9e48-e93a-db9e-fba0-e1b64e7056d7-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On 7 October 2016 at 03:50, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Joachim,
>
> On 13.09.2016 22:51, Joachim Eastwood wrote:
>> Add node for the boot ROM found on all NXP LPC18xx/43xx devices.
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/lpc18xx.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
>> index 631e6f6c..9f94f3e 100644
>> --- a/arch/arm/boot/dts/lpc18xx.dtsi
>> +++ b/arch/arm/boot/dts/lpc18xx.dtsi
>> @@ -81,6 +81,14 @@
>>                       status = "disabled";
>>               };
>>
>> +             boot_rom: firmware@10400000 {
>> +                     compatible = "nxp,lpc1850-boot-rom";
>> +                     reg = <0x10400000 0x10000>;
>> +                     syscon = <&creg>;
>> +                     nvmem-cells = <&part_id>;
>
> nitpicking, this change has a compile time dependency on yours
> "nvmem: add lpc18xx OTP memory driver" series, I haven't noticed
> this info stated, but it may be an overlook on my part.

It's not really a hard dependency and I will ensure that the DTS
changes comes in the correct order.


>> +                     nvmem-cell-names = "PartID";
>> +             };
>> +
>>               dmac: dma-controller@40002000 {
>>                       compatible = "arm,pl080", "arm,primecell";
>>                       arm,primecell-periphid = <0x00041080>;
>>
>
> Tested-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>

Thanks for testing and going through the changes.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
