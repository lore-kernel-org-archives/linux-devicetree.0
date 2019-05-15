Return-Path: <SRS0=J7OV=TP=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of
 usb_x1
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-5-chris.brandt@renesas.com>
 <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f4ceaadb-62e1-9880-e8e3-4f5bf54ce91e@cogentembedded.com>
Date: Wed, 15 May 2019 11:39:19 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello!

On 15.05.2019 10:35, Geert Uytterhoeven wrote:

>> Document the USB_X1 input and add clock-names to identify
>> functional and USB_X1 clocks.
>>
>> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>> @@ -28,7 +28,11 @@ Required properties:
>>                followed by the generic version.
>>
>>   - reg: offset and length of the partial USB 2.0 Host register block.
>> -- clocks: clock phandle and specifier pair(s).
>> +- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
>> +          dedicated USB_X1 input for the PLL, that is also listed.
>> +- clock-names: Name of the clocks. The functional clock shall be called "fclk"
> 
> Names?

    And I think the module clock name was "fck", not "fclk"...

[...]
> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
