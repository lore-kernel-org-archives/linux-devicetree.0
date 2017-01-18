From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 13:25:37 +0000
Message-ID: <fc58dd17-a46a-e7ff-7ad4-5c3539ffaf93@arm.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
 <aa0cb86e-ede2-432b-6248-92679fc06578@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <aa0cb86e-ede2-432b-6248-92679fc06578@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, arm@kernel.org, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Sascha Hauer <kernel@pengutronix.de>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Antoine Tenart <antoine.tenart@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, Fabio Estevam <fabio.estevam@nxp.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Shawn Guo <shawnguo@kern>
List-Id: devicetree@vger.kernel.org

On 18/01/17 11:57, Robin Murphy wrote:
> On 18/01/17 10:53, Marc Zyngier wrote:
>> Since everybody copied my own mistake from the DT binding example,
>> let's address all the offenders in one swift go.
>>
>> Most of them got the CPU interface size wrong (4kB, while it should
>> be 8kB), except for both keystone platforms which got the control
>> interface wrong (4kB instead of 8kB).
>>
>> In the couple of cases were I knew for sure what implementation
> 
>                          where
> 
>> was used, I've added the "arm,gic-400" compatible string. I'm 99%
>> sure that this is what everyong is using, but short of having the
> 
>                          everyone
> 
>> TRM for all the other SoCs, I've let them alone.
>>
>> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
>> ---
> [...]
>> diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
>> index 63c7cf0..07bf300 100644
>> --- a/arch/arm/boot/dts/keystone-k2g.dtsi
>> +++ b/arch/arm/boot/dts/keystone-k2g.dtsi
>> @@ -45,7 +45,7 @@
>>  		interrupt-controller;
>>  		reg = <0x0 0x02561000 0x0 0x1000>,
>>  		      <0x0 0x02562000 0x0 0x2000>,
>> -		      <0x0 0x02564000 0x0 0x1000>,
>> +		      <0x0 0x02564000 0x0 0x2000>,
>>  		      <0x0 0x02566000 0x0 0x2000>;
>>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
>>  				IRQ_TYPE_LEVEL_HIGH)>;
>> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
>> index 02708ba..aaff6816 100644
>> --- a/arch/arm/boot/dts/keystone.dtsi
>> +++ b/arch/arm/boot/dts/keystone.dtsi
>> @@ -35,7 +35,7 @@
>>  		interrupt-controller;
>>  		reg = <0x0 0x02561000 0x0 0x1000>,
>>  		      <0x0 0x02562000 0x0 0x2000>,
>> -		      <0x0 0x02564000 0x0 0x1000>,
>> +		      <0x0 0x02564000 0x0 0x2000>,
>>  		      <0x0 0x02566000 0x0 0x2000>;
>>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
>>  				IRQ_TYPE_LEVEL_HIGH)>;
> 
> FWIW I happen to have some public Keystone TRMs handy from my DMA offset
> investigations, and both K2G and K2H explicitly say it's a GIC-400 too.

Ah, brilliant. I'll update the patch accordingly.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
