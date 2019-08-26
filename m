From: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Mon, 26 Aug 2019 12:01:04 +0800
Message-ID: <3813e658-1600-d878-61a4-29b4fe51b281@linux.intel.com>
References: <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
 <20190824211158.5900-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190824211158.5900-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, eswara.kota@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, qi-ming.wu@intel.com, robh@kernel.org, hauke@hauke-m.de
List-Id: devicetree@vger.kernel.org

Hi Martin,

Thanks for your comment.

On 8/25/2019 5:11 AM, Martin Blumenstingl wrote:
> Hi Dilip,
>
>> Add driver for the reset controller present on Intel
>> Lightening Mountain (LGM) SoC for performing reset
>> management of the devices present on the SoC. Driver also
>> registers a reset handler to peform the entire device reset.
> [...]
>> +static const struct of_device_id intel_reset_match[] = {
>> +	{ .compatible = "intel,rcu-lgm" },
>> +	{}
>> +};
> how is this IP block differnet from the one used in many Lantiq SoCs?
> there is already an upstream driver for the RCU IP block on the Lantiq
> SoCs: drivers/reset/reset-lantiq.c
>
> some background:
> Lantiq was started as a spinoff from Infineon in 2009. Intel then
> acquired Lantiq in 2015. source: [0]
> Intel is re-using some of the IP blocks from the MIPS Lantiq SoCs
> (Intel even has some own MIPS SoCs as part of the Lantiq acquisition,
> typically used for PON/GPON/ADSL/VDSL capable network devices).
> Thus I think it is likely that the new "Lightening Mountain" SoCs use
> an updated version of the Lantiq RCU IP.

I would not say there is a fundamental difference since reset is a 
really simple

stuff from all reset drivers.  However, it did have some difference

from existing reset-lantiq.c since SoC becomes more and more complex.

1. reset-lantiq.c use index instead of register offset + bit position.

index reset is good for a small system (< 64). However, it will become very

difficult to use if you have  > 100 reset. So we use register offset + 
bit position

2. reset-lantiq.c does not support device restart which is part of the 
reset in

old lantiq SoC. It moved this part into arch/mips/lantiq directory.

3. reset-lantiqc reset callback doesn't implement what hardware implemented

function. In old SoCs, some bits in the same register can be hardware 
reset clear.

It just call assert + assert. For these SoCs, we should only call 
assert, hardware

will auto deassert.

4. Code not optimized and intel internal review not assessed.

Based on the above findings, I would suggest reset-lantiq.c to move to 
reset-intel-syscon.c

What is your opinion?


Chuanhua

>
>
> Martin
>
>
> [0] https://wikidevi.com/wiki/Lantiq
