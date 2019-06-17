From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am65: Add MSMC RAM ranges in
 interconnect node
Date: Mon, 17 Jun 2019 17:54:00 +0300
Message-ID: <3c53679c-4246-43e1-e6d6-2e1c7db201d7@ti.com>
References: <20190529211344.18014-1-s-anna@ti.com>
 <20190530104903.ldcmkunjnk7a5y3c@akan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190530104903.ldcmkunjnk7a5y3c@akan>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Suman Anna <s-anna@ti.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On 30/05/2019 13:49, Nishanth Menon wrote:
> On 16:13-20190529, Suman Anna wrote:
>> From: Roger Quadros <rogerq@ti.com>
>>
>> Add the MSCM RAM address space to the ranges property of the cbass_main
>> interconnect node so that the addresses can be translated properly.
>>
>> This fixes the probe failure in the sram driver for the MSMC RAM node.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>
>> The following error message is seen without this:
>> [    0.480261] sram interconnect@100000:sram@70000000: found no memory resource
>> [    0.487497] sram: probe of interconnect@100000:sram@70000000 failed with error -22
>>
>> regards
>> Suman
>>
>>   arch/arm64/boot/dts/ti/k3-am65.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am65.dtsi b/arch/arm64/boot/dts/ti/k3-am65.dtsi
>> index 50f4be2047a9..68b3f954f1d1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am65.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am65.dtsi
>> @@ -68,6 +68,7 @@
>>   			 <0x00 0x00900000 0x00 0x00900000 0x00 0x00012000>, /* serdes */
>>   			 <0x00 0x01000000 0x00 0x01000000 0x00 0x0af02400>, /* Most peripherals */
>>   			 <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>, /* MAIN NAVSS */
>> +			 <0x00 0x70000000 0x00 0x70000000 0x00 0x00200000>, /* MSMC SRAM */
>>   			 /* MCUSS Range */
>>   			 <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>,
>>   			 <0x00 0x40200000 0x00 0x40200000 0x00 0x00900100>,
>> -- 
>> 2.21.0
>>
> 
> Arrgh.. Nice catch. Thanks. We should consider pulling this in as part
> of early rc fixes please.
> 
> Acked-by: Nishanth Menon <nm@ti.com>

Hmm, what is the failure this causes, except the probe message? SRAM 
driver obviously won't work but is it used for anything at the moment 
anyways?

I would rather queue this towards 5.3.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
