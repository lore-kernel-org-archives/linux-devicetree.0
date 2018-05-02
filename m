From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add CAN-FD support
Date: Wed, 2 May 2018 12:41:44 +0300
Message-ID: <a9fd4c0c-7928-e34e-15b3-350c42f9f5bc@cogentembedded.com>
References: <c184f961-2f98-532f-ed02-6f3751256d9c@cogentembedded.com>
 <f07c00b3-228c-e0d2-f7fe-38b8e9f25a4d@cogentembedded.com>
 <20180502093601.6wokrocz4knh33ds@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180502093601.6wokrocz4knh33ds@verge.net.au>
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
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 5/2/2018 12:36 PM, Simon Horman wrote:

>> Define the generic R8A77980 part of the CAN-FD device node.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks applied with the minor update noted below.

    Thank you!

>> ---
>>   arch/arm64/boot/dts/renesas/r8a77980.dtsi |   31 ++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
[...]
>> @@ -170,6 +177,30 @@
>>   			status = "disabled";
>>   		};
>>   
>> +		canfd: can@e66c0000 {
>> +			compatible = "renesas,r8a77980-canfd",
>> +				     "renesas,rcar-gen3-canfd";
>> +			reg = <0 0xe66c0000 0 0x8000>;
>> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cpg CPG_MOD 914>,
>> +			         <&cpg CPG_CORE R8A77980_CLK_CANFD>,
> 
> checkpatch tells me that line above uses spaces for indentation where
> a tab could be used. I fixed that up when applying the patch.

    Hum, I thought I fixed that... :-/

MBR, Sergei
