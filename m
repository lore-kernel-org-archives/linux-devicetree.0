From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774c0
 support
Date: Fri, 1 Mar 2019 13:38:57 +0000
Message-ID: <dde90e93-e8ca-acd2-ffd0-976c51ec309f@arm.com>
References: <1544732284-5951-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB1775847A1B243C0B30C69CFBC0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TYXPR01MB1775847A1B243C0B30C69CFBC0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/03/2019 11:49, Fabrizio Castro wrote:
> Hello Marc,
> 
> I am sorry to bother you.
> Do you think you can take this patch?

It already missed the boat for the merge window, as I sent the pull
request last week. Please resend it after -rc1, and I'll pick it up.

Thanks,

	M.

> 
> Thanks,
> Fab
> 
>> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Fabrizio Castro
>> Sent: 13 December 2018 20:18
>> Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774c0 support
>>
>> Document RZ/G2E (R8A774C0) SoC bindings.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> ---
>>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>> b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>> index 8de96a4..f977ea7 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
>> @@ -16,6 +16,7 @@ Required properties:
>>      - "renesas,irqc-r8a7793" (R-Car M2-N)
>>      - "renesas,irqc-r8a7794" (R-Car E2)
>>      - "renesas,intc-ex-r8a774a1" (RZ/G2M)
>> +    - "renesas,intc-ex-r8a774c0" (RZ/G2E)
>>      - "renesas,intc-ex-r8a7795" (R-Car H3)
>>      - "renesas,intc-ex-r8a7796" (R-Car M3-W)
>>      - "renesas,intc-ex-r8a77965" (R-Car M3-N)
>> --
>> 2.7.4
> 


-- 
Jazz is not dead. It just smells funny...
