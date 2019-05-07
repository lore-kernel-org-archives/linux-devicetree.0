Return-Path: <SRS0=53jk=TH=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 09/10] ARM: dts: r7s9210: Add USB Device support
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-10-chris.brandt@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8182b7b7-c447-b0ba-2654-ac71f9c86dbb@cogentembedded.com>
Date: Tue, 7 May 2019 11:44:18 +0300
MIME-Version: 1.0
In-Reply-To: <20190506234631.113226-10-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07.05.2019 2:46, Chris Brandt wrote:

> Add USB Device support for RZ/A2.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
> index 1a992e6197c3..67ac746142d0 100644
> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -354,6 +354,18 @@
>   			status = "disabled";
>   		};
>   
> +		usbhs0: usbhs@e8219000 {

   The node names should be generic, i.e. "usb@e8219000".

[...]
> @@ -386,6 +398,18 @@
>   			status = "disabled";
>   		};
>   
> +		usbhs1: usbhs@e821b000 {

    Same here.

[...]

MBR, Sergei
