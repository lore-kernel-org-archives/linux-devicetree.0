From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: berlin4ct: switch to Cortex-A53 specific
 pmu nodes
Date: Wed, 6 Jul 2016 20:00:18 +0200
Message-ID: <577D4732.8090900@gmail.com>
References: <1450191475-1371-1-git-send-email-jszhang@marvell.com>
 <5671C9E6.9080701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5671C9E6.9080701@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jisheng Zhang <jszhang@marvell.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 16.12.2015 21:30, Sebastian Hesselbarth wrote:
> On 15.12.2015 15:57, Jisheng Zhang wrote:
>> Commit ac82d1277215 ("arm64: perf: add Cortex-A53 support") adds the
>> cortex A53 PMU support, thus instead of using the generic armv8-pmuv3
>> compatibility use the more specific Cortex A53 compatibility.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
>> ---
>> Since v1:
>>  - keep "arm,armv8-pmuv3" as a fallback in the compatible list. Thank
>>    Arnd and Mark.
> 
> Applied to berlin64/dt with an updated commit message that
> reflects v2 changes.

Unfortunately, I was too busy to get this upstream earlier.
I re-applied this to the current berlin64/dt.

Sebastian

>>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
>> index 099ad93..f926256 100644
>> --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
>> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
>> @@ -115,7 +115,7 @@
>>  	};
>>  
>>  	pmu {
>> -		compatible = "arm,armv8-pmuv3";
>> +		compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
>>  		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
>>  			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
>>  			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
>>
> 
