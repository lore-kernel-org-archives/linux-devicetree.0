From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RESEND PATCH v5 11/16] arm64: zynqmp: Add generic compatible
 string for I2C EEPROM
Date: Mon, 21 Aug 2017 13:27:53 +0200
Message-ID: <CABxcv=mOtPDU4RStdrF1EFci65N8sMB1MG4oKZiTXqUTe7GWHA@mail.gmail.com>
References: <20170615185418.13980-1-javier@dowhile0.org> <20170615185418.13980-12-javier@dowhile0.org>
 <e64ce8be-599a-5fc5-3194-92aac574173c@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e64ce8be-599a-5fc5-3194-92aac574173c@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[snip]

>>
>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>> index ef1b9e573af0..53907b7a7fd9 100644
>> --- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>> @@ -55,7 +55,7 @@
>>       status = "okay";
>>       clock-frequency = <400000>;
>>       eeprom@54 {
>> -             compatible = "at,24c64";
>> +             compatible = "atmel,24c64";
>>               reg = <0x54>;
>>       };
>>  };
>> @@ -64,7 +64,7 @@
>>       status = "okay";
>>       clock-frequency = <400000>;
>>       eeprom@55 {
>> -             compatible = "at,24c64";
>> +             compatible = "atmel,24c64";
>>               reg = <0x55>;
>>       };
>>  };
>>
>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
>

Any reasons why this patch was never picked? It was acked two months ago.

Best regards,
Javier
