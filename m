From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: dts: porter: add MAX3355 support
Date: Fri, 29 Jan 2016 23:49:42 +0300
Message-ID: <56ABD066.7020804@cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
 <4506196.xOgpYRO52t@wasted.cogentembedded.com>
 <SG2PR06MB0919D09C1146EAC0681EE109D8DA0@SG2PR06MB0919.apcprd06.prod.outlook.com>
 <56ABCB69.1070800@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <56ABCB69.1070800@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "horms@verge.net.au" <horms@verge.net.au>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/29/2016 11:28 PM, Sergei Shtylyov wrote:

>>> From: linux-renesas-soc-owner@vger.kernel.org
>>> [mailto:linux-renesas-soc-owner@vger.kernel.org] On Behalf Of Sergei
>>> Shtylyov
>>> Sent: Wednesday, January 27, 2016 7:14 AM
>>>
>>> Now that Maxim Integrated MAX3355 'extcon' driver and device tree bindings
>>> are upstream along with the 'extcon' hook  in the Renesas USBHS driver, we
>>> can add  MAX3355 device node to  the Porter device tree and properly refer
>>> to it from the USBHS node instead of using  "renesas,enable-gpio" property
>>> which only allowed checking the USB ID pin  at the driver probe time;  now
>>> this  pin's  state can be monitored dynamically!
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> I tested this patch on Porter, but interrupt of "usb-otg" didn't happened
>> even if I connected/disconnected a usb convert cable (usb micro-ab to A).
>> Remarks: I confirmed that the usb convert cable worked correctly on other
>> board.
>
>     I guess I have the same cable

    No, I have mini-AB connector here and hence my cable is mini-AB to A.

> and IRQs do happen for me when I connect and
> disconnect it (as it should be).

>> Best regards,
>> Yoshihiro Shimoda

MBR, Sergei
