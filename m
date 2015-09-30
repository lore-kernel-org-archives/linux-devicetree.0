From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7794: add USB PHY DT support
Date: Wed, 30 Sep 2015 14:11:56 +0300
Message-ID: <560BC37C.2040306@cogentembedded.com>
References: <1442100737.hcefR9HyDq@wasted.cogentembedded.com>
 <1590842.9hQm6l1zli@wasted.cogentembedded.com>
 <55F9F82E.4000809@cogentembedded.com> <20150930083324.GA3426@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150930083324.GA3426@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 9/30/2015 11:33 AM, Simon Horman wrote:

>>> Define the R8A7794 generic part of the USB PHY device node. It is up to the
>>> board file to enable the device.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>>   arch/arm/boot/dts/r8a7794.dtsi |   19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
>>> ===================================================================
>>> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
>>> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
>>> @@ -690,6 +690,25 @@
>>>   				 0x1000 0 0 2 &gic 0 113 IRQ_TYPE_LEVEL_HIGH>;
>>>   	};
>>>
>>> +	usbphy: usb-phy@e6590100 {
>>> +		compatible = "renesas,usb-phy-r8a7794";
>>> +		reg = <0 0xe6590100 0 0x100>;
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		clocks = <&mstp7_clks R8A7794_CLK_HSUSB>;
>>> +		clock-names = "usbhs";
>>
>>     Forgot to add "power-domains" prop here. :-(
>
> Are you planning to repost this?

    Yes.

MBR, Sergei

