From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] arm64: dts: marvell: mcbin: enlarge PCI memory window
Date: Fri, 17 May 2019 22:55:50 +0200
Message-ID: <f633e7d1-264b-8a17-7bc0-452ab38883af@gmx.de>
References: <20190517161123.9293-1-xypron.glpk@gmx.de>
 <87k1eozvxb.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87k1eozvxb.fsf@FE-laptop>
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
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 5/17/19 10:08 PM, Gregory CLEMENT wrote:
> Hi Heinrich Schuchardt,
>
>> Running a graphics adapter on the MACCHIATObin fails due to an
>> insufficently sized memory window.
> I think "insufficient" is enough or I miss something.

Thanks for reviewing. Do I have to resend with corrected wording?

>
>>
>> Enlarge the memory window for the PCIe slot to 512 MiB.
>>
>> With the patch I am able to use a GT710 graphics adapter with 1 GB onboard
>> memory.
>>
>> These are the mapped memory areas that the graphics adapter is actually
>> using:
>>
>> Region 0: Memory at cc000000 (32-bit, non-prefetchable) [size=16M]
>> Region 1: Memory at c0000000 (64-bit, prefetchable) [size=128M]
>> Region 3: Memory at c8000000 (64-bit, prefetchable) [size=32M]
>> Region 5: I/O ports at 1000 [size=128]
>> Expansion ROM at ca000000 [disabled] [size=512K]
>
>>From my point of view this patch is correct, I don't think it is a
> problem to map more memory. So I applied on it mvebu/dt64.
>

To which repository are your referring?

Best regards

Heinrich

> But I add also Thomas in CC who know better the PCIe support on mvebu/
>
> Thanks,
>
> Gregory
>
>
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> ---
>>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
>> index 329f8ceeebea..205071b45a32 100644
>> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
>> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
>> @@ -184,6 +184,8 @@
>>  	num-lanes = <4>;
>>  	num-viewport = <8>;
>>  	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
>> +	ranges = <0x81000000 0x0 0xf9010000 0x0 0xf9010000 0x0 0x10000
>> +		  0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
>>  	status = "okay";
>>  };
>>
>> --
>> 2.20.1
>>
>
