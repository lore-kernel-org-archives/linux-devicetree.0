From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RESEND] phy: rcar-gen2: Add r8a7743/5 support
Date: Wed, 25 Oct 2017 16:00:10 +0530
Message-ID: <87211738-8d65-32c0-fb6b-dc2cd395016a@ti.com>
References: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
 <bcfa1e90-c497-ee29-687d-9f9a04ce2d4b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <bcfa1e90-c497-ee29-687d-9f9a04ce2d4b@ti.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Wednesday 18 October 2017 05:10 PM, Kishon Vijay Abraham I wrote:
> 
> 
> On Monday 09 October 2017 03:52 PM, Biju Das wrote:
>> Add USB PHY support for r8a7743/5 SoC. Renesas RZ/G1[ME] (R8A7743/5)
>> USB PHY is identical to the R-Car Gen2 family.
>>
>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> Acked-by: Simon Horman <horms+renesas@verge.net.au>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> merged, thanks!

just realized $subject is misleading since this is only dt-binding patch. Do
you plan to send the driver patch too?

Thanks
Kishon
> 
> -Kishon
>> ---
>> This patch is tested against Linux next tag next-20170929.
>>
>>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>> index 91da947..eeb9e18 100644
>> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>> @@ -4,10 +4,13 @@ This file provides information on what the device node for the R-Car generation
>>  2 USB PHY contains.
>>  
>>  Required properties:
>> -- compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>> +- compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A7743 SoC.
>> +	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
>> +	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>>  	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>>  	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
>> -	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible device.
>> +	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 or
>> +					  RZ/G1 compatible device.
>>  
>>  	      When compatible with the generic version, nodes must list the
>>  	      SoC-specific version corresponding to the platform first
>>
