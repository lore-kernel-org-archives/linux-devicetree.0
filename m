From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 3/3] ARM: dts: da850: Add node for pullup/pulldown pinconf
Date: Wed, 23 Nov 2016 10:24:06 -0600
Message-ID: <06bc8517-8c33-85a1-9d5a-29042c7281db@lechnology.com>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
 <1479871767-20160-4-git-send-email-david@lechnology.com>
 <8c3e6535-4b79-9731-f801-c13f007e48ab@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8c3e6535-4b79-9731-f801-c13f007e48ab@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>, =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/23/2016 05:12 AM, Sekhar Nori wrote:
> On Wednesday 23 November 2016 08:59 AM, David Lechner wrote:
>> This SoC has a separate pin controller for configuring pullup/pulldown
>> bias on groups of pins.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---
>>  arch/arm/boot/dts/da850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>> index 8945815..1c0224c 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -210,6 +210,11 @@
>>  			};
>>
>>  		};
>> +		pinconf: pin-controller@22c00c {
>> +			compatible = "ti,da850-pupd";
>> +			reg = <0x22c00c 0x8>;
>> +			status = "disabled";
>> +		};
>
> Can you please place this below the i2c1 node. I am trying to keep the
> nodes sorted by unit address. I know thats broken in many places today,
> but lets add the new ones where they should eventually end up.

I can do this, but it seems that the predominant sorting pattern here is 
to keep subsystems together (e.g. all i2c are together, all uart are 
together, etc.)

Would a separate patch to sort everything by unit address to get this 
cleaned up be acceptable?

>
> Thanks,
> Sekhar
>
