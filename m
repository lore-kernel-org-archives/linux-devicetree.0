Return-Path: <SRS0=53jk=TH=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document
 uses_usb_x1
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-3-chris.brandt@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b3c3e21d-35aa-d222-e8d4-e5f63286044e@cogentembedded.com>
Date: Tue, 7 May 2019 11:37:53 +0300
MIME-Version: 1.0
In-Reply-To: <20190506234631.113226-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

On 07.05.2019 2:46, Chris Brandt wrote:

> Document the optional renesas,uses_usb_x1 property.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index d46188f450bf..26bf377102d3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -46,6 +46,8 @@ channel as USB OTG:
>   	       regulator will be managed during the PHY power on/off sequence.
>   - renesas,no-otg-pins: boolean, specify when a board does not provide proper
>   		       otg pins.
> +- renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are

    Hyphens are preferred to underscores in the DT property names.

> +                      used for the PLL source
>   
>   Example (R-Car H3):

MBR, Sergei
