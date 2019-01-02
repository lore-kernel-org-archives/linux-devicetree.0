From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v9 07/12] dt-bindings: mfd: Add a document for PECI client
 MFD
Date: Wed, 2 Jan 2019 10:29:26 -0800
Message-ID: <fa605dae-977f-452a-cd86-2c0db9237892@linux.intel.com>
References: <20181218210417.30140-1-jae.hyun.yoo@linux.intel.com>
 <20181218210417.30140-8-jae.hyun.yoo@linux.intel.com>
 <20181221144754.GS13248@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221144754.GS13248@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 12/21/2018 6:47 AM, Lee Jones wrote:
> On Tue, 18 Dec 2018, Jae Hyun Yoo wrote:
> 
>> This commit adds a dt-bindings document for PECI client MFD.
>>
>> +* Intel PECI client bindings

<snip>

>> +PECI (Platform Environment Control Interface) is a one-wire bus interface that
>> +provides a communication channel from PECI clients in Intel processors and
>> +chipset components to external monitoring or control devices. PECI is designed
>> +to support the following sideband functions:
>> +
>> +- Processor and DRAM thermal management
>> +- Platform Manageability
>> +- Processor Interface Tuning and Diagnostics
>> +- Failure Analysis
>> +
>> +Required properties:
>> +- compatible : Should be "intel,peci-client".
>> +- reg        : Should contain address of a client CPU. According to the PECI
>> +	       specification, client addresses start from 0x30.
>> +
>> +Example:
>> +	peci-bus@0 {
>> +		compatible = "vendor,soc-peci";
>> +		reg = <0x0 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		peci-client@30 {
>> +			compatible = "intel,peci-client";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-client@31 {
>> +			compatible = "intel,peci-client";
>> +			reg = <0x31>;
>> +		};
> 
> The PECI Client driver (masquerading as an MFD driver in this set)
> doesn't actually do anything special.  Instead of detailing it here,
> register the child devices directly instead.
> 

Main purpose of the PECI client driver is providing 'reg' value to its
child devices. If I add the child nodes directly, compiler will make
warnings while building dtb because the child nodes are using the same
unit address.

Thanks,
Jae
