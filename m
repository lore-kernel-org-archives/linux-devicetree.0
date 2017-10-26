From: Matt Redfearn <matt.redfearn-8NJIiSa5LzA@public.gmane.org>
Subject: Re: [PATCH] MIPS: Boston: Fix earlycon baud rate selection
Date: Thu, 26 Oct 2017 13:07:07 +0100
Message-ID: <6247cb1a-f32b-cdd1-0f8d-de619a7b3cb8@mips.com>
References: <1508246879-20580-1-git-send-email-matt.redfearn@mips.com>
 <0F3A6103614E5547AAE5309112E22E9102C5C4FA@MIPSMAIL01.mipstec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0F3A6103614E5547AAE5309112E22E9102C5C4FA-8mq1oxvLakYkd5NFdqqD1Emw1/PebVxz@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <Paul.Burton-8NJIiSa5LzA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Paul,


On 25/10/17 23:09, Paul Burton wrote:
> Hi Matt,
>
> On Tuesday, October 17, 2017 at 6:28 AM Matt Redfearn wrote:
>> During set up of the early console, the earlycon driver will attempt to
>> configure a baud rate, if one is set in the earlycon structure.
>> Previously, of_setup_earlycon left this field as 0, ignoring any baud
>> rate selected by the DT. Commit 31cb9a8575ca ("earlycon: initialise baud
>> field of earlycon device structure") changed this behaviour such that
>> any selected baud rate is now set. The earlycon driver must deduce the
>> divisor from the configured uartclk, which of_setup_earlycon sets to
>> BASE_BAUD. MIPS generic kernels do not set BASE_BAUD (there is no
>> practical way to set this generically for all supported platforms), so
>> when the early console is configured an incorrect divisor is calculated
>> for the selected baud rate, and garbage is printed to the console during
>> boot.
>>
>> Fix this by removing the configured baud rate from the device tree.
>> This causes the early console to inherit the baud rate settings from the
>> bootloader. By the time the real console is probed, the clock drivers
>> necessary to calculate the divisor are enabled and the kernel can
>> correctly configure the baud rate.
> Sadly I think this breaks the proper console - my current understanding
> is that we end up with it set to 9600 baud due to the defaults in
> serial8250_console_setup(). So with your patch I see correct output from
> the early console, then nothing when the proper console registers until
> my userland starts a getty on ttyS0 which reconfigures it to 115200 baud.

As long as you specify "console=ttyS0,115200" on the command line, then 
the correct baud rate gets applied. I know that's not ideal...

(CC'ing Eugene & Greg KH for other ideas to fix this)

Thanks,
Matt

>
> Thanks,
>      Paul
>
>> Fixes: 31cb9a8575ca ("earlycon: initialise baud field of earlycon device
>> structure")
>> Signed-off-by: Matt Redfearn <matt.redfearn-8NJIiSa5LzA@public.gmane.org>
>>
>> ---
>>
>>   arch/mips/boot/dts/img/boston.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/boot/dts/img/boston.dts
>> b/arch/mips/boot/dts/img/boston.dts
>> index 53bfa29a7093..179691aae7d7 100644
>> --- a/arch/mips/boot/dts/img/boston.dts
>> +++ b/arch/mips/boot/dts/img/boston.dts
>> @@ -11,7 +11,7 @@
>>   	compatible = "img,boston";
>>
>>   	chosen {
>> -		stdout-path = "uart0:115200";
>> +		stdout-path = "uart0";
>>   	};
>>
>>   	aliases {
>> --
>> 2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
