From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] ARM: shmobile: silk: add QSPI DT support
Date: Mon, 10 Aug 2015 21:18:24 +0300
Message-ID: <55C8EAF0.7060600@cogentembedded.com>
References: <1898263.zrOs5SAUTS@wasted.cogentembedded.com>
 <1768974.jEFIAaInqd@wasted.cogentembedded.com>
 <CAMuHMdXQJ4Hju477Ys0ujXCNdUjWOa6AuKGzLPc3YFJc_eLz+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXQJ4Hju477Ys0ujXCNdUjWOa6AuKGzLPc3YFJc_eLz+g@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 08/10/2015 05:38 PM, Geert Uytterhoeven wrote:

>> Define the SILK board dependent part of the QSPI device node.
>> Add device nodes  for Spansion  S25FL512S SPI flash and MTD partitions on it.

>> Based on the original patch by Vladimir Barinov
>> <vladimir.barinov@cogentembedded.com>.

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>> --- renesas.orig/arch/arm/boot/dts/r8a7794-silk.dts
>> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
>
>> +&qspi {
>> +       pinctrl-0 = <&qspi_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       status = "okay";
>> +
>> +       flash@0 {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               compatible = "spansion,s25fl512s";

> Please add the "jedec,spi-nor" fallback.

    Hm, spi-nor.c alone can't control this device, it's rather m25p80.c that's 
the real driver. So if a fallback needs to be added indeed it should be 
"st,m25p80" I think...

[...]

> Gr{oetje,eeting}s,

MBR, Sergei

