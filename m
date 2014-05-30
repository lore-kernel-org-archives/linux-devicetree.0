From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] arm: shmobile: r8a7790: add USB3.0 node to r8a7790.dtsi
Date: Fri, 30 May 2014 17:08:22 +0400
Message-ID: <538882C6.3050202@cogentembedded.com>
References: <53871338.8050606@renesas.com> <53875B7E.5010104@cogentembedded.com> <5388760D.3020101@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <5388760D.3020101@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Simon Horman <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 05/30/2014 04:14 PM, Yoshihiro Shimoda wrote:

>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>> ---
>>>    arch/arm/boot/dts/r8a7790.dtsi |   10 ++++++++++
>>>    1 file changed, 10 insertions(+)

>>> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
>>> index e06c486..e6b04f2 100644
>>> --- a/arch/arm/boot/dts/r8a7790.dtsi
>>> +++ b/arch/arm/boot/dts/r8a7790.dtsi
>>> @@ -902,4 +902,14 @@
>>>    		#size-cells = <0>;
>>>    		status = "disabled";
>>>    	};
>>> +
>>> +	xhci: xhci@ee000000 {

>>      The node name should be "usb@ee000000", according to section 2.2.2 of the
>> ePAPR standard [1]:

> Thank you for the point! I will fix this and r8a7791's one.

>>> +		compatible = "renesas,xhci-r8a7790";
>>> +		reg = <0 0xee000000 0 0xc00>;
>>> +		interrupts = <0 101 IRQ_TYPE_LEVEL_HIGH>;
>>> +		clocks = <&mstp3_clks R8A7790_CLK_SSUSB>;
>>> +		phys = <&usbphy 1 1>;

>>      This part is dependent on the generic PHY support in the USB HCD in order
>> to work.

    Oops, I hadn't seen that you added generic PHY support to the xHCI driver 
when writing this. I'm however for adding the generic PHY support to the 
generic USB HCD code, so that we can use it for the PCI controllers.

> This means that I should wait to add this parameter until the generic USB PHY Gen2
> driver is supported in upstream?

    At least describe that dependency.

> Best regards,
> Yoshihiro Shimoda

WBR, Sergei

