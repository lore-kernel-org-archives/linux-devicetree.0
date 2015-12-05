From: Kapil Hali <kapilh@broadcom.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Sat, 5 Dec 2015 17:25:09 +0530
Message-ID: <5662D09D.8020807@broadcom.com>
References: <1449260611-24417-1-git-send-email-kapilh@broadcom.com>
 <1449260611-24417-2-git-send-email-kapilh@broadcom.com>
 <56621C7A.5050202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56621C7A.5050202@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 12/5/2015 4:36 AM, Florian Fainelli wrote:
> On 04/12/15 12:23, Kapil Hali wrote:
>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>> documentation file and create a new binding documentation for
>> Northstar Plus CPU.
>>
>> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
>> ---
>>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 39 ++++++++++++++++++++++
>>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>> new file mode 100644
>> index 0000000..bf08872
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>> @@ -0,0 +1,39 @@
>> +Broadcom Northstar Plus SoC CPU Enable Method
>> +---------------------------------------------
>> +This binding defines the enable method used for starting secondary
>> +CPUs in the following Broadcom SoCs:
>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
>> +
>> +The enable method is specified by defining the following required
>> +properties in the "cpus" device tree node:
>> +  - enable-method = "brcm,bcm-nsp-smp";
>> +  - secondary-boot-reg = <...>;
> 
> That comment is not quite correct with respect to the paragraph below then?
> 
Right, updated in new patch.
>> +
>> +The secondary-boot-reg property is a u32 value that specifies the
>> +physical address of the register which should hold the common
>> +entry point for a secondary CPU. This entry is cpu node specific
>> +and should be added per cpu. E.g., in case of NSP (BCM58625) which
>> +is a dual core CPU SoC, this entry should be added to cpu1 node.
>> +
>> +
>> +Example:
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		enable-method = "brcm,bcm-nsp-smp";
> 
> Based on the requested feedback, this property should now be placed
> under the cpu1 node.
> 
Right, updated in the new patch.
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a9";
>> +			next-level-cache = <&L2>;
>> +			reg = <0>;
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a9";
>> +			next-level-cache = <&L2>;
>> +			reg = <1>;
>> +			secondary-boot-reg = <0xffff042c>;
>> +		};
>> +	};
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
>> index 3a07a87..d191554 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.txt
>> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
>> @@ -190,6 +190,7 @@ nodes to be present and contain the properties described below.
>>  			    "allwinner,sun6i-a31"
>>  			    "allwinner,sun8i-a23"
>>  			    "arm,psci"
>> +			    "brcm,bcm-nsp-smp"
>>  			    "brcm,brahma-b15"
>>  			    "marvell,armada-375-smp"
>>  			    "marvell,armada-380-smp"
>>
> 
> 
Thanks,
Kapil
