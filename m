From: Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
Subject: RE: [PATCH v2 1/2] arm64: dts: Add support for NXP LS1028A SoC
Date: Fri, 2 Nov 2018 09:51:49 +0000
Message-ID: <AM6PR04MB4407CDF0EC1DE0442CF205508CCF0@AM6PR04MB4407.eurprd04.prod.outlook.com>
References: <1539760132-3386-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <20181031071413.GI10386@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181031071413.GI10386@tiger>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sudhanshu Gupta <sudhanshu.gupta@nxp.com>, Harninder Rai <harninder.rai@nxp.com>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



>-----Original Message-----
>From: Shawn Guo <shawnguo@kernel.org>
>Sent: Wednesday, October 31, 2018 12:44 PM
>To: Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
>Cc: devicetree@vger.kernel.org; Harninder Rai <harninder.rai@nxp.com>;
>Sudhanshu Gupta <sudhanshu.gupta@nxp.com>; Rajesh Bhagat
><rajesh.bhagat@nxp.com>; linux-arm-kernel@lists.infradead.org; Leo Li
><leoyang.li@nxp.com>
>Subject: Re: [PATCH v2 1/2] arm64: dts: Add support for NXP LS1028A SoC
>> +	compatible = "fsl,ls1028a";
>> +	interrupt-parent = <&gic>;
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a72";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			clocks = <&clockgen 1 0>;
>> +			next-level-cache = <&l2>;
>> +			cpu-idle-states = <&CPU_PH20>;
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a72";
>> +			reg = <0x1>;
>> +			enable-method = "psci";
>> +			clocks = <&clockgen 1 0>;
>> +			next-level-cache = <&l2>;
>> +			cpu-idle-states = <&CPU_PH20>;
>> +		};
>> +
>> +		l2: l2-cache {
>> +			compatible = "cache";
>> +		};
>
>Not sure what's the point of this node without any properties.

Shawn, I looked into the NXP and non-NXP platforms, but all are creating cache nodes with "compatible" being the only property.

Below are example code of how other platforms are creating cache nodes.

1 # xgene_L2_3: l2-cache-3 {
                        compatible = "cache";
                };

2 # L3_0: l3-cache {
                                      compatible = "cache";
                               };

3 # cluster0_l2: l2-cache0 {
                compatible = "cache";
        };
