From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2] ARC: reset: introduce AXS10x reset driver
Date: Mon, 18 Sep 2017 09:14:38 -0700
Message-ID: <ce7885ab-b87e-ca07-234f-b63811afd86c@synopsys.com>
References: <20170914142842.12225-1-Eugeniy.Paltsev@synopsys.com>
 <1505736441.9807.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505736441.9807.8.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 09/18/2017 05:07 AM, Philipp Zabel wrote:
> On Thu, 2017-09-14 at 17:28 +0300, Eugeniy Paltsev wrote:
>> ARC AXS10x boards support custom IP-block which allows to control
>> reset signals of selected peripherals. For example DW GMAC, etc...
>> This block is controlled via memory-mapped register (AKA CREG) which
>> represents up-to 32 reset lines. This regiter is self-clearing so we
>> don't need to deassert line after reset.
>>
>> As of today only the following lines are used:
>>   - DW GMAC - line 5
>>
>>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> ---
>> Changes v1 -> v2:
>>    * The creg reset register is self-clearing so we don't need to clear it
>>      manually. Fixed it.
>>    * Use reset callback instead of assert/deassert pair.
>>    * Rename reset node in documentation to "reset-controller" for consistency
>>      with the other bindings.
>>    * Use devm_reset_controller_register instead of reset_controller_register
>>
>> NOTE:
>>      This driver couldn't be replaced by reset-simple driver as we mustn't
>>      read from reset register or clear it.
> 
> Thanks, I've applied this patch to the reset/next branch.

Will it be OK for you to apply the corresponding DT update for platform - that way 
I don't have to keep track of when ur branch hits mainline etc.

The chances of any ensuing conflicts are pretty rare - and easy to resolve if at all.

If so, Eugeniy can send the patch ur way !

Thx,
-Vineet
